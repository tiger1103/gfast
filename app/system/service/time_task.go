/*
* @desc:定时任务栈
* @company:云南省奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2021/7/16 17:10
 */

package service

import "github.com/gogf/gf/os/gmutex"

var TimeTaskList = &taskList{
	mu: gmutex.New(),
}

type TimeTask struct {
	FuncName string
	Param    []string
	Run      func()
}

type taskList struct {
	taskList []*TimeTask
	mu       *gmutex.Mutex
}

// AddTask 添加任务
func (s *taskList) AddTask(task *TimeTask) *taskList {
	if task.FuncName == "" || task.Run == nil {
		return s
	}
	s.taskList = append(s.taskList, task)
	return s
}

// GetByName 通过方法名获取对应task信息
func (s *taskList) GetByName(funcName string) *TimeTask {
	var result *TimeTask
	for _, item := range s.taskList {
		if item.FuncName == funcName {
			result = item
			break
		}
	}
	return result
}

// EditParams 修改参数
func (s *taskList) EditParams(funcName string, params []string) {
	s.mu.Lock()
	defer s.mu.Unlock()
	for _, item := range s.taskList {
		if item.FuncName == funcName {
			item.Param = params
			break
		}
	}
}
