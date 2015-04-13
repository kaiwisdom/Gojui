package routers

import (
	"Gojui/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.ErrorController(&controllers.ErrorController{})
	beego.AutoRouter(&controllers.MainController{})
	beego.AutoRouter(&controllers.AdvanceController{})
}
