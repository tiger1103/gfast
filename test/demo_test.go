package test

import (
	"fmt"
	"gfast/library/utils"
	"github.com/casbin/casbin/v2"
	"github.com/casbin/casbin/v2/util"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/mojocn/base64Captcha"
	"testing"
)

func TestDemo(t *testing.T) {
	//t.Run("demo1" ,Demo1)
	//t.Run("Adapters_test", Adapters)
	//t.Run("CaptchaDemo", CaptchaDemo)
	//t.Run("CaptchaVerify", CaptchaVerify)
	t.Run("GTokenTest", GTokenTest)
}

func Demo1(t *testing.T) {
	e, err := casbin.NewEnforcer("casbin_conf/model.conf", "casbin_conf/policy.csv")
	if err != nil {
		panic(err)
	}
	sub := "alice" // the user that wants to access a resource. 对象
	obj := "data1" // the resource that is going to be accessed. 资源
	act := "write" // the operation that the user performs on the resource. 操作
	ok, err := e.Enforce(sub, obj, act)

	if err != nil {
		fmt.Println("验证失败", err)
	}

	if ok == true {
		fmt.Println("权限通过")
	} else {
		fmt.Println("没有权限")
	}
}

func GTokenTest(t *testing.T) {
	// 启动gtoken
	gtoken := &gtoken.GfToken{
		LoginPath:        "/login",
		LoginBeforeFunc:  loginFunc,
		LogoutPath:       "/user/logout",
		AuthPaths:        g.SliceStr{"/system/*"},
		LogoutBeforeFunc: loginOutFunc,
	}
	gtoken.Start()
	s := g.Server()
	s.BindHandler("/system/admin", func(r *ghttp.Request) {
		r.Response.Write("hello admin")
	})
	s.SetPort(8080)
	s.Run()
}

func loginFunc(r *ghttp.Request) (string, interface{}) {
	return "yixiaohu", []g.MapStrStr{{"name": "张三", "age": "18"}, {"name": "李四", "age": "32"}}
}
func loginOutFunc(r *ghttp.Request) bool {
	return true
}
func demoCodeCaptchaCreate() {
	//config struct for digits
	//数字验证码配置
	/*var configD = base64Captcha.ConfigDigit{
		Height:     80,
		Width:      240,
		MaxSkew:    0.7,
		DotCount:   80,
		CaptchaLen: 5,
	}*/
	//config struct for audio
	//声音验证码配置
	/*var configA = base64Captcha.ConfigAudio{
		CaptchaLen: 6,
		Language:   "zh",
	}*/
	//config struct for Character
	//字符,公式,验证码配置
	var configC = base64Captcha.ConfigCharacter{
		Height: 60,
		Width:  240,
		//const CaptchaModeNumber:数字,CaptchaModeAlphabet:字母,CaptchaModeArithmetic:算术,CaptchaModeNumberAlphabet:数字字母混合.
		Mode:               base64Captcha.CaptchaModeNumber,
		ComplexOfNoiseText: base64Captcha.CaptchaComplexLower,
		ComplexOfNoiseDot:  base64Captcha.CaptchaComplexLower,
		IsShowHollowLine:   false,
		IsShowNoiseDot:     false,
		IsShowNoiseText:    false,
		IsShowSlimeLine:    false,
		IsShowSineLine:     false,
		CaptchaLen:         4,
	}
	//创建字符公式验证码.
	//GenerateCaptcha 第一个参数为空字符串,包会自动在服务器一个随机种子给你产生随机uiid.
	idKeyC, capC := base64Captcha.GenerateCaptcha("8nM77YhE2xOvU6GMQ33A", configC)
	//以base64编码
	base64stringC := base64Captcha.CaptchaWriteToBase64Encoding(capC)
	fmt.Println(idKeyC, "\n", base64stringC)
}
func CaptchaDemo(t *testing.T) {
	demoCodeCaptchaCreate()
}

func CaptchaVerify(t *testing.T) {
	if base64Captcha.VerifyCaptchaAndIsClear("8nM77YhE2xOvU6GMQ33A", "0870", false) {
		fmt.Println("验证成功")
	} else {
		fmt.Println("验证失败")
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
	if err != nil {
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
