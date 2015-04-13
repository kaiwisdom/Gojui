<script type="text/javascript">
//选择事件
function S_NodeCheck(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId),
        nodes = zTree.getCheckedNodes(true);
    var ids = '', names = '';
    for (var i = 0; i < nodes.length; i++) {
        ids   += ','+ nodes[i].id;
        names += ','+ nodes[i].name;
    }
    if (ids.length > 0) {
        ids = ids.substr(1), names = names.substr(1);
    }
    var $from = $($('#'+ treeId).data('fromObj'));
    if ($from && $from.length)
        $from.val(names);
}
//单击事件
function S_NodeClick(event, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId);
    zTree.checkNode(treeNode, !treeNode.checked, true, true);
    return false;
}
</script>
<div class="pageContent">
    <div class="pageFormContent" layouth="29">
        <table class="table table-condensed table-hover" width="100%">
            <thead>
                <tr>
                    <th></th>
                    <th>样例</th>
                    <th>实现</th>
                    <th>说明</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="right">zTree选择[多选]：</td>
                    <td>
                        <input type="text" name="menus" id="j_ztree_menus1" class="form-control j-selectzTree" size="18" readonly="readonly" value="" data-tree="#j_select_tree1">
                        <ul id="j_select_tree1" class="ztree hide" attrs = '{"expandAll":true, "checkEnable":true, "onClick":"S_NodeClick", "onCheck":"S_NodeCheck"}' 
                            nodes='[{"id":1, "pId":0, "name":"基本元素"},{"id":11, "pId":1, "name": "普通表格", "nurl":"table.html", "target":"navTab", "rel":"table"},{"id":12, "pId":1, "name": "固定表头表格", "nurl":"table-grid.html", "target":"navTab", "rel":"table-grid"},{"id":13, "pId":1, "name": "可编辑表格", "nurl":"table-edit.html", "target":"navTab", "rel":"table-edit"},{"id":14, "pId":1, "name": "演示表单", "nurl":"form.html", "target":"navTab", "rel":"form"},{"id":15, "pId":1, "name": "表单元素", "nurl":"form-input.html", "target":"navTab", "rel":"form-input"},{"id":16, "pId":1, "name": "验证表单", "nurl":"form-validate.html", "target":"navTab", "rel":"form-validate"},{"id":2, "pId":0, "name":"进阶实例"},{"id":21, "pId":2, "name": "弹出窗口", "nurl":"dialog.html", "target":"navTab", "rel":"dialog"},{"id":22, "pId":2, "name": "滑动面板", "nurl":"collapse.html", "target":"navTab", "rel":"collapse"},{"id":23, "pId":2, "name": "树型菜单", "nurl":"ztree.html", "target":"navTab", "rel":"ztree"}]'></ul>
                    </td>
                    <td>class="form-control j-selectzTree" data-tree="#j_select_tree1"</td>
                    <td></td>
                </tr>
                <tr>
                    <td align="right">zTree选择[单选]：</td>
                    <td>
                        <input type="text" name="menus" id="j_ztree_menus2" class="form-control j-selectzTree" size="18" readonly="readonly" value="" data-tree="#j_select_tree2">
                        <ul id="j_select_tree2" class="ztree hide" attrs = '{"expandAll":true, "checkEnable":true, "chkStyle":"radio", "radioType":"all", "onClick":"S_NodeClick", "onCheck":"S_NodeCheck"}' 
                            nodes='[{"id":1, "pId":0, "name":"基本元素"},{"id":11, "pId":1, "name": "普通表格", "nurl":"table.html", "target":"navTab", "rel":"table"},{"id":12, "pId":1, "name": "固定表头表格", "nurl":"table-grid.html", "target":"navTab", "rel":"table-grid"},{"id":13, "pId":1, "name": "可编辑表格", "nurl":"table-edit.html", "target":"navTab", "rel":"table-edit"},{"id":14, "pId":1, "name": "演示表单", "nurl":"form.html", "target":"navTab", "rel":"form"},{"id":15, "pId":1, "name": "表单元素", "nurl":"form-input.html", "target":"navTab", "rel":"form-input"},{"id":16, "pId":1, "name": "验证表单", "nurl":"form-validate.html", "target":"navTab", "rel":"form-validate"},{"id":2, "pId":0, "name":"进阶实例"},{"id":21, "pId":2, "name": "弹出窗口", "nurl":"dialog.html", "target":"navTab", "rel":"dialog"},{"id":22, "pId":2, "name": "滑动面板", "nurl":"collapse.html", "target":"navTab", "rel":"collapse"},{"id":23, "pId":2, "name": "树型菜单", "nurl":"ztree.html", "target":"navTab", "rel":"ztree"}]'></ul>
                    </td>
                    <td>class="form-control j-selectzTree" data-tree="#j_select_tree2"</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <br>
        <p>实例代码：</p>
        <pre>&lt;table class=&quot;table table-condensed table-hover&quot; width=&quot;100%&quot;&gt;
    &lt;thead&gt;
        &lt;tr&gt;
            &lt;th&gt;&lt;/th&gt;
            &lt;th&gt;样例&lt;/th&gt;
            &lt;th&gt;实现&lt;/th&gt;
            &lt;th&gt;说明&lt;/th&gt;
        &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td align=&quot;right&quot;&gt;zTree选择[多选]：&lt;/td&gt;
            &lt;td&gt;
                &lt;input type=&quot;text&quot; name=&quot;menus&quot; id=&quot;j_ztree_menus1&quot; class=&quot;form-control j-selectzTree&quot; size=&quot;18&quot; readonly=&quot;readonly&quot; value=&quot;&quot; data-tree=&quot;#j_select_tree1&quot;&gt;
                &lt;ul id=&quot;j_select_tree1&quot; class=&quot;ztree hide&quot; attrs = &#39;{&quot;expandAll&quot;:true, &quot;checkEnable&quot;:true, &quot;onClick&quot;:&quot;S_NodeClick&quot;, &quot;onCheck&quot;:&quot;S_NodeCheck&quot;}&#39; 
                    nodes=&#39;[{&quot;id&quot;:1, &quot;pId&quot;:0, &quot;name&quot;:&quot;基本元素&quot;},{&quot;id&quot;:11, &quot;pId&quot;:1, &quot;name&quot;: &quot;普通表格&quot;, &quot;nurl&quot;:&quot;table.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;table&quot;},{&quot;id&quot;:12, &quot;pId&quot;:1, &quot;name&quot;: &quot;固定表头表格&quot;, &quot;nurl&quot;:&quot;table-grid.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;table-grid&quot;},{&quot;id&quot;:13, &quot;pId&quot;:1, &quot;name&quot;: &quot;可编辑表格&quot;, &quot;nurl&quot;:&quot;table-edit.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;table-edit&quot;},{&quot;id&quot;:14, &quot;pId&quot;:1, &quot;name&quot;: &quot;演示表单&quot;, &quot;nurl&quot;:&quot;form.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;form&quot;},{&quot;id&quot;:15, &quot;pId&quot;:1, &quot;name&quot;: &quot;表单元素&quot;, &quot;nurl&quot;:&quot;form-input.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;form-input&quot;},{&quot;id&quot;:16, &quot;pId&quot;:1, &quot;name&quot;: &quot;验证表单&quot;, &quot;nurl&quot;:&quot;form-validate.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;form-validate&quot;},{&quot;id&quot;:2, &quot;pId&quot;:0, &quot;name&quot;:&quot;进阶实例&quot;},{&quot;id&quot;:21, &quot;pId&quot;:2, &quot;name&quot;: &quot;弹出窗口&quot;, &quot;nurl&quot;:&quot;dialog.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;dialog&quot;},{&quot;id&quot;:22, &quot;pId&quot;:2, &quot;name&quot;: &quot;滑动面板&quot;, &quot;nurl&quot;:&quot;collapse.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;collapse&quot;},{&quot;id&quot;:23, &quot;pId&quot;:2, &quot;name&quot;: &quot;树型菜单&quot;, &quot;nurl&quot;:&quot;ztree.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;ztree&quot;}]&#39;&gt;&lt;/ul&gt;
            &lt;/td&gt;
            &lt;td&gt;class=&quot;form-control j-selectzTree&quot; data-tree=&quot;#j_select_tree1&quot;&lt;/td&gt;
            &lt;td&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td align=&quot;right&quot;&gt;zTree选择[单选]：&lt;/td&gt;
            &lt;td&gt;
                &lt;input type=&quot;text&quot; name=&quot;menus&quot; id=&quot;j_ztree_menus2&quot; class=&quot;form-control j-selectzTree&quot; size=&quot;18&quot; readonly=&quot;readonly&quot; value=&quot;&quot; data-tree=&quot;#j_select_tree2&quot;&gt;
                &lt;ul id=&quot;j_select_tree2&quot; class=&quot;ztree hide&quot; attrs = &#39;{&quot;expandAll&quot;:true, &quot;checkEnable&quot;:true, &quot;chkStyle&quot;:&quot;radio&quot;, &quot;radioType&quot;:&quot;all&quot;, &quot;onClick&quot;:&quot;S_NodeClick&quot;, &quot;onCheck&quot;:&quot;S_NodeCheck&quot;}&#39; 
                    nodes=&#39;[{&quot;id&quot;:1, &quot;pId&quot;:0, &quot;name&quot;:&quot;基本元素&quot;},{&quot;id&quot;:11, &quot;pId&quot;:1, &quot;name&quot;: &quot;普通表格&quot;, &quot;nurl&quot;:&quot;table.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;table&quot;},{&quot;id&quot;:12, &quot;pId&quot;:1, &quot;name&quot;: &quot;固定表头表格&quot;, &quot;nurl&quot;:&quot;table-grid.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;table-grid&quot;},{&quot;id&quot;:13, &quot;pId&quot;:1, &quot;name&quot;: &quot;可编辑表格&quot;, &quot;nurl&quot;:&quot;table-edit.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;table-edit&quot;},{&quot;id&quot;:14, &quot;pId&quot;:1, &quot;name&quot;: &quot;演示表单&quot;, &quot;nurl&quot;:&quot;form.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;form&quot;},{&quot;id&quot;:15, &quot;pId&quot;:1, &quot;name&quot;: &quot;表单元素&quot;, &quot;nurl&quot;:&quot;form-input.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;form-input&quot;},{&quot;id&quot;:16, &quot;pId&quot;:1, &quot;name&quot;: &quot;验证表单&quot;, &quot;nurl&quot;:&quot;form-validate.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;form-validate&quot;},{&quot;id&quot;:2, &quot;pId&quot;:0, &quot;name&quot;:&quot;进阶实例&quot;},{&quot;id&quot;:21, &quot;pId&quot;:2, &quot;name&quot;: &quot;弹出窗口&quot;, &quot;nurl&quot;:&quot;dialog.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;dialog&quot;},{&quot;id&quot;:22, &quot;pId&quot;:2, &quot;name&quot;: &quot;滑动面板&quot;, &quot;nurl&quot;:&quot;collapse.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;collapse&quot;},{&quot;id&quot;:23, &quot;pId&quot;:2, &quot;name&quot;: &quot;树型菜单&quot;, &quot;nurl&quot;:&quot;ztree.html&quot;, &quot;target&quot;:&quot;navTab&quot;, &quot;rel&quot;:&quot;ztree&quot;}]&#39;&gt;&lt;/ul&gt;
            &lt;/td&gt;
            &lt;td&gt;class=&quot;form-control j-selectzTree&quot; data-tree=&quot;#j_select_tree2&quot;&lt;/td&gt;
            &lt;td&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</pre>
    </div>
    <div class="formBar">
        <ul>
            <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
        </ul>
    </div>
</div>