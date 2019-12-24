package hello

import (
    "github.com/gogf/gf/net/ghttp"
)

// Hello World
func Handler(r *ghttp.Request) {
    r.Response.Writeln("Hello World!")
}
