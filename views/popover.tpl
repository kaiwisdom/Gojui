<div class="pageContent">
    <form action="ajaxDone1.html" id="j_form_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <div style="margin: 20px auto 0;">
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="top" title="上方弹出" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on top
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="bottom" title="下方弹出" data-content="Vivamus
                sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on bottom
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="left" title="左侧弹出" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on left
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="right" title="右侧弹出" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                  Popover on right
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                  无标题
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="bottom" data-content='<i class="fa fa-plus"></i>&nbsp;<span class="red">我是一个加号</span>' data-html="true">
                  弹出HTML
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="bottom" title="hover弹出" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." data-trigger="hover">
                  鼠标hover时弹出或隐藏HTML
                </button>
                <button type="button" class="btn btn-default j-popover" data-container="body" data-toggle="popover" data-placement="bottom" title="弹出指定元素的Html" data-el-content="#popover-01" data-html="true">
                  弹出指定元素的Html
                </button>
                <span id="popover-01"><i class="fa fa-plane"></i>&nbsp;<span class="blue">送你一架飞机</span></span>
            </div>
            <br>
            <p>元素 添加Class [<span class="red">j-popover</span>] 即可激活提示。例子代码如下：</p>
            <pre>&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;top&quot; title=&quot;上方弹出&quot; data-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot;&gt;Popover on top&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; title=&quot;下方弹出&quot; data-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot;&gt;Popover on bottom&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;left&quot; title=&quot;左侧弹出&quot; data-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot;&gt;Popover on left&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;right&quot; title=&quot;右侧弹出&quot; data-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot;&gt;Popover on right&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; data-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot;&gt;无标题&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; data-content=&#39;&lt;i class=&quot;fa fa-plus&quot;&gt;&lt;/i&gt;&amp;nbsp;&lt;span class=&quot;red&quot;&gt;我是一个加号&lt;/span&gt;&#39; data-html=&quot;true&quot;&gt;弹出HTML&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; title=&quot;hover弹出&quot; data-content=&quot;Vivamus sagittis lacus vel augue laoreet rutrum faucibus.&quot; data-trigger=&quot;hover&quot;&gt;鼠标hover时弹出或隐藏HTML&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;btn btn-default j-popover&quot; data-container=&quot;body&quot; data-toggle=&quot;popover&quot; data-placement=&quot;bottom&quot; title=&quot;弹出指定元素的Html&quot; data-el-content=&quot;#popover-01&quot; data-html=&quot;true&quot;&gt;弹出指定元素的Html&lt;/button&gt;
&lt;span id=&quot;popover-01&quot;&gt;&lt;i class=&quot;fa fa-plane&quot;&gt;&lt;/i&gt;&amp;nbsp;&lt;span class=&quot;blue&quot;&gt;送你一架飞机&lt;/span&gt;&lt;/span&gt;</pre>
            <br>
            <p>* 更多参数请参见：<a href="http://v3.bootcss.com/javascript/#popovers" target="_blank">http://v3.bootcss.com/javascript/#popovers</a></p>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>