<div class="pageContent">
    <form action="ajaxDone3.html" id="j_validate_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <table class="table table-condensed table-hover" width="100%">
                <thead>
                    <tr>
                        <th></th>
                        <th>验证Class</th>
                        <th>完整Class</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="400">
                            <label for="j_validate_name" class="control-label x150">必填字段[无*号提示]：</label>
                            <input type="text" name="name1" id="j_validate_name" class="form-control validate[required]" size="20" placeholder="必填字段">
                        </td>
                        <td>validate[required]</td>
                        <td>form-control validate[required]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_name2" class="control-label x150">必填字段[有*号提示]：</label>
                            <input type="text" name="name2" id="j_validate_name2" class="form-control validate[required] required" size="20" placeholder="必填字段">
                        </td>
                        <td>validate[required] required</td>
                        <td>form-control validate[required] required</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_select" class="control-label x150">必选下拉列表：</label>
                            <select name="select" id="j_validate_select" class="selectpicker show-tick validate[required]" data-style="btn-default btn-sel" data-width="auto">
                                <option value=""></option>
                                <option value="1">选项1</option>
                                <option value="2">选项2</option>
                                <option value="3">选项3</option>
                                <option value="4">选项4</option>
                            </select>
                        </td>
                        <td>validate[required]</td>
                        <td>selectpicker show-tick validate[required]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_mail" class="control-label x150">必填+邮箱：</label>
                            <input type="text" name="mail" id="j_validate_mail" class="form-control validate[required, custom[email]] required" size="20" placeholder="必填邮箱">
                        </td>
                        <td>validate[required, custom[email]] required</td>
                        <td>form-control validate[required, custom[email]] required</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_password" class="control-label x150">密码：</label>
                            <input type="password" name="password" id="j_validate_password" class="form-control validate[required] required" size="20" placeholder="密码">
                        </td>
                        <td>validate[required] required</td>
                        <td>form-control validate[required] required</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_password_confirm" class="control-label x150">确认密码：</label>
                            <input type="password" name="password_confirm" id="j_validate_password_confirm" class="form-control validate[required, equals[j_validate_password]] required" size="20" placeholder="确认密码">
                        </td>
                        <td>validate[required, equals[j_validate_password]] required</td>
                        <td>form-control validate[required, equals[j_validate_password]] required</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_integer" class="control-label x150">整数：</label>
                            <input type="text" name="integer" id="j_validate_integer" class="form-control validate[custom[integer]]" size="20" placeholder="整数">
                        </td>
                        <td>validate[custom[integer]]</td>
                        <td>form-control validate[custom[integer]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_number" class="control-label x150">浮点数：</label>
                            <input type="text" name="number" id="j_validate_number" class="form-control validate[custom[number]]" size="20" placeholder="浮点数">
                        </td>
                        <td>validate[custom[number]]</td>
                        <td>form-control validate[custom[number]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_max" class="control-label x150">最大值：</label>
                            <input type="text" name="max" id="j_validate_max" class="form-control validate[max[100]]" size="20" placeholder="<=100的数字">
                        </td>
                        <td>validate[max[100]]</td>
                        <td>form-control validate[max[100]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_min" class="control-label x150">最小值：</label>
                            <input type="text" name="min" id="j_validate_min" class="form-control validate[min[50]]" size="20" placeholder=">=50的数字">
                        </td>
                        <td>validate[min[50]]</td>
                        <td>form-control validate[min[50]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_range" class="control-label x150">最小值-最大值：</label>
                            <input type="text" name="range" id="j_validate_range" class="form-control validate[max[9],min[2]]" size="20" placeholder="1<数字<10">
                        </td>
                        <td>validate[max[10],min[2]]</td>
                        <td>form-control validate[max[10],min[2]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_maxsize" class="control-label x150">最大字符数：</label>
                            <input type="text" name="maxsize" id="j_validate_maxsize" class="form-control validate[maxSize[10]]" size="20" placeholder="<=10个字符">
                        </td>
                        <td>validate[maxSize[10]]</td>
                        <td>form-control validate[maxSize[10]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_minsize" class="control-label x150">最小字符数：</label>
                            <input type="text" name="minsize" id="j_validate_minsize" class="form-control validate[minSize[2]]" size="20" placeholder=">=2个字符">
                        </td>
                        <td>validate[minSize[2]]</td>
                        <td>form-control validate[minSize[2]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_url" class="control-label x150">URL：</label>
                            <input type="text" name="url" id="j_validate_url" class="form-control validate[custom[url]]" size="20" placeholder="URL">
                        </td>
                        <td>validate[custom[url]]</td>
                        <td>form-control validate[custom[url]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_date" class="control-label x150">日期格式：</label>
                            <input type="text" name="date" id="j_validate_date" class="form-control validate[custom[date]]" size="20" placeholder="日期">
                        </td>
                        <td>validate[custom[date]]</td>
                        <td>form-control validate[custom[date]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_datetime" class="control-label x150">日期时间格式：</label>
                            <input type="text" name="datetime" id="j_validate_datetime" class="form-control validate[custom[dateTime]]" size="20" placeholder="日期时间">
                        </td>
                        <td>validate[custom[dateTime]]</td>
                        <td>form-control validate[custom[dateTime]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_other" class="control-label x150">数字+字母：</label>
                            <input type="text" name="other" id="j_validate_other" class="form-control validate[custom[onlyLetterNumber]]" size="20" placeholder="数字+字母">
                        </td>
                        <td>validate[custom[onlyLetterNumber]]</td>
                        <td>form-control validate[custom[onlyLetterNumber]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_chinese" class="control-label x150">中文：</label>
                            <input type="text" name="chinese" id="j_validate_chinese" class="form-control validate[custom[chinese]]" size="20" placeholder="中文">
                        </td>
                        <td>validate[custom[chinese]]</td>
                        <td>form-control validate[custom[chinese]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_mobile" class="control-label x150">手机号码：</label>
                            <input type="text" name="mobile" id="j_validate_mobile" class="form-control validate[custom[mobile]]" size="20" placeholder="手机号码">
                        </td>
                        <td>validate[custom[mobile]]</td>
                        <td>form-control validate[custom[mobile]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_validate_ID" class="control-label x150">身份证号：</label>
                            <input type="text" name="ID" id="j_validate_ID" class="form-control validate[custom[chinaID]]" size="20" placeholder="身份证号">
                        </td>
                        <td>validate[custom[chinaID]]</td>
                        <td>form-control validate[custom[chinaID]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x150">复选框：</label>
                            <input type="checkbox" name="checkbox" id="j_validate_checkbox1" class="j-icheck validate[minCheckbox[2]]" errTop="-3">
                            <label for="j_validate_checkbox1" class="ilabel">选项一&nbsp;</label>
                            <input type="checkbox" name="checkbox" id="j_validate_checkbox2" class="j-icheck validate[minCheckbox[2]]">
                            <label for="j_validate_checkbox2" class="ilabel">选项二&nbsp;</label>
                            <input type="checkbox" name="checkbox" id="j_validate_checkbox3" class="j-icheck validate[minCheckbox[2]]">
                            <label for="j_validate_checkbox3" class="ilabel">选项三</label>
                        </td>
                        <td>validate[minCheckbox[2]]</td>
                        <td>j-icheck validate[minCheckbox[2]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x150">单选框：</label>
                            <input type="radio" name="radio" id="j_validate_radio1" class="j-icheck validate[minCheckbox[1]]" errTop="-3">
                            <label for="j_validate_radio1" class="ilabel">选项一&nbsp;</label>
                            <input type="radio" name="radio" id="j_validate_radio2" class="j-icheck validate[minCheckbox[1]]">
                            <label for="j_validate_radio2" class="ilabel">选项二&nbsp;</label>
                            <input type="radio" name="radio" id="j_validate_radio3" class="j-icheck validate[minCheckbox[1]]">
                            <label for="j_validate_radio3" class="ilabel">选项三</label>
                        </td>
                        <td>validate[minCheckbox[1]]</td>
                        <td>j-icheck validate[minCheckbox[1]]</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="" class="control-label x150">标签：</label>
                            <div class="tags-control validate[required, minTag[2], maxTag[3]]" data-url="php/get-project-list.php" data-parameterName="tagname" data-clearNotFound="false" errTop="-2">
                                <input type="text" class="tag-input" size="20" placeholder="输入标签，回车提交" />
                            </div>
                        </td>
                        <td>validate[required, minTag[2], maxTag[3]]</td>
                        <td>tags-control validate[required, minTag[2], maxTag[3]]</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="alert alert-warning form-block">说明：tags-control或input的 [errTop] 属性表示验证时红色提示框的"top"修正值。</div>
                            <br>
                            <p>更多扩展或自定义参见：DWZ/plugs/jquery.validationEngine-zh_CN.js</p>
                            <p>jquery.validationEngine项目地址：<a href="https://github.com/posabsolute/jQuery-Validation-Engine" target="_blank">https://github.com/posabsolute/jQuery-Validation-Engine</a></p>
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