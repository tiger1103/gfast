package task

func init() {
	var task1 Entity
	task1.FuncName = "test1"
	task1.Param = nil
	task1.Run = Test1
	Add(task1)

	var task2 Entity
	task2.FuncName = "test2"
	task2.Param = nil
	task2.Run = Test2
	Add(task2)
}

//无参测试
func Test1() {
	println("无参测试")
}

//传参测试
func Test2() {
	//获取参数
	task := GetByName("test2")
	if task == nil {
		return
	}
	for _, v := range task.Param {
		println(v)
	}
}
