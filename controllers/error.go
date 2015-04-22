package controllers

import (
	"github.com/astaxie/beego"
)

type ErrorController struct {
	beego.Controller
}

type Msg struct {
	StatusCode   int
	Message      string
	NavTabId     string
	Rel          string
	CallbackType string
	ForwardUrl   string
}

func (this *ErrorController) Error404() {	
	this.Data['Msg']=&Msg{300,'404'}
	this.ServeJson()
}

//func (c *ErrorController) Error501() {
//    c.Data["content"] = "server error"
//    c.TplNames = "501.tpl"
//}

//func (c *ErrorController) ErrorDb() {
//    c.Data["content"] = "database is now down"
//    c.TplNames = "dberror.tpl"
//}
