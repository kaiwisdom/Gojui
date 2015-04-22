<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=EDGE">
        <title>beego|b-jui</title>
        <meta name="Keywords" content="Bootstrap,DWZ,jquery,ui,前端,框架,开源"/>
        <meta name="Description" content="Bootstrap for DWZ富客户端框架，基于DWZ富客户端框架修改"/> 
        <!-- bootstrap - css -->
        <link href="/static/DWZ/themes/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
        <!-- uploadify -->
        <link href="/static/DWZ/plugins/uploadify/css/uploadify.css" rel="stylesheet" media="screen"/>
        <link href="/static/DWZ/plugins/Huploadify/Huploadify.css" rel="stylesheet" media="screen"/>
        <!-- core - css -->
        <link href="/static/DWZ/themes/css/style.css" rel="stylesheet" media="screen"/>
        <link href="/static/DWZ/themes/purple/core.css" rel="stylesheet" media="screen"/>
        <!-- plug - css -->
        <link href="/static/DWZ/plugins/kindeditor_4.1.10/themes/default/default.css" rel="stylesheet" media="screen" />
        <link href="/static/DWZ/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" media="screen" />
        <link href="/static/DWZ/plugins/validationEngine/validationEngine.jquery.css" rel="stylesheet" media="screen" />
        <link href="/static/DWZ/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet" media="screen" />
        <link href="/static/DWZ/themes/css/FA/css/font-awesome.min.css" rel="stylesheet" media="screen" />
        <!--[if lte IE 7]>
        <link href="/static/DWZ/themes/css/ie7.css" rel="stylesheet" />
        <![endif]-->
        <!--[if lte IE 9]>
        <script src="/static/DWZ/js/speedup.js"></script>
        <script src="/static/DWZ/plugins/other/respond.js"></script>
        <![endif]-->
        <!-- jquery -->
        <script src="/static/DWZ/js/jquery-1.7.2.min.js"></script>
        <script src="/static/DWZ/js/jquery.cookie.js"></script>
        <!-- /static/DWZ.min 分模块压缩版 -->
        <script src="/static/DWZ/js/dwz.min.js"></script>
        <!-- 以下是DWZ的分模块未压缩版，建议开发调试阶段使用下面的版本 -->
        <!-- 
        <script src="/static/DWZ/js/dwz.core.js"></script>
        <script src="/static/DWZ/js/dwz.util.date.js"></script>
        <script src="/static/DWZ/js/dwz.drag.js"></script>
        <script src="/static/DWZ/js/dwz.barDrag.js"></script>
        <script src="/static/DWZ/js/dwz.ui.js"></script>
        <script src="/static/DWZ/js/dwz.theme.js"></script>
        <script src="/static/DWZ/js/dwz.alertMsg.js"></script>
        <script src="/static/DWZ/js/dwz.contextmenu.js"></script>
        <script src="/static/DWZ/js/dwz.navTab.js"></script>
        <script src="/static/DWZ/js/dwz.tab.js"></script>
        <script src="/static/DWZ/js/dwz.resize.js"></script>
        <script src="/static/DWZ/js/dwz.dialog.js"></script>
        <script src="/static/DWZ/js/dwz.dialogDrag.js"></script>
        <script src="/static/DWZ/js/dwz.stable.js"></script>
        <script src="/static/DWZ/js/dwz.taskBar.js"></script>
        <script src="/static/DWZ/js/dwz.ajax.js"></script>
        <script src="/static/DWZ/js/dwz.pagination.js"></script>
        <script src="/static/DWZ/js/dwz.database.js"></script>
        <script src="/static/DWZ/js/dwz.datepicker.js"></script>
        <script src="/static/DWZ/js/dwz.effects.js"></script>
        <script src="/static/DWZ/js/dwz.history.js"></script>
        -->
        <!-- plugins -->
        <!-- swfupload -->
        <script src="/static/DWZ/plugins/swfupload/swfupload.min.js"></script>
        <!-- uploadify -->
        <script src="/static/DWZ/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
        <!-- html5 uploadify -->
        <script src="/static/DWZ/plugins/Huploadify/jquery.Huploadify.min.js"></script>
        <!-- kindeditor -->
        <script src="/static/DWZ/plugins/kindeditor_4.1.10/kindeditor-all.min.js"></script>
        <script src="/static/DWZ/plugins/kindeditor_4.1.10/lang/zh_CN.js"></script>
        <!-- colorpicker -->
        <script src="/static/DWZ/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <!-- ztree -->
        <script src="/static/DWZ/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
        <script src="/static/DWZ/plugins/ztree/jquery.ztree.excheck-3.5.min.js"></script>
        <script src="/static/DWZ/plugins/ztree/jquery.ztree.exedit-3.5.min.js"></script>
        <script src="/static/DWZ/plugins/ztree/jquery.ztree.exhide-3.5.min.js"></script>
        <!-- form validate -->
        <script src="/static/DWZ/plugins/validationEngine/jquery.validationEngine-zh_CN.js"></script>
        <script src="/static/DWZ/plugins/validationEngine/jquery.validationEngine.min.js"></script>
        <!-- bootstrap plugins -->
        <script src="/static/DWZ/plugins/bootstrap.min.js"></script>
        <script src="/static/DWZ/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
        <script src="/static/DWZ/plugins/bootstrapTags/bootstrap-tags.min.js"></script>
        <!-- icheck -->
        <script src="/static/DWZ/plugins/icheck/icheck.min.js"></script>
        <!-- dragsort -->
        <script src="/static/DWZ/plugins/dragsort/jquery.dragsort-0.5.1.min.js"></script>
        <!-- clock -->
        <script src="/static/DWZ/plugins/clock/jqClock.min.js"></script>
        <!-- other plugins -->
        <script src="/static/DWZ/plugins/other/jquery.autosize.js"></script>
        <!-- init -->
        <script type="text/javascript">
            $(function () {
                DWZ.init("/static/DWZ/dwz.frag.xml", {
                    loginUrl: "logintimeout.html", loginTitle: "登录", // 弹出登录对话框
                    statusCode:{ok:200, error:300, timeout:301}, //【可选】
                    pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
                    keys: {statusCode:"statusCode", message:"message"}, //【可选】
                    ui:{hideMode:'display'}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
                    debug: false, // 调试模式 【true|false】
                    callback: function () {
                        initEnv();
                        $("#topTheme").theme({themeBase:"/static/DWZ/themes"}); // themeBase 相对于index页面的主题base路径
                    }
                });
                //jquery时钟
                var nowtime = new Date().getTime();
                $("#clock").clock({"timestamp":nowtime, "format":"24", "calendar":"false"});
            });
            //菜单-事件
            function MainMenuClick(event, treeId, treeNode) {
                if (treeNode.isParent) {
                    var zTree = $.fn.zTree.getZTreeObj(treeId);
                    zTree.expandNode(treeNode);
                    return;
                }
                if (treeNode.target && treeNode.target == 'dialog') {
                    $.pdialog.open(treeNode.nurl, treeNode.rel, treeNode.name, {});
                } else if (treeNode.target && treeNode.target == 'navTab') {
                    navTab.openTab(treeNode.rel, treeNode.nurl, {title: treeNode.name});
                }
            }
        </script>
    </head>
    <body scroll="no">
        <!--[if lte IE 7]>
            <div id="errorie"><div>您还在使用老掉牙的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
        <![endif]-->
        <div id="layout">
            <div id="header">
                <div class="headerNav">
                    <div class="logo">
                        <a href="#">
                            <img src="/static/images/logo.png" height="50" />
                        </a></div>
                    <ul class="topnav">
                        <li>2014-07-23&nbsp;<span id="clock"></span></li>
                        <li>当前用户：admin</li>
                        <li><a href="changepwd.html" target="dialog" mask="true" rel="changepwd_page" width="400" height="260">修改密码</a></li>
                        <li><a href="#">网站首页</a></li>
                        <li><a href="#" target="_blank">DWZ(J-UI)官网</a></li>
                        <li><a href="login.html">退出</a></li>
                    </ul>
                    <ul class="topTheme" id="topTheme">
                        <li theme="default" class="theme_default" title="黑白分明"><i class="fa fa-circle"></i></li>
                        <li theme="orange" class="theme_orange" title="橘子红了"><i class="fa fa-circle"></i></li>
                        <li theme="purple" class="theme_purple" title="紫罗兰"><i class="fa fa-circle"></i></li>
                        <li theme="blue" class="theme_blue" title="青出于蓝"><i class="fa fa-circle"></i></li>
                        <li theme="green" class="theme_green" title="绿草如茵"><i class="fa fa-circle"></i></li>
                    </ul>
                </div>
            </div>

            <div id="leftside">
                <div id="sidebar_s">
                    <div class="collapse">
                        <div class="toggleCollapse"><div title="展开菜单"><i class="fa fa-angle-double-right"></i></div></div>
                    </div>
                </div>
                <div id="sidebar">
                    <div class="toggleCollapse"><h2>主菜单</h2><div title="收缩菜单"><i class="fa fa-angle-double-left"></i></div></div>
                    <div class="panel-group panel-main j-accordion" id="accordion_menu" data-heightbox="#sidebar" data-offsety="24">
                        <div class="panel panel-default">
                            <div class="panel-heading panelContent">
                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion_menu" href="#collapse_0" class="active"><i class="fa fa-caret-square-o-down"></i>&nbsp;基本信息</a></h4>
                            </div>
                            <div id="collapse_0" class="panel-collapse panelContent collapse in">
                                <div class="panel-body">
                                    <ul id="main_treeDemo_0" class="ztree ztree_main" attrs = '{"onClick":"MainMenuClick", "expandAll":true}' 
                                        nodes='[{"id":1, "pId":0, "name":"基本元素"},
                                        {"id":11, "pId":1, "name": "普通表格", "nurl":"/Main/Table", "target":"navTab", "rel":"table"},
                                        {"id":12, "pId":1, "name": "固定表头表格", "nurl":"/Main/Tablegrid", "target":"navTab", "rel":"table-grid"},
                                        {"id":13, "pId":1, "name": "可编辑表格", "nurl":"/Main/Tableedit", "target":"navTab", "rel":"table-edit"},
                                        {"id":14, "pId":1, "name": "演示表单", "nurl":"/Main/Form", "target":"navTab", "rel":"form"},
                                        {"id":15, "pId":1, "name": "表单元素", "nurl":"/Main/Forminput", "target":"navTab", "rel":"form-input"},
                                        {"id":16, "pId":1, "name": "验证表单", "nurl":"/Main/Formvalidate", "target":"navTab", "rel":"form-validate"},
                                        {"id":17, "pId":1, "name": "Select下拉列表", "nurl":"/Main/Formselect", "target":"navTab", "rel":"form-select"},
                                        {"id":18, "pId":1, "name": "复选框、单选框", "nurl":"/Main/Formcheckbox", "target":"navTab", "rel":"form-checkbox"},
                                        {"id":19, "pId":1, "name": "标签(自动完成)", "nurl":"/Main/Formtags", "target":"navTab", "rel":"form-tags"},
                                        {"id":2, "pId":0, "name":"进阶实例"},{"id":21, "pId":2, "name": "弹出窗口", "nurl":"/Advance/Dialog", "target":"navTab", "rel":"dialog"},
                                        {"id":22, "pId":2, "name": "滑动面板", "nurl":"/Advance/Collapse", "target":"navTab", "rel":"collapse"},
                                        {"id":23, "pId":2, "name": "选项卡", "nurl":"/Advance/Tabs", "target":"navTab", "rel":"tabs"},
                                        {"id":24, "pId":2, "name": "树型菜单(zTree)", "nurl":"/Advance/Ztree", "target":"navTab", "rel":"ztree"},
                                        {"id":25, "pId":2, "name": "下拉选择(zTree)", "nurl":"/Advance/Ztreeselect", "target":"navTab", "rel":"ztree-select"},
                                        {"id":26, "pId":2, "name": "编辑器(KindEditor)", "nurl":"/Advance/Kindeditor", "target":"navTab", "rel":"kindeditor"},
                                        {"id":27, "pId":2, "name": "工具提示", "nurl":"/Advance/Tooltip", "target":"navTab", "rel":"tooltip"},
                                        {"id":28, "pId":2, "name": "弹出提示", "nurl":"/Advance/Popover", "target":"navTab", "rel":"popover"},
                                        {"id":29, "pId":2, "name": "拖动排序", "nurl":"/Advance/Dragsort", "target":"navTab", "rel":"dragsort"},
                                        {"id":30, "pId":2, "name": "多个拖动排序", "nurl":"/Advance/Dragsortmore", "target":"navTab", "rel":"dragsort-more"}]'>
                                    </ul>
                                </div>
                            </div>
                            <div class="panelFooter"><div class="panelFooterContent"></div></div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading panelContent">
                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion_menu" href="#collapse_1" class=""><i class="fa fa-caret-square-o-right"></i>&nbsp;系统信息</a></h4>
                            </div>
                            <div id="collapse_1" class="panel-collapse panelContent collapse">
                                <div class="panel-body">
                                    <ul id="main_treeDemo_1" class="ztree ztree_main" 
                                        attrs = '{"onClick":"MainMenuClick", "expandAll":true}' nodes='[{"id":9, "pId":0, "name":"关于"},{"id":91, "pId":9, "name": "关于本框架", "nurl":"/Main/About", "target":"navTab", "rel":"about"}]'>
                                    </ul>
                                </div>
                            </div>
                            <div class="panelFooter"><div class="panelFooterContent"></div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="container">
                <div id="navTab" class="tabsPage">
                    <div class="tabsPageHeader">
                        <div class="tabsPageHeaderContent">
                            <ul class="navTab-tab nav nav-tabs">
                                <li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
                            </ul>
                        </div>
                        <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                        <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                        <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
                    </div>
                    <ul class="tabsMoreList">
                        <li><a href="javascript:;">我的主页</a></li>
                    </ul>
                    <div class="navTab-panel tabsPageContent layoutBox">
                        <div class="page unitBox">
                            <div class="accountInfo">
                                <div style="padding: 0 15px; border-bottom: 1px #DDD solid;">
                                    <h4>(B-JUI) Bootstrap for DWZ富客户端框架 　　
                                        <a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=0047455f3845597286edd381d54076b1e10a45c0c735115f0ee74961f70880af"><img border="0" src="/static/images/group.png" alt="[B-JUI]Bootstrap4DWZ交流群" title="[B-JUI]Bootstrap4DWZ交流群" style="vertical-align:top;"></a></h4>
                                    <hr style="margin: 12px 0 0px;">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5>网址：<a href="http://www.xknaan.com/" target="_blank">http://www.xknaan.com/</a></h5>
                                            <h5>项目地址：<a href="http://git.oschina.net/xknaan/Bootstrap_for_/static/DWZ" target="_blank">GIT</a>　<a href="http://www.oschina.net/p/bootstrap-for-/static/DWZ" target="_blank">OSCHINA</a></h5>
                                            <h5>微博地址：<a href="http://weibo.com/xknaan" target="_blank">http://weibo.com/xknaan</a></h5>                                    
                                        </div>
                                        <div class="col-md-6">
                                            <h5>/static/DWZ(J-UI)官网：<a href="http://www.j-ui.com/" target="_blank">http://www.j-ui.com/</a></h5>
                                            <h5>Bootstrap中文网：<a href="http://www.bootcss.com/" target="_blank">http://www.bootcss.com/</a></h5>
                                            <h5>QQ交流群：232781006</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pageFormContent" layoutH="100">                            
                                <div style="margin-right:300px; overflow: hidden;">
                                    <div class="row" style="padding: 0 10px;">
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><h3 class="panel-title">账号信息</h3></div>
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="control-label x80">登陆账号：</label>
                                                        <span>admin</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label x80">所属角色：</label>
                                                        <span>超级管理员</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label x80">姓名：</label>
                                                        <span>admin</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label x80">上次登陆：</label>
                                                        <span>127.0.0.1 @ 2014-07-23 09:30</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><h3 class="panel-title">信息发布</h3></div>
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="control-label x80">我添加的：</label>
                                                        <span><a href="news" target="navTab" rel="news_list" title="新闻管理">1 条信息</a></span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label x80">已删除的：</label>
                                                        <span>0 条信息</span>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: -4px;">
                                                        <label class="control-label x80">快速操作：</label>
                                                        <span>
                                                            <a href="javascript:;" class="btn btn-default btn-sm">添加信息</a>
                                                            <a href="javascript:;" class="btn btn-default btn-sm">审核操作</a>
                                                            <!--  
                                                            <a href="javascript:;" onclick="main_add_news('内容', true);" class="btn btn-default btn-sm">添加内容</a>
                                                            -->
                                                        </span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label x80"></label>
                                                        &nbsp;
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><h3 class="panel-title">站内消息</h3></div>
                                                <div class="panel-body">
                                                    <table class="table table-condensed table-hover table-striped" width="100%">
                                                        <thead>
                                                            <tr>
                                                                <th class="center">时间</th>
                                                                <th class="center">by</th>
                                                                <th class="center">内容</th>
                                                                <th class="center">状态</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="center">07/23 09:30</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">明天上午10：00开会。</td>
                                                                <td class="center"><span class="label label-warning">未读</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">07/20 15:05</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">项目X的完成进度通报。</td>
                                                                <td class="center"><span class="label label-success">已读</span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><h3 class="panel-title">最近登陆</h3></div>
                                                <div class="panel-body">
                                                    <table class="table table-condensed table-striped" width="100%">
                                                        <thead>
                                                            <tr>
                                                                <th class="center">时间</th>
                                                                <th class="center">登陆账号</th>
                                                                <th class="center">IP</th>
                                                                <th class="center">登陆状态</th>
                                                                <th class="center">描述</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="center">2014-07-23 09:30:44</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-22 17:11:38</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-22 09:11:13</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-21 11:16:35</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-21 10:04:41</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-16 11:16:37</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-16 10:25:38</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-16 10:17:06</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-16 10:14:23</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="center">2014-07-16 09:42:01</td>
                                                                <td class="center">admin</td>
                                                                <td class="center">127.0.0.1</td>
                                                                <td class="center">
                                                                    <font color='green'>成功</font></td>
                                                                <td class="center">登陆成功！</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">Copyright &copy; 2014 - 2015 <a href="#" target="_blank">B-jui,beego</a>       
        </div>
    </body>
</html>