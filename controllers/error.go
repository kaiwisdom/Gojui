package controllers

import (
	"github.com/astaxie/beego"
)

type ErrorController struct {
	beego.Controller
}

func (c *ErrorController) Error404() {
	//
}

//func (c *ErrorController) Error501() {
//    c.Data["content"] = "server error"
//    c.TplNames = "501.tpl"
//}

//func (c *ErrorController) ErrorDb() {
//    c.Data["content"] = "database is now down"
//    c.TplNames = "dberror.tpl"
//}
