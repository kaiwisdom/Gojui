package controllers

import (
	"github.com/astaxie/beego"
)

type AdvanceController struct {
	beego.Controller
}

func (this *AdvanceController) Dialog() {
	this.TplNames = "dialog.tpl"
	this.Render()
}
func (this *AdvanceController) Collapse() {
	this.TplNames = "collapse.tpl"
	this.Render()
}
func (this *AdvanceController) Tabs() {
	this.TplNames = "tabs.tpl"
	this.Render()
}
func (this *AdvanceController) Ztree() {
	this.TplNames = "ztree.tpl"
	this.Render()
}
func (this *AdvanceController) Ztreeselect() {
	this.TplNames = "ztreeselect.tpl"
	this.Render()
}
func (this *AdvanceController) Kindeditor() {
	this.TplNames = "kindeditor.tpl"
	this.Render()
}
func (this *AdvanceController) Tooltip() {
	this.TplNames = "tooltip.tpl"
	this.Render()
}
func (this *AdvanceController) Popover() {
	this.TplNames = "popover.tpl"
	this.Render()
}
func (this *AdvanceController) Dragsort() {
	this.TplNames = "dragsort.tpl"
	this.Render()
}
func (this *AdvanceController) Dragsortmore() {
	this.TplNames = "dragsortmore.tpl"
	this.Render()
}
