package main

import (
	_ "Gojui/routers"
	"github.com/astaxie/beego"
)

func main() {
	beego.AutoRender = false //关闭自动渲染模板
	beego.Run()
}
