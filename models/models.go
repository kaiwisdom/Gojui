package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type Menu struct {
	Id     int
	Pid    int
	Name   string
	Nurl   string
	Target string
	Rel    string
}

func init() {
	orm.RegisterDriver("mysql", orm.DR_MySql)
	orm.RegisterDataBase("default", "mysql", "root:root@/orm_test?charset=utf8")
	orm.RegisterModel(new(Menu))
}
