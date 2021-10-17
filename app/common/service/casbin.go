package service

import (
	"gfast/app/common/dao"
	dbModel "gfast/app/common/model"
	"github.com/casbin/casbin/v2"
	"github.com/casbin/casbin/v2/model"
	"github.com/casbin/casbin/v2/persist"
	"github.com/gogf/gf/frame/g"
	"sync"
)

type cabin struct{}

type adapterCasbin struct {
	Enforcer    *casbin.SyncedEnforcer
	EnforcerErr error
}

var (
	Casbin = new(cabin)
	once   sync.Once
	m      sync.RWMutex
	ac     *adapterCasbin
)

// GetEnforcer 获取adapter单例对象
func (s *cabin) GetEnforcer() (enforcer *casbin.SyncedEnforcer, err error) {
	once.Do(func() {
		ac = s.newAdapter()
	})
	enforcer = ac.Enforcer
	err = ac.EnforcerErr
	return
}

//初始化adapter操作
func (s *cabin) newAdapter() (a *adapterCasbin) {
	a = new(adapterCasbin)
	a.initPolicy()
	return
}

func (a *adapterCasbin) initPolicy() {
	// Because the DB is empty at first,
	// so we need to load the policy from the file adapter (.CSV) first.
	e, err := casbin.NewSyncedEnforcer(g.Cfg().GetString("casbin.modelFile"),
		g.Cfg().GetString("casbin.policyFile"))

	if err != nil {
		a.EnforcerErr = err
		return
	}

	// This is a trick to save the current policy to the DB.
	// We can't call e.SavePolicy() because the adapter in the enforcer is still the file adapter.
	// The current policy means the policy in the Casbin enforcer (aka in memory).
	//err = a.SavePolicy(e.GetModel())
	//if err != nil {
	//	return err
	//}
	//set adapter
	e.SetAdapter(a)
	// Clear the current policy.
	e.ClearPolicy()
	a.Enforcer = e
	// Load the policy from DB.
	err = a.LoadPolicy(e.GetModel())
	if err != nil {
		a.EnforcerErr = err
		return
	}
}

// SavePolicy saves policy to database.
func (a *adapterCasbin) SavePolicy(model model.Model) (err error) {
	err = a.dropTable()
	if err != nil {
		return
	}
	err = a.createTable()
	if err != nil {
		return
	}
	for ptype, ast := range model["p"] {
		for _, rule := range ast.Policy {
			line := savePolicyLine(ptype, rule)
			_, err := dao.CasbinRule.Data(line).Insert()
			if err != nil {
				return err
			}
		}
	}

	for ptype, ast := range model["g"] {
		for _, rule := range ast.Policy {
			line := savePolicyLine(ptype, rule)
			_, err := dao.CasbinRule.Data(line).Insert()
			if err != nil {
				return err
			}
		}
	}
	return
}

func (a *adapterCasbin) dropTable() (err error) {
	return
}

func (a *adapterCasbin) createTable() (err error) {
	return
}

// LoadPolicy loads policy from database.
func (a *adapterCasbin) LoadPolicy(model model.Model) error {
	var lines []*dbModel.CasbinRule
	if err := dao.CasbinRule.Scan(&lines); err != nil {
		return err
	}
	for _, line := range lines {
		loadPolicyLine(line, model)
	}
	return nil
}

// AddPolicy adds a policy rule to the storage.
func (a *adapterCasbin) AddPolicy(sec string, ptype string, rule []string) error {
	line := savePolicyLine(ptype, rule)
	_, err := dao.CasbinRule.Data(line).Insert()
	return err
}

// RemovePolicy removes a policy rule from the storage.
func (a *adapterCasbin) RemovePolicy(sec string, ptype string, rule []string) error {
	line := savePolicyLine(ptype, rule)
	err := rawDelete(a, line)
	return err
}

// RemoveFilteredPolicy removes policy rules that match the filter from the storage.
func (a *adapterCasbin) RemoveFilteredPolicy(sec string, ptype string,
	fieldIndex int, fieldValues ...string) error {
	line := &dbModel.CasbinRule{}
	line.Ptype = ptype
	if fieldIndex <= 0 && 0 < fieldIndex+len(fieldValues) {
		line.V0 = fieldValues[0-fieldIndex]
	}
	if fieldIndex <= 1 && 1 < fieldIndex+len(fieldValues) {
		line.V1 = fieldValues[1-fieldIndex]
	}
	if fieldIndex <= 2 && 2 < fieldIndex+len(fieldValues) {
		line.V2 = fieldValues[2-fieldIndex]
	}
	if fieldIndex <= 3 && 3 < fieldIndex+len(fieldValues) {
		line.V3 = fieldValues[3-fieldIndex]
	}
	if fieldIndex <= 4 && 4 < fieldIndex+len(fieldValues) {
		line.V4 = fieldValues[4-fieldIndex]
	}
	if fieldIndex <= 5 && 5 < fieldIndex+len(fieldValues) {
		line.V5 = fieldValues[5-fieldIndex]
	}
	err := rawDelete(a, line)
	return err
}

func loadPolicyLine(line *dbModel.CasbinRule, model model.Model) {
	lineText := line.Ptype
	if line.V0 != "" {
		lineText += ", " + line.V0
	}
	if line.V1 != "" {
		lineText += ", " + line.V1
	}
	if line.V2 != "" {
		lineText += ", " + line.V2
	}
	if line.V3 != "" {
		lineText += ", " + line.V3
	}
	if line.V4 != "" {
		lineText += ", " + line.V4
	}
	if line.V5 != "" {
		lineText += ", " + line.V5
	}
	persist.LoadPolicyLine(lineText, model)
}

func savePolicyLine(ptype string, rule []string) *dbModel.CasbinRule {
	line := &dbModel.CasbinRule{}
	line.Ptype = ptype
	if len(rule) > 0 {
		line.V0 = rule[0]
	}
	if len(rule) > 1 {
		line.V1 = rule[1]
	}
	if len(rule) > 2 {
		line.V2 = rule[2]
	}
	if len(rule) > 3 {
		line.V3 = rule[3]
	}
	if len(rule) > 4 {
		line.V4 = rule[4]
	}
	if len(rule) > 5 {
		line.V5 = rule[5]
	}
	return line
}

func rawDelete(a *adapterCasbin, line *dbModel.CasbinRule) error {
	db := dao.CasbinRule.Where("ptype = ?", line.Ptype)
	if line.V0 != "" {
		db = db.Where("v0 = ?", line.V0)
	}
	if line.V1 != "" {
		db = db.Where("v1 = ?", line.V1)
	}
	if line.V2 != "" {
		db = db.Where("v2 = ?", line.V2)
	}
	if line.V3 != "" {
		db = db.Where("v3 = ?", line.V3)
	}
	if line.V4 != "" {
		db = db.Where("v4 = ?", line.V4)
	}
	if line.V5 != "" {
		db = db.Where("v5 = ?", line.V5)
	}
	_, err := db.Delete()
	return err
}
