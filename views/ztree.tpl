<script type="text/javascript">
function changeZtree(t) {
    var $panel = navTab.getCurrentPanel();
    var $t    = $('#ztree1');
    var attrs = jQuery.parseJSON($t.attr('attrs'));
    var $span = $('#ztree-'+ t);
    if (t != 8)
        $.fn.zTree.destroy("ztree1");
    switch(t) {
        case 1:
            attrs.editEnable ? delete attrs.editEnable : attrs.editEnable = true;
            attrs.showRenameBtn ? delete attrs.showRenameBtn : attrs.showRenameBtn = true;
            attrs.showRemoveBtn ? delete attrs.showRemoveBtn : attrs.showRemoveBtn = true;
            $span.text(($span.text() == '无') ? '显示' : '无');
            break;
        case 2:
            attrs.addHoverDom ? delete attrs.addHoverDom : attrs.addHoverDom = 'edit';
            attrs.removeHoverDom ? delete attrs.removeHoverDom : attrs.removeHoverDom = 'edit';
            $span.text(($span.text() == '无') ? '显示' : '无');
            break;
        case 3:
            attrs.checkEnable ? delete attrs.checkEnable : attrs.checkEnable = true;
            $span.text(($span.text() == '无') ? '显示' : '无');
            break;
        case 4:
            attrs.onClick ? delete attrs.onClick : attrs.onClick = 'ZtreeClick';
            $span.text(($span.text() == '无') ? 'ZtreeClick' : '无');
            $('#ztree-detail').toggle();
            break;
        case 5:
            attrs.beforeDrag ? delete attrs.editEnable : attrs.editEnable = true;
            attrs.beforeDrag ? delete attrs.beforeDrag : attrs.beforeDrag = 'M_BeforeNodeDrag';
            attrs.beforeDrop ? delete attrs.beforeDrop : attrs.beforeDrop = 'M_BeforeNodeDrop';
            attrs.onDrop ? delete attrs.onDrop : attrs.onDrop = 'M_NodeDrop';
            $span.text(($span.text() == '无') ? 'M_BeforeNodeDrag、M_BeforeNodeDrop、M_NodeDrop' : '无');
            break;
        case 6:
            attrs.addHoverDom ? delete attrs.addHoverDom : attrs.addHoverDom = 'edit';
            attrs.removeHoverDom ? delete attrs.removeHoverDom : attrs.removeHoverDom = 'edit';
            attrs.beforeRemove ? delete attrs.beforeRemove : attrs.beforeRemove = 'M_BeforeRemove';
            attrs.onRemove ? delete attrs.onRemove : attrs.onRemove = 'M_NodeRemove';
            $('#ztree-2').text(($('#ztree-2').text() == '无') ? '显示' : '无');
            $span.text(($span.text() == '无') ? 'M_BeforeRemove、M_NodeRemove' : '无');
            break;
        case 7:
            attrs.addDiyDom ? delete attrs.addDiyDom : attrs.addDiyDom = 'M_AddDiyDom';
            $span.text(($span.text() == '无') ? 'M_AddDiyDom' : '无');
            break;
        case 8:
            attrs = null;
            var tree = $.fn.zTree.getZTreeObj("ztree1");
            var menus = tree.getNodes();
            $('#ztree-log').val(JSON.stringify(menus));
            break;
    }
    if (attrs) {
        var _attrs = JSON.stringify(attrs);
        $t.attr('attrs', _attrs);
        $('#ztree-log').val('attrs:'+ _attrs);
        $panel.initUI();
    }
}
//单击事件
function ZtreeClick(event, treeId, treeNode) {
    var $detail = $('#ztree-detail');
    if ($detail.attr('tid') == treeNode.tId) return;
	if (treeNode.name) $('#j_menu_name').val(treeNode.name);
	if (treeNode.nurl) {
		$('#j_menu_url').val(treeNode.nurl);
	} else {
		$('#j_menu_url').val('');
	}
	if (treeNode.rel) {
		$('#j_menu_rel').val(treeNode.rel);
	} else {
		$('#j_menu_rel').val('');
	}
	if (treeNode.target) {
		$('#j_menu_target').selectpicker('val', treeNode.target);
	} else {
		$('#j_menu_target').selectpicker('val', '');
	}
	$detail.attr('tid', treeNode.tId);
    $detail.show();
}
//保存属性
function M_Ts_Menu() {
	var zTree  = $.fn.zTree.getZTreeObj("ztree1");
	var name   = $('#j_menu_name').val();
	var url    = $('#j_menu_url').val();
	var rel    = $('#j_menu_rel').val();
	var target = $('#j_menu_target').val();
	if ($.trim(name).length == 0) {
		alertMsg.error('菜单名称不能为空！');
		return;
	}
	var upNode = zTree.getSelectedNodes()[0];
	if (!upNode) {
		alertMsg.error('未选中任何菜单！');
        return;
	}
	upNode.name   = name;
	upNode.nurl   = url;
	upNode.rel    = rel;
	upNode.target = target;
	zTree.updateNode(upNode);
}
//
function M_BeforeNodeDrag(treeId, treeNodes) {
    var $log = $('#ztree-log');
    $log.val('开始拖拽：'+ treeNodes[0].name +'！\n'+ $log.val());
    return true;
}
//监听拖拽事件
function M_BeforeNodeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
    /*禁止插入层级为2的节点*/
    if (moveType == 'inner' && targetNode.level == 2) {
        return false;
    }
    /*禁止插入剩余层级不足的子节点*/
    if (moveType == 'inner' && treeNodes[0].isParent) {
        var molevel = 2 - targetNode.level; //剩余层级
        var maxlevel = 1;
        var zTree = $.fn.zTree.getZTreeObj("ztree1");
        var nodes = zTree.transformToArray(treeNodes);
        var level = nodes[0].level;
        for (var i = 1; i < nodes.length; i++) {
            if (nodes[i].level == (level + 1)) {
                maxlevel++;
                level++;
            }
        }
        if (maxlevel > molevel) {
            return false;
        }
    }
    return true;
}
//拖拽结束事件
function M_NodeDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
    var $log = $('#ztree-log');
    $log.val('拖拽结束！\n'+ $log.val());
}
//删除前事件
function M_BeforeRemove(treeId, treeNode) {
    var $log = $('#ztree-log');
    $log.val('准备删除：'+ treeNode.name +'！\n'+ $log.val());
    return true;
}
//删除结束事件
function M_NodeRemove(event, treeId, treeNode) {
    var $log = $('#ztree-log');
    $log.val('删除成功！\n'+ $log.val());
}
//自定义DOM
function M_AddDiyDom(treeId, treeNode) {
    var aObj = $('#' + treeNode.tId + '_a');
	if ($('#diyBtn_'+ treeNode.id).length > 0) return;
	var editStr = '<button type="button" class="diyBtn1" id="diyBtn_' + treeNode.id +'" title="'+ treeNode.name +'" onfocus="this.blur();"><i class="fa fa-plane"></i></button>';
	aObj.append(editStr);
	var btn = $('#diyBtn_'+treeNode.id);
	if (btn) btn.bind('click', function(){alertMsg.info(treeNode.name +' 的飞机！');});
}
</script>
<div class="pageContent">
    <div class="pageFormContent" layouth="29">
        <div style="float: left; width: 550px;">
            <fieldset>
                <legend>树型菜单</legend>
                <div class="clearfix">
                    <div style="float: left; width: 220px; height: 240px; overflow: auto;">
                        <ul id="ztree1" class="ztree" attrs = '{"expandAll":true}' 
                            nodes='[{"id":1, "pId":0, "name":"基本元素"},{"id":11, "pId":1, "name": "普通表格", "nurl":"table.html", "target":"navTab", "rel":"table"},{"id":12, "pId":1, "name": "固定表头表格", "nurl":"table-grid.html", "target":"navTab", "rel":"table-grid"},{"id":13, "pId":1, "name": "可编辑表格", "nurl":"table-edit.html", "target":"navTab", "rel":"table-edit"},{"id":14, "pId":1, "name": "演示表单", "nurl":"form.html", "target":"navTab", "rel":"form"},{"id":15, "pId":1, "name": "表单元素", "nurl":"form-input.html", "target":"navTab", "rel":"form-input"},{"id":16, "pId":1, "name": "验证表单", "nurl":"form-validate.html", "target":"navTab", "rel":"form-validate"},{"id":2, "pId":0, "name":"进阶实例"},{"id":21, "pId":2, "name": "弹出窗口", "nurl":"dialog.html", "target":"navTab", "rel":"dialog"},{"id":22, "pId":2, "name": "滑动面板", "nurl":"collapse.html", "target":"navTab", "rel":"collapse"},{"id":23, "pId":2, "name": "树型菜单", "nurl":"ztree.html", "target":"navTab", "rel":"ztree"}]'>
                        </ul>
                    </div>
                    <div id="ztree-detail" style="display: none; margin-left: 230px; width: 300px; height: 240px;">
                        <div class="bs-example" data-content="详细信息">
                            <div class="form-group">
                                <label for="j_menu_name" class="control-label x85">菜单名称：</label>
                                <input type="text" class="form-control validate[required] required" name="m.name" id="j_menu_name" size="15" placeholder="名称" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_url" class="control-label x85">URL：</label>
                                <input type="text" class="form-control" name="m.nurl" id="j_menu_url" size="15" placeholder="Url" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_rel" class="control-label x85">rel：</label>
                                <input type="text" class="form-control" name="m.rel" id="j_menu_rel" size="15" placeholder="rel" />
                            </div>
                            <div class="form-group">
                                <label for="j_menu_target" class="control-label x85">target：</label>
                                <select class="selectpicker show-tick" id="j_menu_target" data-style="btn-default btn-sel" data-width="auto">
                                    <option value=""></option>
                                    <option value="navTab">navTab</option>
                                    <option value="dialog">dialog</option>
                                </select>
                            </div>
                            <div class="form-group" style="padding-top: 8px; border-top: 1px #DDD solid;">
                                <label class="control-label x85"></label>
                                <button class="btn btn-green btn-sm" onclick="M_Ts_Menu();">更新菜单</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix" style="margin-top: 20px;">
                    <div style="float: left; width: 220px;">
                        <p><label class="control-label x120">默认编辑删除按钮：</label><span id="ztree-1" class="label label-default">无</span></p>
                        <p><label class="control-label x120">自定义添/删按钮：</label><span id="ztree-2" class="label label-default">无</span></p>
                        <p><label class="control-label x120">复选框：</label><span id="ztree-3" class="label label-default">无</span></p>
                        <p><label class="control-label x120">点击事件：</label><span id="ztree-4" class="label label-default">无</span></p>
                        <p><label class="control-label x120">拖拽事件：</label><span id="ztree-5" class="label label-default">无</span></p>
                        <p><label class="control-label x120">删除事件：</label><span id="ztree-6" class="label label-default">无</span></p>
                        <p><label class="control-label x120">自定义DOM：</label><span id="ztree-7" class="label label-default">无</span></p>
                    </div>
                    <div style="margin-left: 230px;">
                        <textarea style="width: 300px;" rows="6" id="ztree-log"></textarea>
                    </div>
                </div>
                
                <div class="btn-group" style="margin-top: 5px;">
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(1);">默认编/删按钮</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(2);">自定义添/删按钮</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(3);">复选框</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(4);">点击</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(5);">拖拽</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(6);">删除</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="changeZtree(7);">自定义DOM</button>
                    <button type="button" class="btn btn-orange btn-sm" onclick="changeZtree(8);">提交树</button>
                </div>
                <p><br>更多API及DEMO：<a href="http://www.ztree.me/" target="_blank">http://www.ztree.me/</a></p>
            </fieldset>
        </div>
        <div style="margin-left: 580px;">
            <fieldset>
                <legend>参数信息</legend>
                <h4>attrs：写法[ <span class="blue">attrs='{"onClick":"MainMenuClick", "expandAll":true}'</span> ]</h4>
                <table class="table table-condensed table-striped table-hover">
                    <thead>
                        <tr>
                            <th>属性名称</th>
                            <th>类型、参数</th>
                            <th>默认值</th>
                            <th>描述信息</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>expandAll</td>
                            <td>Boolean</td>
                            <td>false</td>
                            <td>展开整棵树</td>
                        </tr>
                        <tr>
                            <td>simpleData</td>
                            <td>Boolean</td>
                            <td>true</td>
                            <td>使用简单JSON数据</td>
                        </tr>
                        <tr>
                            <td>addHoverDom</td>
                            <td>function(treeId, treeNode)</td>
                            <td>null</td>
                            <td>鼠标放到节点上时，显示的自定义DOM，函数可选字符串"edit"：显示自定义的添加和删除按钮，删除按钮点击时有确认事件，如果定义了删除事件[onRemove]，则删除时将调用该事件，否则直接删除</td>
                        </tr>
                        <tr>
                            <td>removeHoverDom</td>
                            <td>function(treeId, treeNode)</td>
                            <td>null</td>
                            <td>鼠标离开节点时，隐藏自定义DOM，函数可选字符串"edit"：隐藏自定义的添加和删除按钮，addHoverDom和removeHoverDom需要同时出现</td>
                        </tr>
                        <tr>
                            <td>maxAddLevel</td>
                            <td>Int</td>
                            <td>2</td>
                            <td>允许添加的最大子节点深度，仅使用默认的{"addHoverDom":"edit"}时有效，level > maxAddLevel 的节点上将不会显示添加按钮。</td>
                        </tr>
                        <tr>
                            <td>addDiyDom</td>
                            <td>function(treeId, treeNode)</td>
                            <td>false</td>
                            <td>用于在节点上固定显示用户自定义DOM</td>
                        </tr>
                        <tr>
                            <td>editEnable</td>
                            <td>Boolean</td>
                            <td>false</td>
                            <td>允许编辑节点</td>
                        </tr>
                        <tr>
                            <td>showRemoveBtn</td>
                            <td>Boolean</td>
                            <td>false</td>
                            <td>显示默认的编辑按钮</td>
                        </tr>
                        <tr>
                            <td>showRenameBtn</td>
                            <td>Boolean</td>
                            <td>false</td>
                            <td>显示默认的删除按钮</td>
                        </tr>
                        <tr>
                            <td>checkEnable</td>
                            <td>Boolean</td>
                            <td>false</td>
                            <td>设置 zTree 的节点上是否显示 checkbox / radio</td>
                        </tr>
                        <tr>
                            <td>chkStyle</td>
                            <td>String</td>
                            <td>checkbox</td>
                            <td>勾选框类型(checkbox 或 radio）[ {"checkEnable":true} 生效 ]</td>
                        </tr>
                        <tr>
                            <td>radioType</td>
                            <td>String</td>
                            <td>all</td>
                            <td>radio 的分组范围，参数'all'：整棵树为一个分组，参数'level'：每一节点范围当作一个分组</td>
                        </tr>
                        <tr>
                            <td>onClick</td>
                            <td>function(event, treeId, treeNode, clickFlag)</td>
                            <td>null</td>
                            <td>用于捕获节点被点击的事件回调函数</td>
                        </tr>
                        <tr>
                            <td>beforeDrag</td>
                            <td>function(treeId, treeNodes)</td>
                            <td>null</td>
                            <td>用于捕获节点被拖拽之前的事件回调函数，并且根据返回值确定是否允许开启拖拽操作<br>
                                拖拽需要开启(editEnable)：[ {"editEnable":true} 生效 ]
                            </td>
                        </tr>
                        <tr>
                            <td>beforeDrop</td>
                            <td>function(treeId, treeNodes, targetNode, moveType, isCopy)</td>
                            <td>null</td>
                            <td>用于捕获节点拖拽操作结束之前的事件回调函数，并且根据返回值确定是否允许此拖拽操作</td>
                        </tr>
                        <tr>
                            <td>onDrop</td>
                            <td>function(event, treeId, treeNodes, targetNode, moveType, isCopy)</td>
                            <td>null</td>
                            <td>用于捕获节点拖拽操作结束的事件回调函数</td>
                        </tr>
                        <tr>
                            <td>beforeRemove</td>
                            <td>function(treeId, treeNode)</td>
                            <td>null</td>
                            <td>用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作。</td>
                        </tr>
                        <tr>
                            <td>onRemove</td>
                            <td>function(event, treeId, treeNode)</td>
                            <td>null</td>
                            <td>用于捕获删除节点之后的事件回调函数。</td>
                        </tr>
                        <tr>
                            <td>onCheck</td>
                            <td>function(event, treeId, treeNode)</td>
                            <td>null</td>
                            <td>用于捕获 checkbox / radio 被勾选 或 取消勾选的事件回调函数</td>
                        </tr>
                    </tbody>
                </table>
                <h4>nodes：(简单JSON数据)写法[ <span class="blue">nodes='[{"id":1, "pId":0, "name":"基本元素"}]'</span> ]</h4>
                <p>本例的nodes：</p>
                <pre>[{"id":1, "pId":0, "name":"基本元素"},{"id":11, "pId":1, "name": "普通表格", "nurl":"table.html", "target":"navTab", "rel":"table"},{"id":12, "pId":1, "name": "固定表头表格", "nurl":"table-grid.html", "target":"navTab", "rel":"table-grid"},{"id":13, "pId":1, "name": "可编辑表格", "nurl":"table-edit.html", "target":"navTab", "rel":"table-edit"},{"id":14, "pId":1, "name": "演示表单", "nurl":"form.html", "target":"navTab", "rel":"form"},{"id":15, "pId":1, "name": "表单元素", "nurl":"form-input.html", "target":"navTab", "rel":"form-input"},{"id":16, "pId":1, "name": "验证表单", "nurl":"form-validate.html", "target":"navTab", "rel":"form-validate"},{"id":2, "pId":0, "name":"进阶实例"},{"id":21, "pId":2, "name": "弹出窗口", "nurl":"dialog.html", "target":"navTab", "rel":"dialog"},{"id":22, "pId":2, "name": "滑动面板", "nurl":"collapse.html", "target":"navTab", "rel":"collapse"},{"id":23, "pId":2, "name": "树型菜单", "nurl":"ztree.html", "target":"navTab", "rel":"ztree"}]</pre>
                <h4>更多API及DEMO：<a href="http://www.ztree.me/" target="_blank">http://www.ztree.me/</a></h4>
            </fieldset>
        </div>
    </div>
    <div class="formBar">
        <ul>
            <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
        </ul>
    </div>
</div>