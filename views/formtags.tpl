<script type="text/javascript">

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
                            <label class="control-label x120" for="">清除未找到的输入：</label>
                        </td>
                        <td>
                            <div class="tags-control" data-url="php/get-project-list.php" data-parametername="tagname" data-clearnotfound="true">
                                <input type="text" class="tag-input" size="20" placeholder="输入标签，回车提交" />
                            </div>
                        </td>
                        <td><pre>&lt;div class=&quot;tags-control&quot; data-url=&quot;php/get-project-list.php&quot; data-parametername=&quot;tagname&quot; data-clearnotfound=&quot;true&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;tag-input&quot; placeholder=&quot;输入标签，回车提交&quot; /&gt;
&lt;/div&gt;</pre></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label x120" for="">最多3个标签：</label>
                        </td>
                        <td>
                            <div class="tags-control" data-url="php/get-project-list.php" data-parametername="tagname" data-max="3">
                                <input type="text" class="tag-input" size="20" placeholder="输入标签，回车提交" />
                            </div>
                        </td>
                        <td><pre>&lt;div class=&quot;tags-control&quot; data-url=&quot;php/get-project-list.php&quot; data-parametername=&quot;tagname&quot; data-max=&quot;3&quot;&gt;
    &lt;input type=&quot;text&quot; class=&quot;tag-input&quot; placeholder=&quot;输入标签，回车提交&quot; /&gt;
&lt;/div&gt;</pre></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <div class="alert alert-info form-block"><strong>JSON格式：</strong>[{"label":"中国", "value":"China"}, {"label":"日本", "value":"Jpan"}, {"label":"韩国", "value":"Korea"}]</div>
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
                        <td>data-url</td>
                        <td>String</td>
                        <td>null</td>
                        <td>查找JSON数据的URL</td>
                    </tr>
                    <tr>
                        <td>data-parametername</td>
                        <td>String</td>
                        <td>labelValue</td>
                        <td>存放标签值的input的name</td>
                    </tr>
                    <tr>
                        <td>data-clearnotfound</td>
                        <td>Boolean</td>
                        <td>false</td>
                        <td>是否清除无返回JSON的输入值，为true时输入的内容可以生成标签</td>
                    </tr>
                    <tr>
                        <td>data-max</td>
                        <td>Int</td>
                        <td>0</td>
                        <td>(0=不限个数)允许输入的最多标签个数</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <p>* 基于BootstrapPlugin - tags修改：<a href="http://yingzhuo.iteye.com/blog/1739377" target="_blank">http://yingzhuo.iteye.com/blog/1739377</a></p>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>