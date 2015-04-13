<script type="text/javascript">
var $chk = $('input[name="sport_checkbox"]');
$chk.on('ifChanged', function(event) {
    var $target = $(event.target);
    var checked = $target.prop('checked');
    var value   = $target.val();
    var msg     = checked ? '选择了：' : '取消了：';
    alertMsg.info(msg + value);
});
var $radio = $('input[name="sport_radio"]');
$radio.on('ifChanged', function(event) {
    var $target = $(event.target);
    var checked = $target.prop('checked');
    var value   = $target.val();
    alertMsg.info('选择了：' + value);
});
</script>
<div class="pageContent">
    <form action="ajaxDone1.html" id="j_image_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <table class="table table-condensed table-hover" width="100%">
                <thead>
                    <tr>
                        <th width="120" class="center">类型</th>
                        <th>样例</th>
                        <th>代码</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <label class="control-label x120" for="">复选框：</label>
                        </td>
                        <td>
                            <input type="checkbox" name="sport_checkbox" id="j_form_checkbox1" class="j-icheck" value="足球">
                            <label class="ilabel" for="j_form_checkbox1">足球&nbsp;</label>
                            <input type="checkbox" name="sport_checkbox" id="j_form_checkbox2" class="j-icheck" value="篮球">
                            <label class="ilabel" for="j_form_checkbox2">篮球&nbsp;</label>
                            <input type="checkbox" name="sport_checkbox" id="j_form_checkbox3" class="j-icheck" value="排球">
                            <label class="ilabel" for="j_form_checkbox3">排球&nbsp;</label>
                            <input type="checkbox" name="sport_checkbox" id="j_form_checkbox4" class="j-icheck" value="网球">
                            <label class="ilabel" for="j_form_checkbox4">网球&nbsp;</label>
                            <input type="checkbox" name="sport_checkbox" id="j_form_checkbox5" class="j-icheck" value="棒球">
                            <label class="ilabel" for="j_form_checkbox5">棒球</label>
                        </td>
                        <td><pre>&lt;input type=&quot;checkbox&quot; name=&quot;sport_checkbox&quot; id=&quot;j_form_checkbox1&quot; class=&quot;j-icheck&quot; value=&quot;足球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_checkbox1&quot;&gt;足球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;checkbox&quot; name=&quot;sport_checkbox&quot; id=&quot;j_form_checkbox2&quot; class=&quot;j-icheck&quot; value=&quot;篮球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_checkbox2&quot;&gt;篮球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;checkbox&quot; name=&quot;sport_checkbox&quot; id=&quot;j_form_checkbox3&quot; class=&quot;j-icheck&quot; value=&quot;排球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_checkbox3&quot;&gt;排球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;checkbox&quot; name=&quot;sport_checkbox&quot; id=&quot;j_form_checkbox4&quot; class=&quot;j-icheck&quot; value=&quot;网球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_checkbox4&quot;&gt;网球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;checkbox&quot; name=&quot;sport_checkbox&quot; id=&quot;j_form_checkbox5&quot; class=&quot;j-icheck&quot; value=&quot;棒球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_checkbox5&quot;&gt;棒球&lt;/label&gt;</pre></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label x120" for="">单选框：</label>
                        </td>
                        <td>
                            <input type="radio" name="sport_radio" id="j_form_radio1" class="j-icheck" value="足球">
                            <label class="ilabel" for="j_form_radio1">足球&nbsp;</label>
                            <input type="radio" name="sport_radio" id="j_form_radio2" class="j-icheck" value="篮球">
                            <label class="ilabel" for="j_form_radio2">篮球&nbsp;</label>
                            <input type="radio" name="sport_radio" id="j_form_radio3" class="j-icheck" value="排球">
                            <label class="ilabel" for="j_form_radio3">排球&nbsp;</label>
                            <input type="radio" name="sport_radio" id="j_form_radio4" class="j-icheck" value="网球">
                            <label class="ilabel" for="j_form_radio4">网球&nbsp;</label>
                            <input type="radio" name="sport_radio" id="j_form_radio5" class="j-icheck" value="棒球">
                            <label class="ilabel" for="j_form_radio5">棒球</label>
                        </td>
                        <td><pre>&lt;input type=&quot;radio&quot; name=&quot;sport_radio&quot; id=&quot;j_form_radio1&quot; class=&quot;j-icheck&quot; value=&quot;足球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_radio1&quot;&gt;足球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;radio&quot; name=&quot;sport_radio&quot; id=&quot;j_form_radio2&quot; class=&quot;j-icheck&quot; value=&quot;篮球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_radio2&quot;&gt;篮球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;radio&quot; name=&quot;sport_radio&quot; id=&quot;j_form_radio3&quot; class=&quot;j-icheck&quot; value=&quot;排球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_radio3&quot;&gt;排球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;radio&quot; name=&quot;sport_radio&quot; id=&quot;j_form_radio4&quot; class=&quot;j-icheck&quot; value=&quot;网球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_radio4&quot;&gt;网球&amp;nbsp;&lt;/label&gt;
&lt;input type=&quot;radio&quot; name=&quot;sport_radio&quot; id=&quot;j_form_radio5&quot; class=&quot;j-icheck&quot; value=&quot;棒球&quot;&gt;
&lt;label class=&quot;ilabel&quot; for=&quot;j_form_radio5&quot;&gt;棒球&lt;/label&gt;</pre></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <label>本例回调事件代码：</label>
            <pre>var $chk = $(&#39;input[name=&quot;sport_checkbox&quot;]&#39;);
$chk.on(&#39;ifChanged&#39;, function(event) {
    var $target = $(event.target);
    var checked = $target.prop(&#39;checked&#39;);
    var value   = $target.val();
    var msg     = checked ? &#39;选择了：&#39; : &#39;取消了：&#39;;
    alertMsg.info(msg + value);
});
var $radio = $(&#39;input[name=&quot;sport_radio&quot;]&#39;);
$radio.on(&#39;ifChanged&#39;, function(event) {
    var $target = $(event.target);
    var checked = $target.prop(&#39;checked&#39;);
    var value   = $target.val();
    alertMsg.info(&#39;选择了：&#39; + value);
});</pre>
            <p>* 更多参数请参见：<a href="http://www.bootcss.com/p/icheck/" target="_blank">http://www.bootcss.com/p/icheck/</a></p>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>