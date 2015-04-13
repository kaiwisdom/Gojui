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
func (c *MainController) Forminput() {
	c.TplNames = "forminput.tpl"
}
func (c *MainController) Formvalidate() {
	c.TplNames = "formvalidate.tpl"
}
func (c *MainController) Formselect() {
	c.TplNames = "formselect.tpl"
}
func (c *MainController) Formcheckbox() {
	c.TplNames = "formcheckbox.tpl"
}
func (c *MainController) Formtags() {
	c.TplNames = "formtags.tpl"
}
