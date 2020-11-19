package model_service

import (
	"fmt"
	"gfast/app/model/admin/model_fields"
	"gfast/app/model/admin/model_info"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
)

// 添加
func AddFieldsSave(req *model_fields.AddReq) error {
	return model_fields.AddSave(req)
}

// 删除
func DeleteFieldsByIds(Ids []int) error {
	return model_fields.DeleteByIds(Ids)
}

//修改
func EditFieldsSave(editReq *model_fields.EditReq) error {
	return model_fields.EditSave(editReq)
}

// 根据ID查询
func GetFieldsByID(id int64) (*model_fields.Entity, error) {
	return model_fields.GetByID(id)
}

// 分页查询
func SelectFieldsAll(req *model_fields.SelectPageReq) (list []*model_fields.FieldInfo, err error) {
	var fieldEntities []*model_fields.Entity
	fieldEntities, err = model_fields.SelectListAll(req)
	if err != nil {
		return
	}
	//获取模型信息
	var modelInfo *model_info.Entity
	modelInfo, err = model_info.GetByID(req.ModelId)
	if err != nil {
		return
	}
	if modelInfo == nil || fieldEntities == nil {
		return
	}
	list = make([]*model_fields.FieldInfo, len(fieldEntities))
	for key, field := range fieldEntities {
		fInfo := new(model_fields.FieldInfo)
		fInfo.ModelId = field.ModelId
		fInfo.FieldId = field.FieldId
		fInfo.FieldName = field.FieldName
		fInfo.FieldTitle = field.FieldTitle
		fInfo.FieldType = field.FieldType
		fInfo.FieldRules = field.FieldRules
		fInfo.FieldDefault = field.FieldDefault
		fInfo.FieldWidth = field.FieldWidth
		fInfo.FieldAlign = field.FieldAlign
		if gstr.ContainsI(modelInfo.SearchList, field.FieldName) {
			//列表查询
			fInfo.SearchList = "1"
		}
		if gstr.ContainsI(modelInfo.ModelSort, field.FieldName) {
			//列表排序
			fInfo.ModelSort = "1"
		}
		if gstr.ContainsI(modelInfo.ModelList, field.FieldName) {
			//列表显示
			fInfo.ModelList = "1"
		}
		if gstr.ContainsI(modelInfo.ModelEdit, field.FieldName) {
			//可编辑
			fInfo.ModelEdit = "1"
		}
		if gstr.ContainsI(modelInfo.ModelIndexes, field.FieldName) {
			//索引字段
			fInfo.ModelIndexes = "1"
		}
		if modelInfo.ModelPk == field.FieldName {
			//主键
			fInfo.ModelPk = "1"
		}
		list[key] = fInfo
	}
	return
}

//设置字段属性
func SetFieldsAttr(req *model_fields.SetFieldsAttrReq) error {
	infoReq := new(model_info.FieldsAttrReq)
	infoReq.ModelId = req.ModelId
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("开启事务处理失败")
	}

	for key, field := range req.FieldsList {
		field.FieldSort = gconv.Int64(key)
		if field.FieldId == req.PkId {
			infoReq.ModelPk = field.FieldName
		}
		if field.ModelEdit == "1" {
			//可编辑字段
			infoReq.ModelEdit += fmt.Sprintf(",%s", field.FieldName)
		}
		if field.ModelIndexes == "1" {
			//索引字段
			infoReq.ModelIndexes += fmt.Sprintf(",%s", field.FieldName)
		}
		if field.ModelList == "1" {
			//列表显示字段
			infoReq.ModelList += fmt.Sprintf(",%s", field.FieldName)
		}
		if field.ModelSort == "1" {
			//列表排序字段
			infoReq.ModelSort += fmt.Sprintf(",%s", field.FieldName)
		}
		if field.SearchList == "1" {
			//列表查询字段
			infoReq.SearchList += fmt.Sprintf(",%s", field.FieldName)
		}

		//修改字段排序
		entity := new(model_fields.Entity)
		err = tx.Table(model_fields.Table).Struct(entity, g.Map{"field_id": field.FieldId})
		if err != nil || entity == nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("设置字段排序失败")
		}
		entity.FieldSort = field.FieldSort
		_, err = entity.Save()
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("保存字段排序失败")
		}
	}
	infoReq.ModelEdit = gstr.TrimLeftStr(infoReq.ModelEdit, ",")
	infoReq.ModelIndexes = gstr.TrimLeftStr(infoReq.ModelIndexes, ",")
	infoReq.ModelList = gstr.TrimLeftStr(infoReq.ModelList, ",")
	infoReq.ModelSort = gstr.TrimLeftStr(infoReq.ModelSort, ",")
	infoReq.SearchList = gstr.TrimLeftStr(infoReq.SearchList, ",")
	modelInfo := new(model_info.Entity)
	err = tx.Table(model_info.Table).Struct(modelInfo, g.Map{"model_id": req.ModelId})
	if err != nil || modelInfo == nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("获取模型信息失败")
	}
	modelInfo.ModelPk = infoReq.ModelPk
	modelInfo.ModelEdit = infoReq.ModelEdit
	modelInfo.ModelIndexes = infoReq.ModelIndexes
	modelInfo.ModelList = infoReq.ModelList
	modelInfo.ModelSort = infoReq.ModelSort
	modelInfo.SearchList = infoReq.SearchList
	_, err = model_info.Save(modelInfo)
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("设置模型字段属性失败")
	}
	tx.Commit()
	return nil
}
