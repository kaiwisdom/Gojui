<div class="pageHeader">
    <form id="pagerForm" onsubmit="return navTabSearch(this);" action="table.html" method="post">
        <input type="hidden" name="pageNum" value="${model.pageNum}">
        <input type="hidden" name="numPerPage" value="${model.numPerPage}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="searchBar">
            <ul class="searchContent">
                <li><label>客户号：</label><input type="text" value="" name="code" class="form-control" size="10" /></li>
                <li><label>客户名称：</label><input type="text" value="" name="name" class="form-control" size="8" /></li>
                <li><label>客户类型:</label>
                    <select name="type" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
                        <option value="">全部</option>
                        <option value="1">联社营业部1</option>
                        <option value="2">联社营业部2</option>
                        <option value="3">联社营业部3</option>
                        <option value="4">联社营业部4</option>
                    </select>
                </li>
                <li><a href="javascript:;" class="j-showMoreSearch" rel="tourgroup_list" title="更多选项"><i class="fa fa-angle-double-down"></i></a></li>
                <li><button type="submit" class="btn btn-default btn-sm">查询</button></li>
                <li><a class="btn btn-orange btn-sm" href="javascript:navTab.reload('', {clearQuery:true});">清空查询</a></li>
                <li class="pull-right">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">批量操作<span class="caret"></span></button>
                        <ul class="dropdown-menu right" role="menu">
                            <li><a href="doExport" target="dwzExport">导出<span style="color: green;">全部</span></a></li>
                            <li><a href="doExport" target="checkedExport" idname="ids">导出<span style="color: red;">选中</span></a></li>
                            <li class="divider"></li>
                            <li><a href="doDel" target="checkedAjaxTodo" idname="ids">删除选中</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="moreSearch">
            <label>证件号：</label><input type="text" value="" name="idno" class="form-control" size="8" />
            <label>&nbsp;</label>
            <label>所属行业:</label>
            <select name="industry" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
                <option value="">全部</option>
                <option value="1">政府机构</option>
                <option value="2">事业单位</option>
                <option value="3">教育培训</option>
                <option value="4">IT</option>
                <option value="4">其他</option>
            </select>
            <label>&nbsp;</label>
            <label>信用等级:</label>
            <select name="grade" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto" data-container="body">
                <option value="">全部</option>
                <option value="1">1级</option>
                <option value="2">2级</option>
                <option value="3">3级</option>
                <option value="4">4级</option>
                <option value="4">5级</option>
            </select>
            <label>&nbsp;</label>
            <input type="checkbox" value="true" name="my" id="j_tourgroup_onlysignup" class="j-icheck"><label for="j_tourgroup_onlysignup" class="ilabel">我的业务</label>
        </div>
    </form>
</div>
<div class="pageContent">
    <table class="table table-bordered table-hover table-striped table-top" layoutH="70">
        <thead>
            <tr>
                <th></th>
                <th>客户号</th>
                <th>客户名称</th>
                <th>客户类型</th>
                <th>证件号码</th>
                <th>信用等级</th>
                <th>所属行业</th>
                <th class="orderby asc">建档日期</th>
                <th width="20"><input type="checkbox" class="checkboxCtrl j-icheck" group="ids"></th>
                <th width="72">操作</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="1"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="2"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="3"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="4"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="5"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="6"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="7"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="8"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="9"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="10"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="1"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="2"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="3"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="4"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="5"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="6"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="7"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="8"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="9"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="10"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="1"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="2"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="3"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="4"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="5"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="6"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="7"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="8"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="9"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="10"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="1"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="2"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="3"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="4"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="5"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="6"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="7"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="8"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="9"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="10"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="1"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="2"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="3"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="4"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="5"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="6"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="7"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="8"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="9"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>天津农信社</td>
                <td>A120113196309052434</td>
                <td>天津市华建装饰工程有限公司</td>
                <td>联社营业部</td>
                <td>29385739203816293</td>
                <td>5级</td>
                <td>政府机构</td>
                <td>2009-05-21</td>
                <td><input type="checkbox" name="ids" class="j-icheck" value="10"></td>
                <td>
                    <a href="form.html" class="btn btn-green btn-sm" target="navTab" rel="form" reloadtips="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone3.html" class="btn btn-red btn-sm" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="panelBar">
        <div class="pages">
            <span>每页&nbsp;</span>
            <span class="sel">
                <select class="selectpicker show-tick dropup" data-style="btn-default btn-sel xs" data-width="auto" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
                    <option value="30">30</option>
                    <option value="60">60</option>
                    <option value="120">120</option>
                    <option value="150">150</option>
                </select>
            </span>
            <span>&nbsp;条，共 600 条</span>
        </div>
        <div class="pagination-box" targettype="navTab" totalcount="600" numperpage="30" pagenumshown="10" currentpage="1">
        </div>
    </div>
</div>
