package controllers

import (
	"github.com/astaxie/beego"
)

type AdvanceController struct {
	beego.Controller
}

func (this *AdvanceController) Dialog() {
	this.TplNames = "dialog.tpl"
}
func (this *AdvanceController) Collapse() {
	this.TplNames = "collapse.tpl"
}
func (this *AdvanceController) Tabs() {
	this.TplNames = "tabs.tpl"
}
func (this *AdvanceController) Ztree() {
	this.TplNames = "ztree.tpl"
}
func (this *AdvanceController) Ztreeselect() {
	this.TplNames = "ztreeselect.tpl"
}
func (this *AdvanceController) Kindeditor() {
	this.TplNames = "kindeditor.tpl"
}
func (this *AdvanceController) Tooltip() {
	this.TplNames = "tooltip.tpl"
}
func (this *AdvanceController) Popover() {
	this.TplNames = "popover.tpl"
}
func (this *AdvanceController) Dragsort() {
	this.TplNames = "dragsort.tpl"
}
func (this *AdvanceController) Dragsortmore() {
	this.TplNames = "dragsortmore.tpl"
}
