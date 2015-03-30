<script type="text/javascript">
function pic_upload_success(data) {
    var json = jQuery.parseJSON(data);
    DWZ.ajaxDone(json);
    if (json[DWZ.keys.statusCode] == DWZ.statusCode.ok) {
        $('#j_custom_pic').val(json.navTabId);
        $('#j_custom_span_pic').html('<img src="'+ json.navTabId +'" width="100" />');
    }
}
</script>
<div class="pageContent">
    <form action="ajaxDone1.html" id="j_custom_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <div class="pageFormContent" layouth="29">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="j_custom_cate" class="control-label x85">客户类型：</label>
                            <select name="custom.type" id="j_custom_cate" class="selectpicker show-tick validate[required]" data-style="btn-default btn-sel" data-width="auto">
                                <option value="">全部</option>
                                <option value="1">联社营业部1</option>
                                <option value="2" selected>联社营业部2</option>
                                <option value="3">联社营业部3</option>
                                <option value="4">联社营业部4</option>
                            </select>
                        </td>
                        <td>
                            <label for="j_custom_code" class="control-label x85">客户号：</label>
                            <input type="text" name="custom.code" id="j_custom_code" value="120113196309052434" class="form-control validate[required, custom[integer]] required" size="30">
                        </td>
                        <td>
                            <label for="j_custom_color" class="control-label x85">表示颜色：</label>
                            <input type="text" name="custom.color" id="j_custom_color" value="" class="form-control j-colorpicker" isbgcolor="true" readonly="readonly" size="15">
                            <a href="javascript:;" title="清除颜色" class="j-clearcolor" element="#j_custom_color">清除颜色</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_custom_name" class="control-label x85">客户名称：</label>
                            <input type="text" name="custom.name" id="j_custom_name" value="天津市华建装饰工程有限公司" class="form-control validate[required] required" size="30"></td>
                        <td>
                            <label for="j_custom_grade" class="control-label x85">信用等级：</label>
                            <select name="grade" id="j_custom_grade" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto">
                                <option value="">全部</option>
                                <option value="1">1级</option>
                                <option value="2">2级</option>
                                <option value="3" selected>3级</option>
                                <option value="4">4级</option>
                                <option value="4">5级</option>
                            </select>
                        </td>
                        <td>
                            <label for="j_custom_industry" class="control-label x85">所属行业:</label>
                            <select name="industry" id="j_custom_industry" class="selectpicker show-tick" data-style="btn-default btn-sel" data-width="auto">
                                <option value="">全部</option>
                                <option value="1">政府机构</option>
                                <option value="2">事业单位</option>
                                <option value="3">教育培训</option>
                                <option value="4">IT</option>
                                <option value="4" selected>其他</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label x85">客户图片：</label>
                            <div style="display: inline-block;">
                                <input id="fileInput-custom" type="file" name="up_pics" 
                                    uploaderOption="{
                                        uploader:'ajaxPic.html?sessionid=?',
                                        formData:{'dir':'image', 'width':'600', 'height':'400'},
                                        buttonText:'选择上传图片',
                                        fileSizeLimit:40960,
                                        fileTypeDesc:'*.jpg;*.gif;*.png;',
                                        fileTypeExts:'*.jpg;*.gif;*.png;',
                                        onUploadSuccess: function(file, data, response) {
                                            pic_upload_success(data);
                                        }
                                    }"
                                />
                            </div>
                            <div style="display: inline-block;">
                                <input type="hidden" name="custom.pic" value="" id="j_custom_pic" />
                                <span id="j_custom_span_pic"></span>
                            </div>
                        </td>
                        <td colspan="2">
                            <label for="" class="control-label x85">标签：</label>
                            <div class="tags-control validate[required, minTag[2], maxTag[3]]" data-url="php/get-project-list.php" data-parameterName="tagname" data-clearNotFound="false" data-max="5" errTop="-2">
                                <input type="text" class="tag-input" size="15" placeholder="输入标签，回车提交" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x85">审核状态：</label>
                            <input type="checkbox" name="custom.isaudit" id="j_custom_isaudit" class="j-icheck" value="true" checked /><label for="j_custom_isaudit" class="ilabel">已审核</label>
                        </td>
                        <td>
                            <label for="" class="control-label x85">显示状态：</label>
                            <input type="radio" name="custom.isshow" id="j_custom_isshow1" class="j-icheck" value="true" checked /><label for="j_custom_isshow1" class="ilabel">显示&nbsp;&nbsp;</label>
                            <input type="radio" name="custom.isshow" id="j_custom_isshow2" class="j-icheck" value="true" checked /><label for="j_custom_isshow2" class="ilabel">不显示</label>
                        </td>
                        <td>
                            <label for="j_custom_createtime" class="control-label x85">更新时间：</label>
                            <input type="text" name="custom.createtime" id="j_custom_createtime" value="2014-07-21 12:37:00" class="form-control x200 block date" datefmt="yyyy-MM-dd HH:mm:ss" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label for="j_custom_content" class="control-label x85">内容编辑：</label>
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