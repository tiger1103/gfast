package model_fields

import "github.com/gogf/gf/frame/g"

//模型字段规则
type FieldRule struct {
	FType     string      `json:"type"`
	FTitle    string      `json:"title"`
	FField    string      `json:"field"`
	FValue    interface{} `json:"value"`
	FOptions  g.List      `json:"options"`
	FAttr     g.Map       `json:"attr"` //设置组件普通的 HTML 特性
	FProps    g.Map       `json:"props"`
	FValidate []Validate  `json:"validate"`
}

//字段验证规则
type Validate struct {
	VType     string `json:"type"`
	VRequired bool   `json:"required"`
	VMessage  string `json:"message"`
	VMin      int64  `json:"min"`
	VTrigger  string `json:"trigger"`
}
