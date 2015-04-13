<script type="text/javascript">
function pic_form_upload_success(data) {
    var json = jQuery.parseJSON(data);
    DWZ.ajaxDone(json);
    if (json[DWZ.keys.statusCode] == DWZ.statusCode.ok) {
        $('#j_form_pic').val(json.navTabId);
        $('#j_form_span_pic').html('<img src="'+ json.navTabId +'" width="100" />');
    }
}
</script>
<style type="text/css">
.btns .btn {margin-bottom: 1px;}
</style>
<div class="pageContent">
    <form action="ajaxDone1.html" id="j_form_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <table class="table table-condensed table-hover" width="100%">
                <thead>
                    <tr>
                        <th class="center">状态</th>
                        <th>样例</th>
                        <th>Class</th>
                        <th>属性</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <label for="j_form_text" class="control-label x85">文本框：</label>
                        </td>
                        <td>
                            <input type="text" name="text" id="j_form_text" value="" class="form-control" size="20" placeholder="文本框">
                        </td>
                        <td>form-control</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_text2" class="control-label x85">只读文本框：</label>
                        </td>
                        <td>
                            <input type="text" name="text" id="j_form_text2" value="" class="form-control" size="20" placeholder="只读文本框" readonly="readonly">
                        </td>
                        <td>form-control</td>
                        <td>readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_textarea" class="control-label x85">多行文本框：</label>
                        </td>
                        <td>
                            <textarea name="textarea" id="j_form_textarea" class="form-control autosize" cols="20" rows="1" placeholder="多行文本框，自动行高"></textarea>
                        </td>
                        <td>form-control autosize</td>
                        <td>textarea 添加Class [<span class="red">autosize</span>] 即可实现自动行高。</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_text3" class="control-label x85">行内提示：</label>
                        </td>
                        <td>
                            <input type="text" name="text" id="j_form_text3" value="" class="form-control" size="15" placeholder="后面带提示信息">
                            <div class="alert alert-warning form-inline"><i class="fa fa-warning"></i> 我是提示信息</div>
                        </td>
                        <td>alert alert-warning form-inline</td>
                        <td>提示信息代码：<br><pre>&lt;div class=&quot;alert alert-warning form-inline&quot;&gt;
    &lt;i class=&quot;fa fa-warning&quot;&gt;&lt;/i&gt; 我是提示信息
&lt;/div&gt;</pre></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_text4" class="control-label x85">换行提示：</label>
                        </td>
                        <td>
                            <input type="text" name="text" id="j_form_text4" value="" class="form-control" size="15" placeholder="下面带提示信息">
                            <div class="alert alert-danger form-block"><i class="fa fa-times-circle"></i> 我是换行提示信息</div>
                        </td>
                        <td>alert alert-danger form-block</td>
                        <td>提示信息代码：<br><pre>&lt;div class=&quot;alert alert-warning form-block&quot;&gt;
    &lt;i class=&quot;fa fa-times-circle&quot;&gt;&lt;/i&gt; 我是换行提示信息
&lt;/div&gt;</pre></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_select" class="control-label x85">下拉框：</label>
                        </td>
                        <td>
                            <select name="select" id="j_form_select" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto">
                                <option value="">全部</option>
                                <option value="1">下拉选项1</option>
                                <option value="2" selected>下拉选项2</option>
                                <option value="3">下拉选项3</option>
                                <option value="4">下拉选项4</option>
                            </select>
                        </td>
                        <td>selectpicker show-tick</td>
                        <td>data-style="btn-default btn-sel" data-width="auto" [data-height="auto"]<br>
                            如果select动态添加了选项，使用Jquery更新列表 <br>
                            <pre>$('#select-id').selectpicker('refresh')</pre>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x85">按钮：</label>
                        </td>
                        <td class="btns">
                            <button class="btn btn-default btn-sm">普通按钮</button><br>
                            <button class="btn btn-default">大按钮</button><br>
                            <button class="btn btn-green btn-sm">绿色按钮</button><br>
                            <button class="btn btn-red btn-sm">红色按钮</button><br>
                            <button class="btn btn-orange btn-sm">橙色按钮</button>
                        </td>
                        <td>btn btn-default btn-sm<br>
                            btn btn-default<br>
                            btn btn-green btn-sm<br>
                            btn btn-red btn-sm<br>
                            btn btn-orange btn-sm
                        </td>
                        <td>特别说明：navTab和dialog页的关闭按钮需加Class [<span class="red">btn-close</span>] 方可生效<br>
                            禁用按钮加Class [<span class="red">disabled</span>]
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label x85">上传控件：</label>
                        </td>
                        <td>
                            <div style="display: inline-block;">
                                <input id="fileInput-form-input" type="file" name="up_pics" 
                                    uploaderOption="{
                                        swf:'DWZ/uploadify/scripts/uploadify.swf',
                                        uploader:'ajaxPic.html?sessionid=?',
                                        formData:{'dir':'image', 'width':'600', 'height':'400'},
                                        buttonText:'选择上传图片',
                                        fileSizeLimit:'40960KB',
                                        fileTypeDesc:'*.jpg;*.gif;*.png;',
                                        fileTypeExts:'*.jpg;*.gif;*.png;',
                                        auto:true,
                                        mulit:false,
                                        onUploadSuccess: function(file, data, response) {
                                            pic_form_upload_success(data);
                                        }
                                    }"
                                />
                            </div>
                            <div style="display: inline-block;">
                                <input type="hidden" name="pic" value="" id="j_form_pic" />
                                <span id="j_form_span_pic"></span>
                            </div>
                        </td>
                        <td>uploadify上传组件说明：file框的ID不能重复，否则后打开的页面将不能加载</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x85">复选框：</label>
                        </td>
                        <td>
                            <input type="checkbox" name="check1" id="j_form_check1" class="j-icheck" value="1" checked /><label for="j_form_check1" class="ilabel">选项一&nbsp;</label>
                            <input type="checkbox" name="check1" id="j_form_check2" class="j-icheck" value="2" checked /><label for="j_form_check2" class="ilabel">选项一&nbsp;</label>
                            <input type="checkbox" name="check1" id="j_form_check3" class="j-icheck" value="3" checked /><label for="j_form_check3" class="ilabel">选项三</label>
                        </td>
                        <td><label>checkbox的Class：&nbsp;</label>j-icheck　<label>label的Class：&nbsp;</label>ilabel</td>
                        <td>使用on方法绑定事件：<br>
                            <pre>
$('checkbox').on('ifChecked', function(event){
  alert(event.type + ' callback');
});</pre>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x85">单选框：</label>
                        </td>
                        <td>
                            <input type="radio" name="radio1" id="j_form_radio1" class="j-icheck" value="1" checked /><label for="j_form_radio1" class="ilabel">选项一&nbsp;</label>
                            <input type="radio" name="radio1" id="j_form_radio2" class="j-icheck" value="2" checked /><label for="j_form_radio2" class="ilabel">选项一&nbsp;</label>
                            <input type="radio" name="radio1" id="j_form_radio3" class="j-icheck" value="3" checked /><label for="j_form_radio3" class="ilabel">选项三</label>
                        </td>
                        <td><label>radio的Class：&nbsp;</label>j-icheck　<label>label的Class：&nbsp;</label>ilabel</td>
                        <td>更多参数及回调函数：<a href="http://www.bootcss.com/p/icheck/" target="_blank">http://www.bootcss.com/p/icheck/</a></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_date" class="control-label x85">日期输入框：</label>
                        </td>
                        <td>
                            <input type="text" name="date" id="j_form_date" value="2015-05-01" class="form-control date" size="20" readonly="readonly">
                        </td>
                        <td>form-control date</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_form_datetime" class="control-label x85">日期时间：</label>
                        </td>
                        <td>
                            <input type="text" name="datetime" id="j_form_datetime" value="2018-08-01 10:00:00" class="form-control date" size="20" datefmt="yyyy-MM-dd HH:mm:ss" readonly="readonly">
                        </td>
                        <td>form-control date</td>
                        <td>datefmt="yyyy-MM-dd HH:mm:ss"</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x85">标签：</label>
                        </td>
                        <td>
                            <div class="tags-control" data-url="php/get-project-list.php" data-parameterName="tagname" data-clearNotFound="false" errTop="-2">
                                <input type="text" class="tag-input" size="20" placeholder="输入标签，回车提交" />
                            </div>
                        </td>
                        <td>tags-control</td>
                        <td>div 添加Class [<span class="red">tags-control</span>]，input添加Class [<span class="red">tags-input</span>] 后，即可加载标签选择器<br>
                            url: 远程Ajax，查找标签，JSON格式；parameterName：提交到后台时标签的name；clearNotFound：未查找到数据时是否清除输入内容。
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x85">查找带回：</label>
                        </td>
                        <td>
                            <input type="text" name="test.profession" class="form-control" size="20" placeholder="点后边的按钮查找" />
                            <a href="table-edit-lookup.html" lookupgroup="test" title="查找带回"><i class="fa fa-search"></i></a>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label for="" class="control-label x85">内容编辑：</label></td>
                        <td colspan="2">
                            <div style="display: inline-block; vertical-align: middle;">
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
                        </td>
                        <td>textarea添加Class [<span class="red">j-content</span>] 后，即可自动加载Kindeditor编辑器<br>
                            更多属性请看：”进阶实例“ -> ”编辑器“。
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="submit" class="btn btn-default btn-sm">保存</button></li>
                <li><button type="button" class="btn btn-close btn-sm">取消</button></li>
            </ul>
        </div>
    </form>
</div>