package test

import (
	"fmt"
	"gfast/library/utils"
	"github.com/casbin/casbin/v2"
	"github.com/casbin/casbin/v2/util"
	"github.com/gogf/gf/os/glog"
	"testing"
)

func TestDemo(t *testing.T){
	//t.Run("demo1" ,Demo1)
	t.Run("Adapters_test", Adapters)
}

func Demo1(t *testing.T){
	e,err:=casbin.NewEnforcer("casbin_conf/model.conf","casbin_conf/policy.csv")
	if err!=nil{
		panic(err)
	}
	sub := "alice" // the user that wants to access a resource. 对象
	obj := "data1" // the resource that is going to be accessed. 资源
	act := "write" // the operation that the user performs on the resource. 操作
	ok, err := e.Enforce(sub, obj, act)

	if err != nil {
		fmt.Println("验证失败",err)
	}

	if ok == true {
		fmt.Println("权限通过")
	} else {
		fmt.Println("没有权限")
	}
}

func Adapters(t *testing.T) {
	a := initAdapter(t, "mysql", "root:123456@tcp(127.0.0.1:3306)/test2")
	testAutoSave(t, a)
	testSaveLoad(t, a)

	a = initAdapterFormOptions(t, &utils.Adapter{
		DriverName:     "mysql",
		DataSourceName: "root:123456@tcp(127.0.0.1:3306)/test2",
	})
	testAutoSave(t, a)
	testSaveLoad(t, a)
}

func initAdapterFormOptions(t *testing.T, adapter *utils.Adapter) *utils.Adapter {
	// Create an adapter
	a, _ := utils.NewAdapterFromOptions(adapter)
	// Initialize some policy in DB.
	initPolicy(t, a)
	// Now the DB has policy, so we can provide a normal use case.
	// Note: you don't need to look at the above code
	// if you already have a working DB with policy inside.

	return a
}

func initPolicy(t *testing.T, a *utils.Adapter) {
	// Because the DB is empty at first,
	// so we need to load the policy from the file adapter (.CSV) first.
	e, err := casbin.NewEnforcer("casbin_conf/rbac_model.conf", "casbin_conf/rbac_policy.csv")
	if err != nil {
		panic(err)
	}

	// This is a trick to save the current policy to the DB.
	// We can't call e.SavePolicy() because the adapter in the enforcer is still the file adapter.
	// The current policy means the policy in the Casbin enforcer (aka in memory).
	err = a.SavePolicy(e.GetModel())
	if err != nil {
		panic(err)
	}

	// Clear the current policy.
	e.ClearPolicy()
	testGetPolicy(t, e, [][]string{})

	// Load the policy from DB.
	err = a.LoadPolicy(e.GetModel())
	if err != nil {
		panic(err)
	}
	testGetPolicy(t, e, [][]string{{"alice", "data1", "read"}, {"bob", "data2", "write"}, {"data2_admin", "data2", "read"}, {"data2_admin", "data2", "write"}})
}

func testGetPolicy(t *testing.T, e *casbin.Enforcer, res [][]string) {
	myRes := e.GetPolicy()
	glog.Info("Policy: ", myRes)

	if !util.Array2DEquals(res, myRes) {
		t.Error("Policy: ", myRes, ", supposed to be ", res)
	}
}

func initAdapter(t *testing.T, driverName string, dataSourceName string) *utils.Adapter {
	// Create an adapter
	a, err := utils.NewAdapter(driverName, dataSourceName)
	if err != nil {
		panic(err)
	}

	// Initialize some policy in DB.
	initPolicy(t, a)
	// Now the DB has policy, so we can provide a normal use case.
	// Note: you don't need to look at the above code
	// if you already have a working DB with policy inside.

	return a
}

func testAutoSave(t *testing.T, a *utils.Adapter) {

	// NewEnforcer() will load the policy automatically.
	e, err := casbin.NewEnforcer("casbin_conf/rbac_model.conf", a)
	if err!=nil{
		panic(err)
	}
	// AutoSave is enabled by default.
	// Now we disable it.
	e.EnableAutoSave(false)

	// Because AutoSave is disabled, the policy change only affects the policy in Casbin enforcer,
	// it doesn't affect the policy in the storage.
	e.AddPolicy("alice", "data1", "write")
	// Reload the policy from the storage to see the effect.
	e.LoadPolicy()
	// This is still the original policy.
	testGetPolicy(t, e, [][]string{{"alice", "data1", "read"}, {"bob", "data2", "write"}, {"data2_admin", "data2", "read"}, {"data2_admin", "data2", "write"}})

	// Now we enable the AutoSave.
	e.EnableAutoSave(true)

	// Because AutoSave is enabled, the policy change not only affects the policy in Casbin enforcer,
	// but also affects the policy in the storage.
	e.AddPolicy("alice", "data1", "write")
	// Reload the policy from the storage to see the effect.
	e.LoadPolicy()
	// The policy has a new rule: {"alice", "data1", "write"}.
	testGetPolicy(t, e, [][]string{{"alice", "data1", "read"}, {"bob", "data2", "write"}, {"data2_admin", "data2", "read"}, {"data2_admin", "data2", "write"}, {"alice", "data1", "write"}})

	// Remove the added rule.
	e.RemovePolicy("alice", "data1", "write")
	e.LoadPolicy()
	testGetPolicy(t, e, [][]string{{"alice", "data1", "read"}, {"bob", "data2", "write"}, {"data2_admin", "data2", "read"}, {"data2_admin", "data2", "write"}})

	// Remove "data2_admin" related policy rules via a filter.
	// Two rules: {"data2_admin", "data2", "read"}, {"data2_admin", "data2", "write"} are deleted.
	e.RemoveFilteredPolicy(0, "data2_admin")
	e.LoadPolicy()
	testGetPolicy(t, e, [][]string{{"alice", "data1", "read"}, {"bob", "data2", "write"}})
}

func testSaveLoad(t *testing.T, a *utils.Adapter) {
	// Initialize some policy in DB.
	initPolicy(t, a)
	// Note: you don't need to look at the above code
	// if you already have a working DB with policy inside.

	// Now the DB has policy, so we can provide a normal use case.
	// Create an adapter and an enforcer.
	// NewEnforcer() will load the policy automatically.

	e, _ := casbin.NewEnforcer("casbin_conf/rbac_model.conf", a)
	testGetPolicy(t, e, [][]string{{"alice", "data1", "read"}, {"bob", "data2", "write"}, {"data2_admin", "data2", "read"}, {"data2_admin", "data2", "write"}})
}