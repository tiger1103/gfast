package model_service

import (
	"fmt"
	"gfast/app/model/admin/model_fields"
	"gfast/app/model/admin/model_info"
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"os"
	"path/filepath"
	"strconv"
)

// 添加
func AddSave(req *model_info.AddReq) error {
	return model_info.AddSave(req)
}

// 删除
func DeleteByIds(Ids []int) error {
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("事务开启失败")
	}
	//删除模型信息
	err = model_info.DeleteByIds(Ids, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	//删除模型字段信息
	err = model_fields.DeleteByModelIds(Ids, tx)
	if err != nil {
		tx.Rollback()
		return err
	}
	tx.Commit()
	return nil
}

//修改
func EditSave(editReq *model_info.EditReq) error {
	return model_info.EditSave(editReq)
}

// 根据ID查询
func GetByID(id int64) (*model_info.Entity, error) {
	return model_info.GetByID(id)
}

// 分页查询
func SelectListByPage(req *model_info.SelectPageReq) (total int, page int, list []*model_info.ListEntity, err error) {
	return model_info.SelectListByPage(req)
}

func SetInfoStatus(req *model_info.StatusSetReq) error {
	return model_info.SetStatus(req)
}

//模型生成操作
func CreateModel(modelId int64) error {
	//表前缀
	dbPrefix := g.DB().GetPrefix()
	//模型信息
	modelInfo, err := model_info.GetByID(modelId)
	if err != nil {
		return err
	}
	//字段信息
	args := &model_fields.SelectPageReq{
		ModelId: modelId,
	}
	modelFields, err := model_fields.SelectListAll(args)
	if err != nil {
		return err
	}
	if modelFields == nil {
		return gerror.New("请设置模型字段")
	}
	if modelInfo.ModelPk == "" {
		return gerror.New("请设置主键")
	}
	if modelInfo.ModelEngine == "" {
		modelInfo.ModelEngine = "MyISAM"
	}
	//备份旧模型表数据
	err = buildTableExists(dbPrefix, modelInfo.ModelName)
	if err != nil {
		return err
	}
	//重建表操作
	//1、删除旧表
	sql := fmt.Sprintf("DROP TABLE IF EXISTS `%s%s`;", dbPrefix, modelInfo.ModelName)
	_, err = g.DB().Exec(sql)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("删除旧模型数据失败")
	}

	//重建表格
	switch g.Cfg().GetString("database.type") {
	case "mysql":
		sql := "CREATE TABLE `" + dbPrefix + modelInfo.ModelName + "` (" +
			"`" + modelInfo.ModelPk + "` INT UNSIGNED NOT NULL AUTO_INCREMENT," +
			"%FIELDS_SQL%" +
			"%PRIMARY_KEY_SQL%" +
			"%UNIQUE_KEY_SQL%" +
			"%KEY_SQL%" +
			")ENGINE=" + modelInfo.ModelEngine + " AUTO_INCREMENT=1 DEFAULT  CHARACTER SET utf8mb4 COLLATE = utf8mb4_general_ci;"

		SqlFields := garray.NewStrArray()
		SqlPrimaryKey := "PRIMARY KEY (`" + modelInfo.ModelPk + "`)"
		SqlUniqueKey := garray.NewStrArray()
		SqlKey := garray.NewStrArray()
		for _, fi := range modelFields {
			if fi.FieldName == modelInfo.ModelPk {
				continue
			}
			rules := garray.NewStrArrayFrom(gstr.Split(gstr.Replace(fi.FieldRules, " ", ""), ","))
			switch fi.FieldType {
			//百度地图字段，双精度型
			case "baidu_map":
				defal := gstr.Split(fi.FieldDefault, ",")
				if len(defal) == 2 {
					SqlFields.Append(fmt.Sprintf("`%s_lng` DOUBLE NOT NULL DEFAULT %s COMMENT %s", fi.FieldName, defal[0], fi.FieldTitle))
					SqlFields.Append(fmt.Sprintf("`%s_lat` DOUBLE NOT NULL DEFAULT %s COMMENT %s", fi.FieldName, defal[1], fi.FieldTitle))
				} else {
					SqlFields.Append(fmt.Sprintf("`%s_lng` DOUBLE NOT NULL DEFAULT 0 COMMENT %s", fi.FieldName, fi.FieldTitle))
					SqlFields.Append(fmt.Sprintf("`%s_lat` DOUBLE NOT NULL DEFAULT 0 COMMENT %s", fi.FieldName, fi.FieldTitle))
				}
			//变长或固定字符串型
			case "text", "imagefile", "file", "selecttext", "checkbox":
				if fi.FieldLength == "" {
					fi.FieldLength = "200"
				}
				fType := "VARCHAR"
				//固定长度
				if rules.Contains("lengthfixed") {
					fType = "CHAR"
				}
				fNull := ""
				//非空
				if rules.Contains("required") {
					fNull = "NOT NULL"
				}
				SqlFields.Append(fmt.Sprintf("`%s` %s(%s) %s DEFAULT '%s' COMMENT '%s'", fi.FieldName, fType, fi.FieldLength, fNull, fi.FieldDefault, fi.FieldTitle))
			//bigint型
			case "currency", "large_number", "datetime", "date":
				fUnsigned := ""
				//非负数
				if rules.Contains("unsigned") || fi.FieldType == "date" || fi.FieldType == "datetime" {
					fUnsigned = "UNSIGNED"
				}

				fNull := "NOT NULL"
				if fi.FieldDefault == "" {
					fi.FieldDefault = "0"
				}

				SqlFields.Append(fmt.Sprintf("`%s` BIGINT %s %s DEFAULT %s COMMENT '%s' ", fi.FieldName, fUnsigned, fNull, fi.FieldDefault, fi.FieldTitle))
			//整数型
			case "number", "selectnumber":
				fUnsigned := ""
				//非负数
				if rules.Contains("unsigned") {
					fUnsigned = "UNSIGNED"
				}

				fNull := "NOT NULL"
				if fi.FieldDefault == "" {
					fi.FieldDefault = "0"
				}

				SqlFields.Append(fmt.Sprintf("`%s` INT %s %s DEFAULT %s COMMENT '%s' ", fi.FieldName, fUnsigned, fNull, fi.FieldDefault, fi.FieldTitle))
			//text型
			case "richtext", "bigtext", "images", "files":
				SqlFields.Append(fmt.Sprintf("`%s` TEXT COMMENT '%s'", fi.FieldName, fi.FieldTitle))
			//TINYINT型
			case "switch":
				if fi.FieldDefault == "" {
					fi.FieldDefault = "0"
				}
				SqlFields.Append(fmt.Sprintf("`%s` TINYINT UNSIGNED NOT NULL DEFAULT %s COMMENT '%s'",
					fi.FieldName, fi.FieldDefault, fi.FieldTitle))
			//部门选择器
			case "DepartmentSelector":
				SqlFields.Append(fmt.Sprintf("`%s` VARCHAR(300) %s DEFAULT '' COMMENT '%s'", fi.FieldName, fi.FieldDefault, fi.FieldTitle))
			default:
				return gerror.New("不能识别字段类型")
			}
			typeUnique := garray.NewStrArrayFrom([]string{"switch", "text", "number", "datetime", "date", "selecttext", "selectnumber", "checkbox"})
			if typeUnique.Contains(fi.FieldType) && rules.Contains("unique") {
				SqlUniqueKey.Append(fmt.Sprintf("UNIQUE KEY %s (%s)", fi.FieldName, fi.FieldName))
			}
		}
		//普通索引
		if modelInfo.ModelIndexes != "" {
			modelIndexes := gstr.Split(modelInfo.ModelIndexes, ",")
			for _, ind := range modelIndexes {
				SqlKey.Append(fmt.Sprintf("INDEX IX_%s (%s)", ind, ind))
			}
		}
		//替换sql占位符
		sqlFieldTag := ""
		if SqlPrimaryKey != "" || SqlUniqueKey.Len() != 0 || SqlKey.Len() != 0 {
			sqlFieldTag = ",\n"
		}
		primaryTag := ""
		if SqlPrimaryKey != "" && (SqlUniqueKey.Len() != 0 || SqlKey.Len() != 0) {
			primaryTag = ",\n"
		}
		uniqueTag := ""
		if SqlUniqueKey.Len() != 0 && SqlKey.Len() != 0 {
			uniqueTag = ",\n"
		}
		sql = gstr.ReplaceByArray(sql, []string{
			"%FIELDS_SQL%",
			SqlFields.Join(",") + sqlFieldTag,
			"%PRIMARY_KEY_SQL%",
			SqlPrimaryKey + primaryTag,
			"%UNIQUE_KEY_SQL%",
			SqlUniqueKey.Join(",") + uniqueTag,
			"%KEY_SQL%",
			SqlKey.Join(","),
		})
		_, err = g.DB().Exec(sql)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("建表发生错误")
		}
	}
	return nil
}

//备份已存在的模型表
func buildTableExists(dbPrefix, modelName string) error {
	//数据库名称
	dbName := g.Cfg().GetString("database.name")
	res, err := g.DB().GetAll("SHOW TABLE STATUS FROM " + dbName)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("数据库信息获取失败")
	}
	tables := garray.New()
	for _, tbInfo := range res {
		tabName := gconv.String(tbInfo["Name"])
		if dbPrefix != "" && gstr.PosI(tabName, dbPrefix) == 0 {
			tables.Append(gstr.ToLower(gstr.SubStr(tabName, 0, len(dbPrefix))))
		}
		tables.Append(gstr.ToLower(tabName))
	}
	if tables.Contains(modelName) {
		//表格若已经存在则备份
		pathDir := g.Cfg().GetString("adminInfo.dataDir") + "/dataBak"
		pathDir, err := filepath.Abs(pathDir)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("获取数据表备份路径失败")
		}
		//路径不存在则创建之
		err = os.MkdirAll(pathDir, os.ModeDir)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("创建备份目录失败")
		}
		err = backupTable(pathDir, modelName, dbPrefix)
		if err != nil {
			return err
		}
	}
	return nil
}

//备份数据表操作
func backupTable(pathDir, tableName, prefix string) error {
	switch g.Cfg().GetString("database.type") {
	case "mysql":
		rec, err := g.DB().GetOne(fmt.Sprintf("SHOW CREATE TABLE %s%s ", prefix, tableName))
		if err != nil {
			g.Log().Error(err)
			return gerror.New("获取备份表信息失败")
		}
		tableCreateSql := rec["Create Table"].String()
		res, err := g.DB().GetAll(fmt.Sprintf("SELECT * FROM %s%s", prefix, tableName))
		if err != nil {
			g.Log().Error(err)
			return gerror.New("获取备份表数据失败")
		}
		dataValues := garray.NewStrArray()
		keyValues := garray.NewStrArray()
		for _, v := range res {
			var str string
			vKey := garray.NewStrArray()
			vValues := garray.NewStrArray()
			for kk, vv := range v {
				str = strconv.Quote(gconv.String(vv))
				vValues.Append(str)
				vKey.Append(kk)
			}
			dataValues.Append("(" + vValues.Join(",") + ")")
			keyValues.Append("(" + vKey.Join(",") + ")")
		}
		insertDataSql := ""
		keyValues.Iterator(func(kk int, kv string) bool {
			vv, _ := dataValues.Get(kk)
			insertDataSql += fmt.Sprintf("INSERT INTO `%s%s` %s VALUES %s;\n", prefix, tableName, kv, vv)
			return true
		})
		tableCreateSql = tableCreateSql + ";\n" + insertDataSql + ";"
		//保存到文件中
		err = gfile.PutContents(fmt.Sprintf(pathDir+"/%s%s_%d.sql", prefix, tableName, gtime.Timestamp()), tableCreateSql)
		if err != nil {
			g.Log().Error(err)
			return gerror.New("创建备份文件失败")
		}
	}
	return nil
}

//复制模型
func CopyModel(modelId int64) error {
	//获取要复制的模型信息
	modelInfo, err := GetByID(modelId)
	if err != nil {
		return err
	}
	req := &model_fields.SelectPageReq{ModelId: modelId}
	modelFields, err := model_fields.SelectListAll(req)
	if err != nil {
		return err
	}
	tx, err := g.DB().Begin()
	if err != nil {
		g.Log().Error(err)
		return gerror.New("开启事务失败")
	}
	modelInfo.ModelId = 0
	modelInfo.ModelName = modelInfo.ModelName + "_copy"
	res, err := tx.Model(model_info.Table).Insert(modelInfo)
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("复制模型信息失败")
	}
	insId, err := res.LastInsertId()
	if err != nil {
		g.Log().Error(err)
		tx.Rollback()
		return gerror.New("获取复制模型信Id失败")
	}
	newModelId := gconv.Uint(insId)
	for _, field := range modelFields {
		field.FieldId = 0
		field.ModelId = newModelId
	}
	if modelFields != nil {
		_, err = tx.BatchInsert(model_fields.Table, modelFields)
		if err != nil {
			g.Log().Error(err)
			tx.Rollback()
			return gerror.New("复制模型字段信息失败")
		}
	}
	tx.Commit()
	return nil
}

func GetModelsByCateIds(cateIds []int) (models []*model_info.Entity, err error) {
	return model_info.GetModelsByCateIds(cateIds)
}
