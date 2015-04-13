<div class="pageContent">
    <form action="ajaxDone1.html" id="j_form_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <div style="margin: 10px auto 0; width: 100%;">
                <button type="button" class="btn btn-default j-tooltip" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Tooltip on left</button>
                <button type="button" class="btn btn-default j-tooltip" data-toggle="tooltip" data-placement="top" title="Tooltip on top">Tooltip on top</button>
                <button type="button" class="btn btn-default j-tooltip" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">Tooltip on bottom</button>
                <button type="button" class="btn btn-default j-tooltip" data-toggle="tooltip" data-placement="right" title="Tooltip on right">Tooltip on right</button>
                <button type="button" class="btn btn-default j-tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" data-content='<i class="fa fa-plus"></i>&nbsp;<span class="red">我是一个加号</span>'>显示HTML</button>
                <button type="button" class="btn btn-default j-tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" data-el-content="#tooltip-01">显示指定元素的Html</button>
                <span id="tooltip-01"><i class="fa fa-plane"></i>&nbsp;<span class="orange">送你一架飞机</span></span>
            </div>
            <br>
            <p>元素 添加Class [<span class="red">j-tooltip</span>] 即可激活提示。例子代码如下：</p>
            <pre>&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-tooltip&quot; data-toggle=&quot;tooltip&quot; data-placement=&quot;left&quot; title=&quot;Tooltip on left&quot;&gt;Tooltip on left&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-tooltip&quot; data-toggle=&quot;tooltip&quot; data-placement=&quot;top&quot; title=&quot;Tooltip on top&quot;&gt;Tooltip on top&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-tooltip&quot; data-toggle=&quot;tooltip&quot; data-placement=&quot;bottom&quot; title=&quot;Tooltip on bottom&quot;&gt;Tooltip on bottom&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-tooltip&quot; data-toggle=&quot;tooltip&quot; data-placement=&quot;right&quot; title=&quot;Tooltip on right&quot;&gt;Tooltip on right&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-tooltip&quot; data-toggle=&quot;tooltip&quot; data-placement=&quot;bottom&quot; data-html=&quot;true&quot; data-content=&#39;&lt;i class=&quot;fa fa-plus&quot;&gt;&lt;/i&gt;&amp;nbsp;&lt;span class=&quot;red&quot;&gt;我是一个加号&lt;/span&gt;&#39;&gt;显示HTML&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-tooltip&quot; data-toggle=&quot;tooltip&quot; data-placement=&quot;bottom&quot; data-html=&quot;true&quot; data-el-content=&quot;#tooltip-01&quot;&gt;显示指定元素的Html&lt;/button&gt;
&lt;span id=&quot;tooltip-01&quot;&gt;&lt;i class=&quot;fa fa-plane&quot;&gt;&lt;/i&gt;&amp;nbsp;&lt;span class=&quot;orange&quot;&gt;送你一架飞机&lt;/span&gt;&lt;/span&gt;</pre>
            <br>
            <p>* 更多参数请参见：<a href="http://v3.bootcss.com/javascript/#tooltips" target="_blank">http://v3.bootcss.com/javascript/#tooltips</a></p>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>