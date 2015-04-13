<script type="text/javascript">
function IMG_saveOrder() {
    $('#j_image_box', navTab.getCurrentPanel()).find('.image-seq').each(function(i) {
        var $this = $(this);
        $this.val((i + 1));
    });
}
function IMG_Add() {
    var html = '<div class="image-thumb-box">' +
               '<a href="#" class="thumbnail"><img src="images/002.jpg"></a>' +
               '<div class="input-group">' +
               '<span class="input-group-addon">顺序</span>' +
               '<input type="text" name="seq" class="form-control image-seq" placeholder="顺序" value="2">' +
               '</div>' +
               '<input type="text" name="title" class="form-control" value="" placeholder="绿灯侠">' +
               '<textarea name="note" rows="1" cols="" class="form-control autosize" placeholder="描述"></textarea>' +
               '</div>';
    $(html).appendTo($('#j_image_box', navTab.getCurrentPanel()));
}
var dragsort_destroy = true;
function IMG_Drag_Destroy(obj) {
    var $obj = $(obj);
    if (dragsort_destroy == true) {
        $('#j_image_box', navTab.getCurrentPanel()).dragsort('destroy');
        $obj.text('实例化拖拽');
    } else {
        $obj.closest('.pageFormContent').initUI();
        $obj.text('销毁拖拽实例');
    }
    dragsort_destroy = !dragsort_destroy;
}
</script>
<style type="text/css">
.image-thumb-box {float: left; padding: 5px; margin-right: 5px; width: 150px; border: 1px #EEE solid; border-radius: 4px;}
.image-thumb-box img {width: 140px; height: 79px;}
.image-thumb-box:hover {background: #EEE;}
.image-thumb-box .thumbnail {margin-bottom: 8px;}
.image-thumb-box .form-control {width: 100%;}
.image-thumb-box .form-group,
.image-thumb-box .form-control {margin-bottom: 1px;}
.img-placeHolder {float: left; width: 150px; background-color:white !important; border:dashed 1px gray !important; }
</style>
<div class="pageContent">
    <form action="ajaxDone1.html" id="j_image_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <div style="margin: 20px auto 0;">
                <div id="j_dragsort_placeholder" style="display: none;"><div class="img-placeHolder"></div></div>
                <div class="j-dragsort clearfix" id="j_image_box" data-selector="div.image-thumb-box" data-placeholder="#j_dragsort_placeholder" data-exclude=".input-group, input, textarea" data-dragend="IMG_saveOrder" data-scrollcontainer=".pageFormContent">
                    <div class="image-thumb-box">
                        <a href="#" class="thumbnail"><img src="images/001.jpg"></a>
                        <div class="input-group">
                            <span class="input-group-addon">顺序</span>
                            <input type="text" name="seq" class="form-control image-seq" placeholder="顺序" value="1">
                        </div>
                        <input type="text" name="title" class="form-control" value="" placeholder="葫芦娃">
                        <textarea name="note" rows="1" cols="" class="form-control autosize" placeholder="描述"></textarea>
                    </div>
                    <div class="image-thumb-box">
                        <a href="#" class="thumbnail"><img src="images/002.jpg"></a>
                        <div class="input-group">
                            <span class="input-group-addon">顺序</span>
                            <input type="text" name="seq" class="form-control image-seq" placeholder="顺序" value="2">
                        </div>
                        <input type="text" name="title" class="form-control" value="" placeholder="绿灯侠">
                        <textarea name="note" rows="1" cols="" class="form-control autosize" placeholder="描述"></textarea>
                    </div>
                    <div class="image-thumb-box">
                        <a href="#" class="thumbnail"><img src="images/003.jpg"></a>
                        <div class="input-group">
                            <span class="input-group-addon">顺序</span>
                            <input type="text" name="seq" class="form-control image-seq" placeholder="顺序" value="3">
                        </div>
                        <input type="text" name="title" class="form-control" value="" placeholder="冰雪奇缘">
                        <textarea name="note" rows="1" cols="" class="form-control autosize" placeholder="描述"></textarea>
                    </div>
                    <div class="image-thumb-box">
                        <a href="#" class="thumbnail"><img src="images/004.jpg"></a>
                        <div class="input-group">
                            <span class="input-group-addon">顺序</span>
                            <input type="text" name="seq" class="form-control image-seq" placeholder="顺序" value="4">
                        </div>
                        <input type="text" name="title" class="form-control" value="" placeholder="机器人瓦力">
                        <textarea name="note" rows="1" cols="" class="form-control autosize" placeholder="描述"></textarea>
                    </div>
                    <div class="image-thumb-box">
                        <a href="#" class="thumbnail"><img src="images/005.jpg"></a>
                        <div class="input-group">
                            <span class="input-group-addon">顺序</span>
                            <input type="text" name="seq" class="form-control image-seq" placeholder="顺序" value="5">
                        </div>
                        <input type="text" name="title" class="form-control" value="" placeholder="小黄人">
                        <textarea name="note" rows="1" cols="" class="form-control autosize" placeholder="描述"></textarea>
                    </div>
                </div>
            </div>
            <br>
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm" onclick="IMG_Add();">增加元素</button>
                <button type="button" class="btn btn-default btn-sm" onclick="IMG_Drag_Destroy(this);">销毁拖拽实例</button>
            </div>
            <br><br>
            <p>元素 添加Class [<span class="red">j-dragsort</span>] 即可激活子元素的拖动效果。例子代码如下：</p>
            <pre>&lt;div id=&quot;j_dragsort_placeholder&quot; style=&quot;display: none;&quot;&gt;&lt;div class=&quot;img-placeHolder&quot;&gt;&lt;/div&gt;&lt;/div&gt;
&lt;div class=&quot;j-dragsort clearfix&quot; id=&quot;j_image_box&quot; data-selector=&quot;div.image-thumb-box&quot; data-placeholder=&quot;#j_dragsort_placeholder&quot; data-exclude=&quot;.input-group, input, textarea&quot; data-dragend=&quot;IMG_saveOrder&quot; data-scrollcontainer=&quot;.pageFormContent&quot;&gt;
    &lt;div class=&quot;image-thumb-box&quot;&gt;
        &lt;a href=&quot;#&quot; class=&quot;thumbnail&quot;&gt;&lt;img src=&quot;images/001.jpg&quot;&gt;&lt;/a&gt;
        &lt;div class=&quot;input-group&quot;&gt;
            &lt;span class=&quot;input-group-addon&quot;&gt;顺序&lt;/span&gt;
            &lt;input type=&quot;text&quot; name=&quot;seq&quot; class=&quot;form-control image-seq&quot; placeholder=&quot;顺序&quot; value=&quot;1&quot;&gt;
        &lt;/div&gt;
        &lt;input type=&quot;text&quot; name=&quot;title&quot; class=&quot;form-control&quot; value=&quot;&quot; size=&quot;11&quot; placeholder=&quot;葫芦娃&quot;&gt;
        &lt;textarea name=&quot;note&quot; rows=&quot;1&quot; cols=&quot;&quot; class=&quot;form-control autosize&quot; placeholder=&quot;描述&quot;&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div class=&quot;image-thumb-box&quot;&gt;
        &lt;a href=&quot;#&quot; class=&quot;thumbnail&quot;&gt;&lt;img src=&quot;images/002.jpg&quot;&gt;&lt;/a&gt;
        &lt;div class=&quot;input-group&quot;&gt;
            &lt;span class=&quot;input-group-addon&quot;&gt;顺序&lt;/span&gt;
            &lt;input type=&quot;text&quot; name=&quot;seq&quot; class=&quot;form-control image-seq&quot; placeholder=&quot;顺序&quot; value=&quot;2&quot;&gt;
        &lt;/div&gt;
        &lt;input type=&quot;text&quot; name=&quot;title&quot; class=&quot;form-control&quot; value=&quot;&quot; size=&quot;11&quot; placeholder=&quot;绿灯侠&quot;&gt;
        &lt;textarea name=&quot;note&quot; rows=&quot;1&quot; cols=&quot;&quot; class=&quot;form-control autosize&quot; placeholder=&quot;描述&quot;&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div class=&quot;image-thumb-box&quot;&gt;
        &lt;a href=&quot;#&quot; class=&quot;thumbnail&quot;&gt;&lt;img src=&quot;images/003.jpg&quot;&gt;&lt;/a&gt;
        &lt;div class=&quot;input-group&quot;&gt;
            &lt;span class=&quot;input-group-addon&quot;&gt;顺序&lt;/span&gt;
            &lt;input type=&quot;text&quot; name=&quot;seq&quot; class=&quot;form-control image-seq&quot; placeholder=&quot;顺序&quot; value=&quot;3&quot;&gt;
        &lt;/div&gt;
        &lt;input type=&quot;text&quot; name=&quot;title&quot; class=&quot;form-control&quot; value=&quot;&quot; size=&quot;11&quot; placeholder=&quot;冰雪奇缘&quot;&gt;
        &lt;textarea name=&quot;note&quot; rows=&quot;1&quot; cols=&quot;&quot; class=&quot;form-control autosize&quot; placeholder=&quot;描述&quot;&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div class=&quot;image-thumb-box&quot;&gt;
        &lt;a href=&quot;#&quot; class=&quot;thumbnail&quot;&gt;&lt;img src=&quot;images/004.jpg&quot;&gt;&lt;/a&gt;
        &lt;div class=&quot;input-group&quot;&gt;
            &lt;span class=&quot;input-group-addon&quot;&gt;顺序&lt;/span&gt;
            &lt;input type=&quot;text&quot; name=&quot;seq&quot; class=&quot;form-control image-seq&quot; placeholder=&quot;顺序&quot; value=&quot;4&quot;&gt;
        &lt;/div&gt;
        &lt;input type=&quot;text&quot; name=&quot;title&quot; class=&quot;form-control&quot; value=&quot;&quot; size=&quot;11&quot; placeholder=&quot;机器人瓦力&quot;&gt;
        &lt;textarea name=&quot;note&quot; rows=&quot;1&quot; cols=&quot;&quot; class=&quot;form-control autosize&quot; placeholder=&quot;描述&quot;&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div class=&quot;image-thumb-box&quot;&gt;
        &lt;a href=&quot;#&quot; class=&quot;thumbnail&quot;&gt;&lt;img src=&quot;images/005.jpg&quot;&gt;&lt;/a&gt;
        &lt;div class=&quot;input-group&quot;&gt;
            &lt;span class=&quot;input-group-addon&quot;&gt;顺序&lt;/span&gt;
            &lt;input type=&quot;text&quot; name=&quot;seq&quot; class=&quot;form-control image-seq&quot; placeholder=&quot;顺序&quot; value=&quot;5&quot;&gt;
        &lt;/div&gt;
        &lt;input type=&quot;text&quot; name=&quot;title&quot; class=&quot;form-control&quot; value=&quot;&quot; size=&quot;11&quot; placeholder=&quot;小黄人&quot;&gt;
        &lt;textarea name=&quot;note&quot; rows=&quot;1&quot; cols=&quot;&quot; class=&quot;form-control autosize&quot; placeholder=&quot;描述&quot;&gt;&lt;/textarea&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>
            <br>
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
                        <td>data-selector</td>
                        <td>String</td>
                        <td>第一个子元素标签（如：li）</td>
                        <td>拖动的子元素选择器</td>
                    </tr>
                    <tr>
                        <td>data-exclude</td>
                        <td>String</td>
                        <td>input, textarea</td>
                        <td>不触发拖动效果的子元素选择器。</td>
                    </tr>
                    <tr>
                        <td>data-dragend</td>
                        <td>function() {}</td>
                        <td>null</td>
                        <td>拖动完成后触发此函数。</td>
                    </tr>
                    <tr>
                        <td>data-placeholder</td>
                        <td>String</td>
                        <td>&lt;li class=&quot;placeHolder&quot;&gt;&lt;div&gt;&lt;/div&gt;&lt;/li&gt;</td>
                        <td>拖动时的占位模板</td>
                    </tr>
                    <tr>
                        <td>data-between</td>
                        <td>Boolean</td>
                        <td>false</td>
                        <td>是否允许在多个容器间互相拖拽。</td>
                    </tr>
                    <tr>
                        <td>data-otherbox</td>
                        <td>String</td>
                        <td>null</td>
                        <td>允许互相拖动的其他容器选择器（写法：data-otherbox="#box1, #box2"）</td>
                    </tr>
                    <tr>
                        <td>data-scrollcontainer</td>
                        <td>String</td>
                        <td>window</td>
                        <td>出现滚动条的容器选择器，默认是window，一般在navTab中出现滚动条的容器是".pageFormContent"(如本例)或".pageContent"，该属性只有在需要拖动的子元素过多时有用</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <p>* 更多参数请参见：<a href="http://dragsort.codeplex.com/" target="_blank">http://dragsort.codeplex.com/</a></p>
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>