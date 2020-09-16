package com_model_service

import (
	"encoding/json"
	"gfast/app/model/admin/model_fields"
	"gfast/app/model/admin/model_info"
	"gfast/app/model/admin/sys_dict_type"
	"gfast/library/utils"
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

//通过模型ID获取模型字段规则
func GetModelRuleByModelId(r *ghttp.Request, modelId int64, masterId int64) (rules []*model_fields.FieldRule, err error) {
	//1.获取模型信息
	modelInfo, err := model_info.GetByID(modelId)
	if err != nil {
		return
	}
	//获取模型字段信息
	args := &model_fields.SelectPageReq{
		ModelId: modelId,
	}
	//2.字段信息
	modelFields, err := model_fields.SelectListAll(args)
	if err != nil {
		return
	}
	//3.获取字段数据
	//表前缀
	dbPrefix := g.DB().GetPrefix()
	var fieldData gdb.Record
	if masterId != 0 {
		fieldData, err = g.DB().Table(dbPrefix+modelInfo.ModelName).Where(modelInfo.ModelPk, masterId).FindOne()
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取模型字段数据失败")
			return
		}
	}
	//获取可编辑字段
	fieldEdit := garray.NewStrArrayFrom(gstr.Split(modelInfo.ModelEdit, ","))
	for _, field := range modelFields {
		rule := &model_fields.FieldRule{
			FOptions:  g.List{},
			FAttr:     g.Map{},
			FProps:    g.Map{},
			FValidate: make([]model_fields.Validate, 0),
		}
		fAttr := g.Map{}
		//主键跳过不在表单显示
		if field.FieldName == modelInfo.ModelPk {
			continue
		}
		//过滤不可编辑字段
		if !fieldEditAble(field.FieldName, fieldEdit) {
			continue
		}
		//字段规则
		fieldRules := garray.NewStrArrayFrom(gstr.Split(field.FieldRules, ","))
		//隐藏字段处理
		if fieldRules.Contains("hidden") {
			continue
		}
		rule.FField = field.FieldName
		rule.FTitle = field.FieldTitle
		rule.FValue = field.FieldDefault
		//必填验证
		if fieldRules.Contains("required") {
			validate := model_fields.Validate{
				VType:     "string",
				VRequired: true,
				VMessage:  rule.FTitle + "不能为空",
				VTrigger:  "blur",
			}
			rule.FValidate = append(rule.FValidate, validate)
		}
		//只读规则
		if fieldRules.Contains("fAttr") {
			fAttr["readonly"] = true
		}

		switch field.FieldType {
		case "baidu_map":
		case "text":
			rule.FType = "input"
			if fieldData != nil {
				rule.FValue = fieldData[field.FieldName]
			}
		case "number", "large_number", "currency":
			rule.FType = "inputNumber"
			//非负
			if fieldRules.Contains("unsigned") {
				validate := model_fields.Validate{
					VType:     "number",
					VRequired: true,
					VMin:      0,
					VMessage:  rule.FTitle + "不能为负数",
				}
				rule.FValidate = append(rule.FValidate, validate)
			}
			if fieldData != nil {
				rule.FValue = fieldData[field.FieldName]
			}
		case "datetime":
			rule.FType = "DatePicker"
			rule.FProps = g.Map{
				"type":        "datetime",
				"format":      "yyyy-MM-dd HH:mm:ss",
				"placeholder": "请选择" + field.FieldTitle,
			}
			if fieldData != nil {
				rule.FValue = utils.TimeStampToDateTime(gconv.Int64(fieldData[field.FieldName]))
			} else if field.FieldDefault == "" {
				rule.FValue = gtime.Now().Format("Y-m-d H:i:s")
			}
		case "date":
			rule.FType = "DatePicker"
			rule.FProps = g.Map{
				"format":      "yyyy-MM-dd",
				"placeholder": "请选择" + field.FieldTitle,
			}
			if fieldData != nil {
				rule.FValue = utils.TimeStampToDate(gconv.Int64(fieldData[field.FieldName]))
			} else if field.FieldDefault == "" {
				rule.FValue = gtime.Now().Format("Y-m-d")
			}
		case "switch":
			rule.FType = "switch"
			rule.FProps = g.Map{
				"activeValue":   "1",
				"inactiveValue": "0",
			}
			if fieldData != nil {
				rule.FValue = fieldData[field.FieldName]
			}
		case "bigtext":
			rule.FType = "input"
			rule.FProps = g.Map{
				"type":        "textarea",
				"placeholder": "请输入" + field.FieldTitle,
				"rows":        5,
			}
			if fieldData != nil {
				rule.FValue = fieldData[field.FieldName]
			}
		case "richtext":
			rule.FType = "Editor"
			if fieldData != nil {
				rule.FValue = fieldData[field.FieldName]
			}
		case "selectnumber", "selecttext":
			rule.FType = "select"
			rule.FOptions, err = fieldOptionConv(field.FieldData)
			if err != nil {
				return
			}
			for k, _ := range rule.FValidate {
				rule.FValidate[k].VTrigger = "change"
			}
			if fieldData != nil {
				rule.FValue = gconv.String(fieldData[field.FieldName])
			}
		case "checkbox":
			rule.FType = "checkbox"
			if fieldData != nil {
				rule.FValue = gstr.Split(gconv.String(fieldData[field.FieldName]), ",")
			} else {
				if field.FieldDefault != "" {
					rule.FValue = gstr.Split(field.FieldDefault, ",")
				} else {
					rule.FValue = g.Slice{}
				}
			}
			rule.FOptions, err = fieldOptionConv(field.FieldData)
			if err != nil {
				return
			}
			for k, _ := range rule.FValidate {
				rule.FValidate[k].VType = "array"
				rule.FValidate[k].VTrigger = "change"
			}
		case "file", "files":
			rule.FType = "upFile"
			if fieldData != nil {
				type fileMap map[string]interface{}
				var filesSlice []fileMap
				filesByte := gconv.Bytes(fieldData[field.FieldName])
				if len(filesByte) > 0 {
					err = json.Unmarshal(filesByte, &filesSlice)
					if err != nil {
						g.Log().Error(err)
						err = gerror.New("获取附件信息失败")
						return
					}
				}
				for k, fm := range filesSlice {
					filesSlice[k]["url"], err = utils.GetRealFilesUrl(r, gconv.String(fm["url"]))
					if err != nil {
						return
					}
				}
				rule.FValue = filesSlice
			} else {
				if field.FieldDefault != "" {
					rule.FValue = gjson.New(field.FieldDefault)
				} else {
					rule.FValue = g.Slice{}
				}
			}
			limit := 1
			multiple := false
			if field.FieldType == "files" {
				limit = 6
				multiple = true
			}
			rule.FProps = g.Map{
				"type":       "select",
				"uploadType": "file",
				"action":     "/system/upload/upFile",
				"name":       "file",
				"multiple":   multiple,
				"limit":      limit,
			}
		case "imagefile", "images":
			rule.FType = "upload"
			limit := 1
			multiple := false
			if field.FieldType == "images" {
				limit = 6
				multiple = true
				if fieldData != nil {
					imgStr := gconv.String(fieldData[field.FieldName])
					if imgStr != "" {
						imgs := gstr.Split(imgStr, ",")
						for k, img := range imgs {
							imgs[k], err = utils.GetRealFilesUrl(r, img)
							if err != nil {
								return
							}
						}
						rule.FValue = imgs
					} else {
						rule.FValue = g.Slice{}
					}
				} else {
					if field.FieldDefault != "" {
						rule.FValue = gstr.Split(field.FieldDefault, ",")
					} else {
						rule.FValue = g.Slice{}
					}
				}
			} else {
				if fieldData != nil {
					imgStr := gconv.String(fieldData[field.FieldName])
					if imgStr != "" {
						rule.FValue, err = utils.GetRealFilesUrl(r, imgStr)
						if err != nil {
							return
						}
					} else {
						rule.FValue = ""
					}
				} else {
					if field.FieldDefault != "" {
						rule.FValue = field.FieldDefault
					} else {
						rule.FValue = ""
					}
				}
			}
			rule.FProps = g.Map{
				"type":       "select",
				"uploadType": "image",
				"action":     "/system/upload/upImg",
				"name":       "file",
				"multiple":   multiple,
				"accept":     "image/*",
				"limit":      limit,
			}
		case "DepartmentSelector":
			rule.FType = "DepartmentSelector"
			if fieldData != nil {
				rule.FValue = gstr.Split(gconv.String(fieldData[field.FieldName]), ",")
			} else {
				if field.FieldDefault != "" {
					rule.FValue = gstr.Split(field.FieldDefault, ",")
				} else {
					rule.FValue = g.Slice{}
				}
			}
			rule.FProps = g.Map{
				"dataListApi": "/api/v1/govWork/options/getDepartmentSelector",
			}
		default:
			err = gerror.New("未知字段" + field.FieldName + "，类型：" + field.FieldType)
			return
		}
		rule.FAttr = fAttr
		rules = append(rules, rule)
	}

	return
}

//保存模型字段数据
//modelId  模型ID
//data  字段数据
//masterId 主表主键ID
func HandlePostData(modelId int64, data g.Map, masterId int64, tx *gdb.TX, isUpdate bool) (err error) {
	//表前缀
	dbPrefix := g.DB().GetPrefix()
	//1.获取模型信息
	modelInfo, err := model_info.GetByID(modelId)
	if err != nil {
		return
	}
	//获取模型字段信息
	//字段信息
	args := &model_fields.SelectPageReq{
		ModelId: modelId,
	}
	modelFields, err := model_fields.SelectListAll(args)
	if err != nil {
		return
	}
	//获取可编辑字段
	fieldEdit := garray.NewStrArrayFrom(gstr.Split(modelInfo.ModelEdit, ","))
	insertData := g.Map{}
	for _, field := range modelFields {
		//主键
		if field.FieldName == modelInfo.ModelPk {
			insertData[field.FieldName] = masterId
		}
		//过滤不可编辑字段
		if !fieldEditAble(field.FieldName, fieldEdit) {
			continue
		}
		//字段规则
		fieldRules := garray.NewStrArrayFrom(gstr.Split(field.FieldRules, ","))
		switch field.FieldType {
		case "images":
			//图片上传
			picArr := gconv.SliceStr(data[field.FieldName])
			for k, a := range picArr {
				picArr[k], err = utils.GetFilesPath(a)
				g.Log().Error(picArr)
				if err != nil {
					return
				}
			}
			insertData[field.FieldName] = gstr.Join(picArr, ",")
		case "files", "file":
			//文件上传
			fileArr := gconv.SliceMap(data[field.FieldName])
			for k, fa := range fileArr {
				fileArr[k]["url"], err = utils.GetFilesPath(gconv.String(fa["url"]))
				if err != nil {
					return
				}
			}
			insertData[field.FieldName] = gconv.String(fileArr)
		case "imagefile":
			//单图上传
			if _, ok := data[field.FieldName].(string); !ok {
				err = gerror.New("单图片上传字段必须是一个字符串")
				return
			}
			imgStr := gconv.String(data[field.FieldName])
			if imgStr != "" {
				imgStr, err = utils.GetFilesPath(imgStr)
				if err != nil {
					return
				}
			}
			insertData[field.FieldName] = imgStr
		case "baidu_map", "text", "bigtext", "switch", "richtext":
			insertData[field.FieldName] = data[field.FieldName]
		case "number", "large_number":
			insertData[field.FieldName] = gconv.Int64(data[field.FieldName])
		case "currency":
			insertData[field.FieldName] = currencyLong(data[field.FieldName])
		case "datetime", "date":
			insertData[field.FieldName] = utils.StrToTimestamp(gconv.String(data[field.FieldName]))
		case "selectnumber":
			insertData[field.FieldName] = gconv.Int64(data[field.FieldName])
			var b bool
			//验证字段数据
			b, err = fieldOptionValid(field.FieldData, insertData[field.FieldName])
			if err != nil {
				return
			}
			if fieldRules.Contains("required") && !b {
				err = gerror.New(field.FieldTitle + "数据无效")
				return
			}
		case "selecttext":
			insertData[field.FieldName] = gstr.Trim(gconv.String(data[field.FieldName]))
			var b bool
			//验证字段数据
			b, err = fieldOptionValid(field.FieldData, insertData[field.FieldName])
			if err != nil {
				return
			}
			if fieldRules.Contains("required") && !b {
				err = gerror.New(field.FieldTitle + "数据无效")
				return
			}
		case "checkbox":
			checkboxData := data[field.FieldName]
			var b bool
			//验证字段数据
			b, err = fieldOptionValid(field.FieldData, checkboxData)
			if err != nil {
				return
			}
			if fieldRules.Contains("required") && !b {
				err = gerror.New(field.FieldTitle + "数据无效")
				return
			}
			sliceData := gconv.SliceAny(checkboxData)
			dataArr := garray.NewFrom(sliceData)
			insertData[field.FieldName] = dataArr.Join(",")
		case "DepartmentSelector":
			data := gconv.SliceStr(data[field.FieldName])
			insertData[field.FieldName] = gstr.Join(data, ",")
		default:
			err = gerror.New("未知字段：" + field.FieldTitle + field.FieldType)
			return
		}
		//处理特殊规则-必须
		if fieldRules.Contains("required") {
			if val, ok := insertData[field.FieldName].(string); ok && val == "" {
				err = gerror.New(field.FieldTitle + "不能为空")
				return
			}
		}
		//唯一验证
		if fieldRules.Contains("unique") {
			var one gdb.Record
			one, err = g.DB().Table(dbPrefix+modelInfo.ModelName).Where(field.FieldName, insertData[field.FieldName]).FindOne()
			if err != nil {
				g.Log().Error(one)
				err = gerror.New("判断字段" + field.FieldTitle + "唯一性失败")
				return
			}
			if one != nil {
				if !isUpdate || (isUpdate && gconv.Int64(one[modelInfo.ModelPk]) != gconv.Int64(insertData[modelInfo.ModelPk])) {
					err = gerror.New(field.FieldTitle + "已存在")
					return
				}
			}
		}
	}

	//保存模型字段数据
	_, err = tx.Table(dbPrefix + modelInfo.ModelName).Replace(insertData)
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("报错模型数据失败")
		return
	}
	return nil
}

//删除模型字段数据
func DeleteModelFieldData(modelId int64, masterId int64, tx *gdb.TX) (err error) {
	//表前缀
	dbPrefix := g.DB().GetPrefix()
	//1.获取模型信息
	modelInfo, err := model_info.GetByID(modelId)
	if err != nil {
		return
	}
	//删除操作
	_, err = g.DB().Table(dbPrefix+modelInfo.ModelName).TX(tx).Where(modelInfo.ModelPk, masterId).Delete()
	if err != nil {
		g.Log().Error(err)
		err = gerror.New("删除模型数据失败")
		return
	}
	return
}

//字段选项数据解析
func fieldOptionConv(fieldData string) (data g.List, err error) {
	//直接查库操作
	if gstr.Pos(fieldData, "|") > -1 {
		dataInfo := garray.NewStrArrayFrom(gstr.Split(fieldData, "|"))
		var (
			table, fieldK, fieldV, sort, where string
		)
		var has bool = true
		if has {
			table, has = dataInfo.Get(0)
		}
		if has {
			fieldK, has = dataInfo.Get(1)
		}
		if has {
			fieldV, has = dataInfo.Get(2)
		}
		if !has {
			err = gerror.New("数据规则格式不正确，请检查模型字段设置")
		}
		model := g.DB().Table(table).Fields(fieldK + "," + fieldV)
		sort, has = dataInfo.Get(3)
		if has {
			model = model.Order(sort)
		}
		where, has = dataInfo.Get(4)
		if has {
			model = model.Where(where)
		}
		var res gdb.Result
		res, err = model.FindAll()
		if err != nil {
			g.Log().Error(err)
			err = gerror.New("获取模型数据选项失败")
			return
		}
		for _, r := range res {
			data = append(data, g.Map{
				"value":   r[fieldK],
				"label":   r[fieldV],
				"disable": false,
			})
		}
	} else if gstr.Pos(fieldData, ":") == 0 { //从字典库查询
		dictType := gstr.SubStr(fieldData, 1)
		var dict g.Map
		dict, err = sys_dict_type.GetDictWithDataByType(dictType, "", "")
		if err != nil {
			return
		}
		values := gconv.SliceMap(dict["values"])
		for _, val := range values {
			data = append(data, g.Map{
				"value":   val["key"],
				"label":   val["value"],
				"disable": false,
			})
		}
	} else { //硬编码
		dataSlice := gstr.Split(fieldData, ",")
		for _, val := range dataSlice {
			keyVal := gstr.Split(val, ":")
			if len(keyVal) != 2 {
				err = gerror.New("数据规则格式不正确，请检查模型字段设置")
				return
			}
			data = append(data, g.Map{
				"value":   keyVal[0],
				"label":   keyVal[1],
				"disable": false,
			})
		}
	}
	return
}

//判断字段是否可编辑
func fieldEditAble(fieldName string, fieldEdits *garray.StrArray) bool {
	if fieldEdits.Len() == 0 {
		return false
	}
	return fieldEdits.ContainsI(fieldName)
}

//货币转化为分
func currencyLong(currency interface{}) int64 {
	strArr := gstr.Split(gconv.String(currency), ".")
	switch len(strArr) {
	case 1:
		return gconv.Int64(strArr[0]) * 100
	case 2:
		if len(strArr[1]) == 1 {
			strArr[1] += "0"
		} else if len(strArr[1]) > 2 {
			strArr[1] = gstr.SubStr(strArr[1], 0, 2)
		}
		return gconv.Int64(strArr[0])*100 + gconv.Int64(strArr[1])
	}
	return 0
}

//检测字段选项是否有效
func fieldOptionValid(fieldData string, value interface{}) (bool, error) {
	data, err := fieldOptionConv(fieldData)
	if err != nil {
		return false, err
	}
	valueArr := garray.New()
	switch value.(type) {
	case g.Slice:
		valueArr = garray.NewFrom(value.(g.Slice))
	default:
		valueArr.Append(value)
	}
	//去重
	valueArr = valueArr.Unique()
	if valueArr.Len() != 0 {
		r := false //检查提交数据是否在选项数据中
		valueArr.Iterator(func(k int, v interface{}) bool {
			r = false
			for _, d := range data {
				if gstr.Equal(gconv.String(v), gconv.String(d["value"])) {
					r = true
					continue
				}
			}
			return r
		})
		return r, nil
	}
	return true, nil
}
