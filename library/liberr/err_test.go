/*
* @desc:错误处理测试
* @company:云南奇讯科技有限公司
* @Author: yixiaohu
* @Date:   2022/3/2 14:53
 */

package liberr

import (
	"context"
	"errors"
	"testing"

	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
)

func TestErrIsNil(t *testing.T) {
	ctx := context.Background()

	// Test case 1: 验证传入 nil 错误时不会 panic
	t.Run("nil error", func(t *testing.T) {
		defer func() {
			if r := recover(); r != nil {
				t.Errorf("ErrIsNil should not panic with nil error, but got: %v", r)
			}
		}()
		ErrIsNil(ctx, nil)
	})

	// Test case 2: 验证传入非 nil 错误且无自定义消息时会 panic 并抛出原始错误
	t.Run("non-nil error without message", func(t *testing.T) {
		testErr := errors.New("test error")
		defer func() {
			if r := recover(); r == nil {
				t.Error("ErrIsNil should panic with non-nil error")
			} else if r != testErr {
				t.Errorf("Expected panic with error %v, but got: %v", testErr, r)
			}
		}()
		ErrIsNil(ctx, testErr)
	})

	// Test case 3:  验证传入非 nil 错误和自定义消息时会 panic 并抛出自定义消息
	t.Run("non-nil error with custom message", func(t *testing.T) {
		testErr := errors.New("test error")
		customMsg := "custom error message"
		defer func() {
			if r := recover(); r == nil {
				t.Error("ErrIsNil should panic with non-nil error and custom message")
			} else if r != customMsg {
				t.Errorf("Expected panic with message %q, but got: %v", customMsg, r)
			}
		}()
		ErrIsNil(ctx, testErr, customMsg)
	})

	// Test case 4: 验证传入多个消息时使用第一个消息
	t.Run("non-nil error with multiple messages", func(t *testing.T) {
		testErr := errors.New("test error")
		firstMsg := "first message"
		secondMsg := "second message"
		defer func() {
			if r := recover(); r == nil {
				t.Error("ErrIsNil should panic with non-nil error and messages")
			} else if r != firstMsg {
				t.Errorf("Expected panic with first message %q, but got: %v", firstMsg, r)
			}
		}()
		ErrIsNil(ctx, testErr, firstMsg, secondMsg)
	})

	// Test case 5: 验证 gf 框架的 gerror.NewCode 错误处理 - 验证码场景
	t.Run("gerror with CodeValidationFailed", func(t *testing.T) {
		testErr := gerror.NewCode(gcode.CodeValidationFailed, "验证码已过期或不存在")
		defer func() {
			if r := recover(); r == nil {
				t.Error("ErrIsNil should panic with gerror")
			} else if r != testErr {
				t.Errorf("Expected panic with gerror %v, but got: %v", testErr, r)
			}
		}()
		ErrIsNil(ctx, testErr)
	})

	// Test case 6: 验证 gerror.NewCode 错误与自定义消息
	t.Run("gerror with custom message", func(t *testing.T) {
		testErr := gerror.NewCode(gcode.CodeValidationFailed, "验证码已过期或不存在")
		customMsg := "验证失败"
		defer func() {
			if r := recover(); r == nil {
				t.Error("ErrIsNil should panic with gerror and custom message")
			} else if r != customMsg {
				t.Errorf("Expected panic with message %q, but got: %v", customMsg, r)
			}
		}()
		ErrIsNil(ctx, testErr, customMsg)
	})

	// Test case 7: 验证不同类型的 gcode 错误
	t.Run("gerror with CodeInternalError", func(t *testing.T) {
		testErr := gerror.NewCode(gcode.CodeInternalError, "内部服务错误")
		defer func() {
			if r := recover(); r == nil {
				t.Error("ErrIsNil should panic with CodeInternalError")
			} else if r != testErr {
				t.Errorf("Expected panic with gerror %v, but got: %v", testErr, r)
			}
		}()
		ErrIsNil(ctx, testErr)
	})

	// Test case 8: 验证多种验证失败场景
	t.Run("multiple validation scenarios", func(t *testing.T) {
		scenarios := []struct {
			name string
			err  error
			msg  string
		}{
			{
				name: "验证码过期",
				err:  gerror.NewCode(gcode.CodeValidationFailed, "验证码已过期或不存在"),
				msg:  "验证码验证失败",
			},
			{
				name: "参数验证失败",
				err:  gerror.NewCode(gcode.CodeValidationFailed, "参数格式不正确"),
				msg:  "请求参数错误",
			},
			{
				name: "业务验证失败",
				err:  gerror.NewCode(gcode.CodeValidationFailed, "用户状态异常"),
				msg:  "",
			},
		}

		for _, scenario := range scenarios {
			t.Run(scenario.name, func(t *testing.T) {
				defer func() {
					if r := recover(); r == nil {
						t.Error("ErrIsNil should panic")
					} else {
						if scenario.msg != "" {
							if r != scenario.msg {
								t.Errorf("Expected panic with message %q, but got: %v", scenario.msg, r)
							}
						} else {
							if r != scenario.err {
								t.Errorf("Expected panic with error %v, but got: %v", scenario.err, r)
							}
						}
					}
				}()

				if scenario.msg != "" {
					ErrIsNil(ctx, scenario.err, scenario.msg)
				} else {
					ErrIsNil(ctx, scenario.err)
				}
			})
		}
	})
}
