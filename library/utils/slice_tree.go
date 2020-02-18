package utils

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
	"reflect"
	"strings"
)

//有层级关系的数组,父级-》子级 排序
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
	prefixStr = gconv.String(GetSliceByKey(args, 7, "  "))
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
				titlePrefix += strings.Repeat(prefixStr, 2)
				levelClone--
			}
			titlePrefix += "├"
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

//有层级关系的数组 ,将子级压入到父级（树形结构）
func PushSonToParent(list g.List, params ...interface{}) g.List {
	args := make([]interface{}, 7)
	for k, v := range params {
		if k == 7 {
			break
		}
		args[k] = v
	}
	var (
		pid         int         //父级id
		fieldName   string      //父级id键名
		id          string      //id键名
		key         string      //子级数组键名
		filter      string      //过滤键名
		filterVal   interface{} //过滤的值
		showNoChild bool        //是否显示不存在的子级健
	)
	pid = gconv.Int(GetSliceByKey(args, 0, 0))
	fieldName = gconv.String(GetSliceByKey(args, 1, "pid"))
	id = gconv.String(GetSliceByKey(args, 2, "id"))
	key = gconv.String(GetSliceByKey(args, 3, "children"))
	filter = gconv.String(GetSliceByKey(args, 4, ""))
	filterVal = GetSliceByKey(args, 5, nil)
	showNoChild = gconv.Bool(GetSliceByKey(args, 6, true))
	var returnList g.List
	for _, v := range list {
		if gconv.Int(v[fieldName]) == pid {
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

//获取切片里的值 若为nil 可设置默认值val
func GetSliceByKey(args []interface{}, key int, val interface{}) interface{} {
	var value interface{}
	if args[key] != nil {
		value = args[key]
	} else {
		value = val
	}
	return value
}
