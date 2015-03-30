package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplNames = "index.tpl"
}

func (c *MainController) Table() {
	c.TplNames = "table.tpl"
}

func (c *MainController) About() {
	c.TplNames = "about.tpl"
}

func (c *MainController) Tablegrid() {
	c.TplNames = "tablegrid.tpl"
}

func (c *MainController) Tableedit() {
	c.TplNames = "tableedit.tpl"
}
func (c *MainController) Form() {
	c.TplNames = "form.tpl"
}
