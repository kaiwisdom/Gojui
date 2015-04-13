<script type="text/javascript">
function E_afterUpload(url) {
    alertMsg.info('上传成功：'+ url);
}
function E_afterSelectFile(url) {
    alertMsg.info('选择成功：'+ url);
}
function E_afterSelect(url) {
    alertMsg.info('成功插入图片：'+ url);
}
</script>
<div class="pageContent">
    <form action="ajaxDone1.html" id="j_form_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <div style="margin: 0 auto; width: 700px;">
                <textarea name="content" id="j_form_content" class="j-content" style="width: 700px;" uploadJson="php/upload_json.php" fileManagerJson="php/file_manager_json.php" afterUpload="E_afterUpload" afterSelectFile="E_afterSelectFile" X_afterSelect="E_afterSelect" minheight="200">
                    <p><strong>HTML编辑器KindEditor：</strong></p>
                    <p><strong>已优化：</strong></p>
                    <ul>
                        <li>深度清理html标记</li>
                        <li>上传附件后，自动获取文件名（需要返回JSON属性"origin_name"）</li>
                        <li>修改一键排版为段落前空两个全角空格，主要考虑到某些行需要顶格时直接删除空格即可。</li>
                    </ul>
                    <p><br>更多参数请参见：<a href="http://kindeditor.net/" target="_blank">http://kindeditor.net/</a></p>
                </textarea>
            </div>
            <br>
            <p>textarea 添加Class [<span class="red">j-content</span>] 即可激活编辑器。其他参数写法如下：</p>
            <pre>&lt;textarea name=&quot;content&quot; id=&quot;j_form_content&quot; class=&quot;j-content&quot; style=&quot;width: 700px;&quot; uploadJson=&quot;php/upload_json.php&quot; fileManagerJson=&quot;php/file_manager_json.php&quot; afterUpload=&quot;E_afterUpload&quot; afterSelectFile=&quot;E_afterSelectFile&quot; X_afterSelect=&quot;E_afterSelect&quot; minheight=&quot;200&quot;&gt;&lt;/textarea&gt;</pre>
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
                        <td>pasteType</td>
                        <td>Int</td>
                        <td>2</td>
                        <td>粘贴方式(0:禁止粘贴, 1:纯文本粘贴, 2:HTML粘贴)</td>
                    </tr>
                    <tr>
                        <td>items</td>
                        <td>Array</td>
                        <td>见：<a href="http://kindeditor.net/docs/option.html#items" target="_blank">http://kindeditor.net/docs/option.html#items</a></td>
                        <td>配置编辑器的工具栏，其中”/”表示换行，”|”表示分隔符。</td>
                    </tr>
                    <tr>
                        <td>minHeight</td>
                        <td>Int</td>
                        <td>260</td>
                        <td>指定编辑器最小高度，单位为px。</td>
                    </tr>
                    <tr>
                        <td>autoHeight</td>
                        <td>Boolean</td>
                        <td>false</td>
                        <td>是否开启编辑框自动高度调整。</td>
                    </tr>
                    <tr>
                        <td>uploadJson</td>
                        <td>String</td>
                        <td>null</td>
                        <td>指定上传文件的服务器端URL。</td>
                    </tr>
                    <tr>
                        <td>fileManagerJson</td>
                        <td>String</td>
                        <td>null</td>
                        <td>指定浏览远程图片的服务器端URL。</td>
                    </tr>
                    <tr>
                        <td>afterUpload</td>
                        <td>function(url)</td>
                        <td>null</td>
                        <td>上传文件后执行的回调函数。</td>
                    </tr>
                    <tr>
                        <td>afterSelectFile</td>
                        <td>function(url)</td>
                        <td>null</td>
                        <td>从图片空间选择文件后执行的回调函数。</td>
                    </tr>
                    <tr>
                        <td>X_afterSelect</td>
                        <td>function(url)</td>
                        <td>null</td>
                        <td><strong>自定义事件：</strong>当上传图片成功并插入编辑框 或 从图片空间选择图片并插入编辑框后，触发该事件。</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>