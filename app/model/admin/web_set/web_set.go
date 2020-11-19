package web_set

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

// updateReq 用于存储页面更新(新增、修改)网址的信息
type UpdateReq struct {
	WebContent g.Map `p:"webContent" v:"required#站点信息不能为空"` // 站点信息
}

//  更新站点信息
func UpdateSave(req *UpdateReq) error {
	var entity = Entity{
		WebId:      gconv.Int(req.WebContent["webId"]),
		WebContent: gconv.String(req.WebContent),
	}

	_, err := Model.Save(entity)
	if err != nil {
		g.Log().Error(err)
		return gerror.New("更新站点信息失败")
	}
	return nil
}

// GetInfoByID 根据ID查询站点信息
func GetInfoByID(id int) (*Entity, error) {
	entity, err := Model.FindOne("web_id", id)
	if err != nil {
		g.Log().Error(err)
		return nil, gerror.New("根据ID查询站点信息出错")
	}
	if entity == nil {
		return nil, gerror.New("根据ID未能查询到站点信息")
	}
	return entity, nil
}
