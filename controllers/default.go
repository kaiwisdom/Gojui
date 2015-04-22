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
	c.Render()
}

func (c *MainController) Table() {
	c.TplNames = "table.tpl"
	c.Render()
}

func (c *MainController) About() {
	c.TplNames = "about.tpl"
	c.Render()
}

func (c *MainController) Tablegrid() {
	c.TplNames = "tablegrid.tpl"
	c.Render()
}

func (c *MainController) Tableedit() {
	c.TplNames = "tableedit.tpl"
	c.Render()
}
func (c *MainController) Form() {
	c.TplNames = "form.tpl"
	c.Render()
}
func (c *MainController) Forminput() {
	c.TplNames = "forminput.tpl"
	c.Render()
}
func (c *MainController) Formvalidate() {
	c.TplNames = "formvalidate.tpl"
	c.Render()
}
func (c *MainController) Formselect() {
	c.TplNames = "formselect.tpl"
	c.Render()
}
func (c *MainController) Formcheckbox() {
	c.TplNames = "formcheckbox.tpl"
	c.Render()
}
func (c *MainController) Formtags() {
	c.TplNames = "formtags.tpl"
	c.Render()
}
