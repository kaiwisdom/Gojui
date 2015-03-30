package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	orm.RegisterDriver("mysql", orm.DR_MySql)
	orm.RegisterDataBase("default", "mysql", "root:root@/orm_test?charset=utf8")
}
