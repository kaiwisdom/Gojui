<script type="text/javascript">
//自动有效日期
$(document).on('change', '.j_custom_issuedate', function() {
	var start = $(this).val();
    if (start) {
        var $end = $(this).closest('td').next().find('input.date');
        if (!$end.val()) {
            start     = start.parseDate('yyyy-MM-dd');
            var end   = start;
            end.setFullYear(start.getFullYear() + 10);
            end.setDate(start.getDate() - 1);
            $end.val(end.formatDate('yyyy-MM-dd'));
        }
    }
});
function custom_autodate(o, date) {
    var $start = $(o);
    var $end = $start.closest('td').next().find('input.date');
    if (!$end.val()) {
        var start = date;
        start     = start.parseDate('yyyy-MM-dd');
        var end   = start;
        end.setFullYear(start.getFullYear() + 10);
        end.setDate(start.getDate() - 1);
        $end.val(end.formatDate('yyyy-MM-dd'));
    }
}
//上传图片完成回调
function custom_pic_upload_success(data, o) {
    var json = $.parseJSON(data);
    DWZ.ajaxDone(json);
    if (json[DWZ.keys.statusCode] == DWZ.statusCode.ok) {
        var pic    = json.navTabId,
            upid   = o.settings ? o.settings.id : $(o).attr('id'),
            $upbox = $('#'+ upid);
        $upbox.nextUntil('.pic-box').val(pic).next('.pic-box').html('<img src="'+ pic +'" width="80" />');
    }
}
//删除回调
function table_del_callfun() {
    alertMsg.info('删除了一条数据！');
}
</script>
<div class="pageHeader">
    <form id="pagerForm" onsubmit="return navTabSearch(this);" action="table-edit.html" method="post">
        <input type="hidden" name="pageNum" value="${model.pageNum}">
        <input type="hidden" name="numPerPage" value="${model.numPerPage}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="searchBar">
            <ul class="searchContent">
                <li><label>姓名：</label><input type="text" value="" name="name" class="form-control" size="10" /></li>
                <li><label>护照号：</label><input type="text" value="" name="passportno" class="form-control" size="8" /></li>
                <li><label>出生日期:</label><input type="text" value="" name="birthday" class="form-control date" size="10" /></li>
                <li><button type="submit" class="btn btn-default btn-sm">查询</button></li>
                <li><a class="btn btn-orange btn-sm" href="javascript:navTab.reload('', {clearQuery:true});">清空查询</a></li>
                <li><div class="alert alert-info search-inline"><i class="fa fa-info-circle"></i> 双击行可编辑</div></li>
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
    </form>
</div>
<div class="pageContent">
    <form action="ajaxDone3.html" id="j_custom_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <table class="table table-bordered table-hover table-striped table-top itemDetail" layoutH="70">
            <thead>
                <tr>
                    <th type="text" name="customList[#index#].id" size="5" fieldClass="validate[required, custom[integer]]" defaultVal="#index#">No.</th>
                    <th type="text" name="customList[#index#].name" size="5" fieldClass="required">客人姓名</th>
                    <th type="text" name="customList[#index#].surname" size="5">拼音姓</th>
                    <th type="text" name="customList[#index#].enname" size="5">拼音名</th>
                    <th type="html" html='<select name="customList[#index#].sex" class="selectpicker show-tick" data-width="auto" data-style="btn-default btn-sel xs"><option value="true">男</option><option value="false">女</option></select>'>性别</th>
                    <th type="text" name="customList[#index#].birthday" size="10" fieldClass="date">出生日期</th>
                    <th type="text" name="customList[#index#].birthplace" size="3">出生地</th>
                    <th type="text" name="customList[#index#].passportno" size="10">护照号</th>
                    <th type="text" name="customList[#index#].issuedate" size="10" fieldClass="date j_custom_issuedate" fieldAttrs="{'callfun':'custom_autodate'}">签发日期</th>
                    <th type="text" name="customList[#index#].indate" size="10" fieldClass="date">有效日期</th>
                    <th type="text" name="customList[#index#].issueat" size="3">签发地</th>
                    <th type="text" name="customList[#index#].add" size="3">居住地</th>
                    <th type="lookup" name="customList[#index#].profession" lookupGroup="customList[#index#]" lookupPk="pid" lookupUrl="table-edit-lookup.html" size="5">职业</th>
                    <th type="text" name="customList[#index#].mobile" size="11">手机</th>
                    <th type="text" name="customList[#index#].note" size="10">备注</th>
                    <th type="html" html='<input type="checkbox" name="customList[#index#].visa" value="true" class="j-icheck">'>签证</th>
                    <th type="html" html='<input type="file" name="up-pic" id="fileInput-custom-i#index#" uploaderOption="{uploader:&apos;ajaxPic.html?sessionid=?&apos;,formData:{&apos;dir&apos;:&apos;image&apos;, &apos;width&apos;:&apos;600&apos;, &apos;height&apos;:&apos;400&apos;},width:80,buttonText:&apos;选择上传图片&apos;,fileSizeLimit:&apos;40960KB&apos;,fileTypeDesc:&apos;*.jpg;*.gif;*.png;&apos;,fileTypeExts:&apos;*.jpg;*.gif;*.png;&apos;,previewImg:false,onUploadSuccess: function(file, data, response) {custom_pic_upload_success(data,this);}}"><input type="hidden" name="customList[#index#].pic" class="pic-name"><span class="pic-box"></span>'>照片</th>
                    <th type="del" width="70" fieldAttrs="{'title':'确定要删除行吗？', 'value':'删'}">
                        <input type="text" value="1" class="form-control sm2 num-add" title="待添加的行数">
                        <a href="javascript:;" class="j-add" title="添加行"><i class="fa fa-plus"></i></a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="readonly">
                    <td><input type="text" name="customList[0].id" class="form-control validate[required, custom[integer]]" value="1" size="5"></td>
                    <td><input type="text" name="customList[0].name" class="form-control validate[required]" value="熊大" size="5"></td>
                    <td><input type="text" name="customList[0].surname" class="form-control" value="Xiong" size="5"></td>
                    <td><input type="text" name="customList[0].enname" class="form-control" value="Da" size="5"></td>
                    <td><select name="customList[0].sex" class="selectpicker show-tick" data-width="auto" data-style="btn-default btn-sel xs"><option value="true">男</option><option value="false">女</option></select></td>
                    <td><input type="text" name="customList[0].birthday" class="form-control date" value="2010-01-02" size="10"></td>
                    <td><input type="text" name="customList[0].birthplace" class="form-control" value="火星" size="3"></td>
                    <td><input type="text" name="customList[0].passportno" class="form-control" value="010101" size="5"></td>
                    <td><input type="text" name="customList[0].issuedate" class="form-control date j_custom_issuedate" callfun="custom_autodate" value="" size="10"></td>
                    <td><input type="text" name="customList[0].indate" class="form-control date" value="" size="10"></td>
                    <td><input type="text" name="customList[0].issueat" class="form-control" value="北京" size="5"></td>
                    <td><input type="text" name="customList[0].add" class="form-control" value="森林" size="5"></td>
                    <td><div class="lookup-box"><input type="text" name="customList[0].profession" class="form-control" value="逗你玩" size="5">
                        <a class="j-lookup" href="table-edit-lookup.html" lookupgroup="customList[0]" lookuppk="pid" title="选择"><i class="fa fa-search"></i></a>
                    </div></td>
                    <td><input type="text" name="customList[0].mobile" class="form-control" value="1111111" size="5"></td>
                    <td><textarea name="customList[0].note" class="form-control autosize" rows="1"></textarea></td>
                    <td><input type="checkbox" name="customList[0].visa" class="j-icheck" value="true"></td>
                    <td><input id="fileInput-custom-i0" type="file" name="up_pics" 
                        uploaderOption="{
                            uploader:'ajaxPic.html?sessionid=?',
                            formData:{'dir':'image', 'width':'600', 'height':'400'},
                            width: 80,
                            buttonText:'选择上传图片',
                            fileSizeLimit:'40960KB',
                            fileTypeDesc:'*.jpg;*.gif;*.png;',
                            fileTypeExts:'*.jpg;*.gif;*.png;',
                            previewImg:false,
                            onUploadSuccess: function(file, data, response) {
                                custom_pic_upload_success(data, this);
                            }
                        }"
                    /><input type="hidden" name="customList[0].pic" class="pic-name" value=""><span class="pic-box"><img src="images/logo.png" width="80"></span></td>
                    <td>
                        <button type="button" class="btn btn-green btn-sm j-edit">编辑</button>
                        <a href="ajaxDone3.html" class="btn btn-red btn-sm j-del" target="ajaxTodo" callfun="table_del_callfun" title="确定要删除该行信息吗？">删</a>
                    </td>
                </tr>
                <tr class="readonly">
                    <td><input type="text" name="customList[1].id" class="form-control validate[required, custom[integer]]" value="2" size="5"></td>
                    <td><input type="text" name="customList[1].name" class="form-control validate[required]" value="光头强" size="5"></td>
                    <td><input type="text" name="customList[1].surname" class="form-control" value="Xiong" size="5"></td>
                    <td><input type="text" name="customList[1].enname" class="form-control" value="Da" size="5"></td>
                    <td><select name="customList[1].sex" class="selectpicker show-tick" data-width="auto" data-style="btn-default btn-sel xs"><option value="true">男</option><option value="false">女</option></select></td>
                    <td><input type="text" name="customList[1].birthday" class="form-control date" value="2011-05-01" size="10"></td>
                    <td><input type="text" name="customList[1].birthplace" class="form-control" value="火星" size="3"></td>
                    <td><input type="text" name="customList[1].passportno" class="form-control" value="010101" size="5"></td>
                    <td><input type="text" name="customList[1].issuedate" class="form-control date j_custom_issuedate" callfun="custom_autodate" value="" size="10"></td>
                    <td><input type="text" name="customList[1].indate" class="form-control date" value="" size="10"></td>
                    <td><input type="text" name="customList[1].issueat" class="form-control" value="北京" size="5"></td>
                    <td><input type="text" name="customList[1].add" class="form-control" value="森林" size="5"></td>
                    <td><div class="lookup-box"><input type="text" name="customList[1].profession" class="form-control" value="猎熊人" size="5">
                        <a class="j-lookup" href="table-edit-lookup.html" lookupgroup="customList[1]" lookuppk="pid" title="选择"><i class="fa fa-search"></i></a>
                    </div></td>
                    <td><input type="text" name="customList[1].mobile" class="form-control" value="1111111" size="5"></td>
                    <td><textarea name="customList[1].note" class="form-control autosize" rows="1"></textarea></td>
                    <td><input type="checkbox" name="customList[1].visa" class="j-icheck" value="true"></td>
                    <td><input id="fileInput-custom-i1" type="file" name="up_pics" 
                        uploaderOption="{
                            uploader:'ajaxPic.html?sessionid=?',
                            formData:{'dir':'image', 'width':'600', 'height':'400'},
                            width: 80,
                            buttonText:'选择上传图片',
                            fileSizeLimit:'40960KB',
                            fileTypeDesc:'*.jpg;*.gif;*.png;',
                            fileTypeExts:'*.jpg;*.gif;*.png;',
                            previewImg:false,
                            onUploadSuccess: function(file, data, response) {
                                custom_pic_upload_success(data, this);
                            }
                        }"
                    /><input type="hidden" name="customList[1].pic" class="pic-name" value=""><span class="pic-box"></span></td>
                    <td>
                        <button type="button" class="btn btn-green btn-sm j-edit">编辑</button>
                        <a href="ajaxDone3.html" class="btn btn-red btn-sm j-del" target="ajaxTodo" title="确定要删除该行信息吗？">删</a>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="formBar">
            <ul>
                <li><button type="submit" class="btn btn-default btn-sm">保存</button></li>
                <li><button type="button" class="btn btn-close btn-sm">取消</button></li>
            </ul>
        </div>
    </form>
</div>
