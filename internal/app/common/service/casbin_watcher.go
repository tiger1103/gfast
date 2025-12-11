/*
* @desc:casbin_watcher
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2025/12/10 18:12
 */
package service

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
)

// GfWatcher 实现 casbin 的 persist.Watcher 接口
type GfWatcher struct {
	ctx      context.Context    // 用于控制 Watcher 生命周期的上下文
	cancel   context.CancelFunc // 用于停止 Watcher 的函数
	callback func(string)
	channel  string
}

// NewGfWatcher 创建一个观察者
func NewGfWatcher(channelName string) (*GfWatcher, error) {
	ctx, cancel := context.WithCancel(context.Background())

	w := &GfWatcher{
		ctx:     ctx, // 这是一个长效的 ctx
		cancel:  cancel,
		channel: channelName,
	}

	// 启动协程进行订阅监听
	go w.startSubscribe()

	return w, nil
}

// SetUpdateCallback 设置当收到消息时的回调函数
func (w *GfWatcher) SetUpdateCallback(callback func(string)) error {
	w.callback = callback
	return nil
}

// Update 发送通知 (当当前节点修改策略时，Casbin 会调用这个)
func (w *GfWatcher) Update() error {
	_, err := g.Redis().Publish(w.ctx, w.channel, "policy_updated")
	return err
}

// Close 关闭观察者
func (w *GfWatcher) Close() {
	// 调用 cancel，通知 startSubscribe 中的协程退出
	w.cancel()
}

// startSubscribe 内部方法：订阅 Redis 频道
func (w *GfWatcher) startSubscribe() {
	sub, _, err := g.Redis().Subscribe(w.ctx, w.channel)
	if err != nil {
		g.Log().Error(w.ctx, "Casbin Watcher 订阅失败:", err)
		return
	}
	// 确保在函数退出时关闭订阅
	defer func() {
		_ = sub.Close(w.ctx)
	}()

	// 循环接收消息
	for {
		// 监听 ctx 是否已关闭 (调用 Close 方法时触发)
		select {
		case <-w.ctx.Done():
			g.Log().Info(w.ctx, "Casbin Watcher 停止监听")
			return
		default:
			// 继续执行后续功能
		}

		// Receive 接收消息
		msg, err := sub.Receive(w.ctx)
		if err != nil {
			// 如果是 Context 被取消导致的错误，直接退出
			if w.ctx.Err() != nil {
				return
			}
			// 其它错误（如网络断开），可以考虑简单的重试或记录日志
			g.Log().Error(w.ctx, "Casbin Watcher 接收消息错误:", err)
			// 如果出错直接退出，等待下一次重启或手动干预
			return
		}

		// 触发回调
		if w.callback != nil && msg != nil {
			g.Log().Debug(w.ctx, "Casbin Watcher 收到更新通知")
			w.callback("update signal received")
		}
	}
}
