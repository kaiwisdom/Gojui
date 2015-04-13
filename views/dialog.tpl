<script type="text/javascript">
function pic_form_upload_success(data) {
    var json = jQuery.parseJSON(data);
    DWZ.ajaxDone(json);
    if (json.statusCode == DWZ.statusCode.ok) {
        $('#j_form_pic').val(json.navTabId);
        $('#j_form_span_pic').html('<img src="'+ json.navTabId +'" width="100" />');
    }
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
                    <td align="right">普通弹出窗口：</td>
                    <td>
                        <a href="dialog-normal.html" class="btn btn-default btn-sm" target="dialog" width="800" height="400">普通弹出窗口</a>
                    </td>
                    <td>target="dialog" width="800" height="400"</td>
                    <td></td>
                </tr>
                <tr>
                    <td align="right">模态弹出窗口：</td>
                    <td>
                        <a href="dialog-normal.html" class="btn btn-default btn-sm" target="dialog" width="800" height="400" mask="true">模态弹出窗口</a>
                    </td>
                    <td>target="dialog" width="800" height="400" mask="true"</td>
                    <td></td>
                </tr>
                <tr>
                    <td align="right">多层模态弹出窗口：</td>
                    <td>
                        <a href="dialog-modal.html" class="btn btn-default btn-sm" target="dialog" width="800" height="400" mask="true">多层模态弹出窗口</a>
                    </td>
                    <td>target="dialog" width="800" height="400" mask="true"</td>
                    <td>添加mask="true"属性即可</td>
                </tr>
                <tr>
                    <td colspan="4"><br>
                        <span>修改刷新方法为：refresh(dialogId) ，刷新一个弹出窗口，不指定ID则刷新当前窗口。使用： $.pdialog.refresh(dialogId)。</span><br>
                        <span>URL变化了的重新载入仍为：reload(url, options)</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4"><br>
                        * 其他同DWZ：<a href="http://j-ui.com" target="_blank">http://j-ui.com</a>。
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="formBar">
        <ul>
            <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
        </ul>
    </div>
</div>