package libUtils

import (
	"fmt"
	"github.com/gogf/gf/v2/container/garray"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"reflect"
)

// ParentSonSort 有层级关系的数组,父级-》子级 排序
func ParentSonSort(list g.List, params ...interface{}) g.List {
	args := make([]interface{}, 8)
	for k, v := range params {
		if k == 8 {
			break
		}
		args[k] = v
	}
	var (
		pid       int    //父级id
		level     int    //层级数
		fieldName string //父级id键名
		id        string //id键名
		levelName string //层级名称
		title     string //标题名称
		breaks    int    //中断层级
		prefixStr string //字符串前缀
	)
	pid = gconv.Int(GetSliceByKey(args, 0, 0))
	level = gconv.Int(GetSliceByKey(args, 1, 0))
	fieldName = gconv.String(GetSliceByKey(args, 2, "pid"))
	id = gconv.String(GetSliceByKey(args, 3, "id"))
	levelName = gconv.String(GetSliceByKey(args, 4, "flg"))
	title = gconv.String(GetSliceByKey(args, 5, "title"))
	breaks = gconv.Int(GetSliceByKey(args, 6, -1))
	prefixStr = gconv.String(GetSliceByKey(args, 7, "─"))
	//定义一个新slice用于返回
	var returnSlice g.List
	for _, v := range list {
		if pid == gconv.Int(v[fieldName]) {
			v[levelName] = level
			levelClone := level
			titlePrefix := ""
			for {
				if levelClone < 0 {
					break
				}
				titlePrefix += prefixStr
				levelClone--
			}
			titlePrefix = "├" + titlePrefix
			if level == 0 {
				v["title_prefix"] = ""
			} else {
				v["title_prefix"] = titlePrefix
			}
			v["title_show"] = fmt.Sprintf("%s%s", v["title_prefix"], v[title])
			returnSlice = append(returnSlice, v)
			if breaks != -1 && breaks == level {
				continue
			}
			args[0] = v[id]
			args[1] = level + 1
			newSlice2 := ParentSonSort(list, args...)
			if len(newSlice2) > 0 {
				returnSlice = append(returnSlice, newSlice2...)
			}
		}
	}
	return returnSlice
}

// PushSonToParent 有层级关系的数组 ,将子级压入到父级（树形结构）
func PushSonToParent(list g.List, params ...interface{}) g.List {
	args := make([]interface{}, 7)
	for k, v := range params {
		if k == 7 {
			break
		}
		args[k] = v
	}
	var (
		pid         string      //父级id
		fieldName   string      //父级id键名
		id          string      //id键名
		key         string      //子级数组键名
		filter      string      //过滤键名
		filterVal   interface{} //过滤的值
		showNoChild bool        //是否显示不存在的子级健
	)
	pid = gconv.String(GetSliceByKey(args, 0, 0))
	fieldName = gconv.String(GetSliceByKey(args, 1, "pid"))
	id = gconv.String(GetSliceByKey(args, 2, "id"))
	key = gconv.String(GetSliceByKey(args, 3, "children"))
	filter = gconv.String(GetSliceByKey(args, 4, ""))
	filterVal = GetSliceByKey(args, 5, nil)
	showNoChild = gconv.Bool(GetSliceByKey(args, 6, true))
	var returnList g.List
	for _, v := range list {
		if gconv.String(v[fieldName]) == pid {
			if filter != "" {
				if reflect.DeepEqual(v[filter], filterVal) {
					args[0] = v[id]
					child := PushSonToParent(list, args...)
					if child != nil || showNoChild {
						v[key] = child
					}
					returnList = append(returnList, v)
				}
			} else {
				args[0] = v[id]
				child := PushSonToParent(list, args...)
				if child != nil || showNoChild {
					v[key] = child
				}
				returnList = append(returnList, v)
			}
		}
	}
	return returnList
}

// GetSliceByKey 获取切片里的值 若为nil 可设置默认值val
func GetSliceByKey(args []interface{}, key int, val interface{}) interface{} {
	var value interface{}
	if args[key] != nil {
		value = args[key]
	} else {
		value = val
	}
	return value
}

// FindSonByParentId 有层级关系的切片，通过父级id查找所有子级id数组
// parentId 父级id
// parentIndex 父级索引名称
// idIndex id索引名称
func FindSonByParentId(list g.List, parentId interface{}, parentIndex, idIndex string) g.List {
	newList := make(g.List, 0, len(list))
	for _, v := range list {
		if reflect.DeepEqual(v[parentIndex], parentId) {
			newList = append(newList, v)
			fList := FindSonByParentId(list, v[idIndex], parentIndex, idIndex)
			newList = append(newList, fList...)
		}
	}
	return newList
}

// GetTopPidList 获取最顶层 parent Id
func GetTopPidList(list g.List, parentIndex, idIndex string) *garray.Array {
	arr := garray.NewArray()
	for _, v1 := range list {
		tag := true
		for _, v2 := range list {
			if v1[parentIndex] == v2[idIndex] {
				tag = false
				break
			}
		}
		if tag {
			arr.PushRight(v1[parentIndex])
		}
	}
	return arr.Unique()
}

// FindParentBySonPid 有层级关系的数组，通过子级fid查找所有父级数组
func FindParentBySonPid(list g.List, id int, params ...interface{}) g.List {
	args := make([]interface{}, 4)
	for k, v := range params {
		if k == 4 {
			break
		}
		args[k] = v
	}
	var (
		filter      = gconv.String(GetSliceByKey(args, 0, "filter")) //过滤键名
		fPid        = gconv.String(GetSliceByKey(args, 1, "pid"))    //父级id字段键名
		filterValue = GetSliceByKey(args, 2, nil)                    //过滤键值
		fid         = gconv.String(GetSliceByKey(args, 3, "id"))     //id字段键名
	)
	rList := make(g.List, 0, len(list))
	for _, v := range list {
		if gconv.Int(v[fid]) == id {
			if fv, ok := v[filter]; ok {
				if reflect.DeepEqual(fv, filterValue) {
					rList = append(rList, v)
				}
			} else {
				rList = append(rList, v)
			}
			r := FindParentBySonPid(list, gconv.Int(v[fPid]), filter, fPid, filterValue, fid)
			rList = append(rList, r...)
		}
	}
	return rList
}

// FindTopParent
/**
 * 根据id查询最顶层父级信息
 * @param list 有层级关系的数组
 * @param id 查找的id
 * @param string fpid 父级id键名
 * @param string fid 当前id键名
 * @return g.Map
 */
func FindTopParent(list g.List, id int64, params ...interface{}) g.Map {
	if len(list) == 0 {
		return g.Map{}
	}
	args := make([]interface{}, 2)
	for k, v := range params {
		if k == 2 {
			break
		}
		args[k] = v
	}
	var (
		fPid = gconv.String(GetSliceByKey(args, 0, "pid")) //父级id字段键名
		fid  = gconv.String(GetSliceByKey(args, 1, "id"))  //id字段键名
	)
	hasParent := true
	top := g.Map{}
	//找到要查找id值的数组
	for _, v := range list {
		if gconv.Int64(v[fid]) == gconv.Int64(id) {
			top = v
			break
		}
	}
	for {
		if !hasParent {
			break
		}
		//查询最顶层
		for _, v := range list {
			if gconv.Int64(top[fPid]) == gconv.Int64(v[fid]) {
				top = v
				hasParent = true
				break
			}
			hasParent = false
		}
	}
	return top
}
