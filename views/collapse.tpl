<script type="text/javascript">
function toCollapse(t) {
    var $panel = $('#accordion', navTab.getCurrentPanel());
    var initAccordion = function() {
        var hBox = $panel.data('heightbox'), height = $panel.data('height');
        var offsety   = $panel.data('offsety') || 0;
        var height    = height || ($(hBox).height() - (offsety * 1));
        var $pheader  = $panel.find('.panel-heading');
        var h1        = $pheader.outerHeight();
        $panel.css('height', height);
        height = height - (h1 * $pheader.length) - (5 * ($pheader.length));
        $panel.find('.panel-collapse').find('.panel-body').css('height', height);
    }
    switch (t) {
        case 1:
            $panel.addClass('panel-condensed');
            break;
        case 2:
            $panel.removeClass('panel-condensed');
            break;
        case 3:
            $panel.css('height', 'auto').removeClass('j-accordion').removeAttr('data-heightbox').removeAttr('data-height').find('.panel-body').css('height', 'auto');
            break;
        case 4:
            $panel.css('height', 'auto').addClass('j-accordion').data('height', '200').find('.panel-body').css('height', 'auto');
            initAccordion();
            break;
        case 5:
            $panel.css('height', 'auto').addClass('j-accordion').data('height', '300').find('.panel-body').css('height', 'auto');
            initAccordion();
            break;
    }
}
</script>
<div class="pageContent">
    <div class="pageFormContent" layouth="29">
        <div style="margin: 0 auto; width: 550px;">
            <fieldset>
                <legend>紧凑型滑动面板</legend>
                <div style="margin: 0 auto; width: 500px; height: 350px;" id="accordion-box">
                    <div class="panel-group panel-condensed j-accordion" id="accordion" data-heightbox="#accordion-box" data-height="200" data-offsety="0">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">滑动面板 #1</a></h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <p>我是第一个滑动面板。这里可以放我想放置的内容！</p>
                                    <p>panel-group 面板添加Class [<span class="red">panel-condensed</span>] 即显示为紧凑型，添加Class [<span class="red">j-accordion</span>]，同时也添加属性[<span class="red">data-heightbox="#accordion-box"</span> 或 <span class="red">data-height="150"</span>]可以定义滑动面板的高度，超出显示滚动条</p>
                                    <p>* 说明：data-heightbox表示整个滑动面板的高度等于data-heightbox定义的元素高度。<br>
                                    data-height表示整个滑动面板的高度等于data-height定义的高度，data-height优先于data-heightbox</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">滑动面板 #2</a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p>第二个滑动面板的内容</p>
                                    <p>* 非紧凑型面板则不添加Class [<span class="red">panel-condensed</span>]</p>
                                    <p>* 自动高度的滑动面板不需要添加Class [<span class="red">j-accordion</span>]及属性[<span class="red">data-heightbox="#accordion-box"</span> 或 <span class="red">data-height="150"</span>]</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">滑动面板 #3</a></h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                    这里是第三个滑动面板的内容！！！
                                    <p><span class="red">*</span> 其他参数参见<a href="http://v3.bootcss.com/javascript/#collapse" target="_blank">http://v3.bootcss.com/javascript/#collapse</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <p><span class="red">*</span> 其他参数参见<a href="http://v3.bootcss.com/javascript/#collapse" target="_blank">http://v3.bootcss.com/javascript/#collapse</a></p>
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm" onclick="toCollapse(1);">紧凑型</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="toCollapse(2);">正常型</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="toCollapse(3);">自动高度</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="toCollapse(4);">固定高度：200</button>
                    <button type="button" class="btn btn-default btn-sm" onclick="toCollapse(5);">固定高度：300</button>
                </div>
            </fieldset>
        </div>
        <br>
        <p>实例代码：</p>
        <pre>&lt;div class=&quot;panel-group panel-condensed j-accordion&quot; id=&quot;accordion&quot; data-heightbox=&quot;#accordion-box&quot; data-height=&quot;200&quot; data-offsety=&quot;0&quot;&gt;
    &lt;div class=&quot;panel panel-default&quot;&gt;
        &lt;div class=&quot;panel-heading&quot;&gt;
            &lt;h4 class=&quot;panel-title&quot;&gt;&lt;a data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseOne&quot;&gt;滑动面板 #1&lt;/a&gt;&lt;/h4&gt;
        &lt;/div&gt;
        &lt;div id=&quot;collapseOne&quot; class=&quot;panel-collapse collapse in&quot;&gt;
            &lt;div class=&quot;panel-body&quot;&gt;
                &lt;p&gt;我是第一个滑动面板。这里可以放我想放置的内容！&lt;/p&gt;
                &lt;p&gt;panel-group 面板添加Class [&lt;span class=&quot;red&quot;&gt;panel-condensed&lt;/span&gt;] 即显示为紧凑型，添加Class [&lt;span class=&quot;red&quot;&gt;j-accordion&lt;/span&gt;]，同时也添加属性[&lt;span class=&quot;red&quot;&gt;data-heightbox=&quot;#accordion-box&quot;&lt;/span&gt; 或 &lt;span class=&quot;red&quot;&gt;data-height=&quot;150&quot;&lt;/span&gt;]可以定义滑动面板的高度，超出显示滚动条&lt;/p&gt;
                &lt;p&gt;* 说明：data-heightbox表示整个滑动面板的高度等于data-heightbox定义的元素高度。&lt;br&gt;
                data-height表示整个滑动面板的高度等于data-height定义的高度，data-height优先于data-heightbox&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;panel panel-default&quot;&gt;
        &lt;div class=&quot;panel-heading&quot;&gt;
            &lt;h4 class=&quot;panel-title&quot;&gt;
                &lt;a data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseTwo&quot;&gt;滑动面板 #2&lt;/a&gt;
            &lt;/h4&gt;
        &lt;/div&gt;
        &lt;div id=&quot;collapseTwo&quot; class=&quot;panel-collapse collapse&quot;&gt;
            &lt;div class=&quot;panel-body&quot;&gt;
                &lt;p&gt;第二个滑动面板的内容&lt;/p&gt;
                &lt;p&gt;* 非紧凑型面板则不添加Class [&lt;span class=&quot;red&quot;&gt;panel-condensed&lt;/span&gt;]&lt;/p&gt;
                &lt;p&gt;* 自动高度的滑动面板不需要添加Class [&lt;span class=&quot;red&quot;&gt;j-accordion&lt;/span&gt;]及属性[&lt;span class=&quot;red&quot;&gt;data-heightbox=&quot;#accordion-box&quot;&lt;/span&gt; 或 &lt;span class=&quot;red&quot;&gt;data-height=&quot;150&quot;&lt;/span&gt;]&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;panel panel-default&quot;&gt;
        &lt;div class=&quot;panel-heading&quot;&gt;
            &lt;h4 class=&quot;panel-title&quot;&gt;&lt;a data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseThree&quot;&gt;滑动面板 #3&lt;/a&gt;&lt;/h4&gt;
        &lt;/div&gt;
        &lt;div id=&quot;collapseThree&quot; class=&quot;panel-collapse collapse&quot;&gt;
            &lt;div class=&quot;panel-body&quot;&gt;
                这里是第三个滑动面板的内容！！！
                &lt;p&gt;&lt;span class=&quot;red&quot;&gt;*&lt;/span&gt; 其他参数参见&lt;a href=&quot;http://v3.bootcss.com/javascript/#collapse&quot; target=&quot;_blank&quot;&gt;http://v3.bootcss.com/javascript/#collapse&lt;/a&gt;&lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>
    </div>
    <div class="formBar">
        <ul>
            <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
        </ul>
    </div>
</div>