<script type="text/javascript">
function IMG_saveOrder_() {
    $('#j_image_box', navTab.getCurrentPanel()).find('.image-seq').each(function(i) {
        var $this = $(this);
        $this.val((i + 1));
    });
    $('#j_image_select1').find('.image-seq').each(function(i) {
        var $this = $(this);
        $this.val((i + 1));
    });
    $('#j_image_select2').find('.image-seq').each(function(i) {
        var $this = $(this);
        $this.val((i + 1));
    });
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
            <div class="clearfix" style="margin: 20px auto 0;">
                <div id="j_dragsort_placeholder" style="display: none;"><div class="img-placeHolder"></div></div>
                <div class="j-dragsort clearfix" id="j_image_box" data-selector="div.image-thumb-box" data-placeholder="#j_dragsort_placeholder" data-exclude=".input-group, input, textarea" data-dragend="IMG_saveOrder_" data-scrollcontainer=".pageFormContent" data-between="true" data-otherbox="#j_image_select1, #j_image_select2">
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
                <div style="float: left; width: 49%;">
                    <fieldset>
                        <legend>我准备选择的图片1 [尝试将上面的图片拖下来]</legend>
                        <div id="j_image_select1" style="height: 150px;">
                            
                        </div>
                    </fieldset>
                </div>
                <div style="float: right; width: 49%;">
                    <fieldset>
                        <legend>我准备选择的图片2 [尝试将上面的图片拖下来]</legend>
                        <div id="j_image_select2" style="height: 150px;">
                            
                        </div>
                    </fieldset>
                </div>
            </div>
            <br>
            <p>只需要将<strong class="red">第一个</strong>要拖动的容器 添加Class [<span class="red">j-dragsort</span>] ，添加属性 [<span class="red">data-between="true"</span>]， 再将需要互相拖动的其他容器[选择器]添加到属性" [<span class="red">data-otherbox</span>] "中  即可激活多个容器间的拖动效果。例子代码如下：</p>
            <pre>&lt;div id=&quot;j_dragsort_placeholder&quot; style=&quot;display: none;&quot;&gt;&lt;div class=&quot;img-placeHolder&quot;&gt;&lt;/div&gt;&lt;/div&gt;
&lt;div class=&quot;j-dragsort clearfix&quot; id=&quot;j_image_box&quot; data-selector=&quot;div.image-thumb-box&quot; data-placeholder=&quot;#j_dragsort_placeholder&quot; data-exclude=&quot;.input-group, input, textarea&quot; data-dragend=&quot;IMG_saveOrder&quot; data-scrollcontainer=&quot;.pageFormContent&quot; data-between=&quot;true&quot; data-otherbox=&quot;#j_image_select1, #j_image_select2&quot;&gt;
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
&lt;/div&gt;
&lt;div style=&quot;float: left; width: 49%;&quot;&gt;
    &lt;fieldset&gt;
        &lt;legend&gt;我准备选择的图片1 [尝试将上面的图片拖下来]&lt;/legend&gt;
        &lt;div id=&quot;j_image_select1&quot; style=&quot;height: 150px;&quot;&gt;
            
        &lt;/div&gt;
    &lt;/fieldset&gt;
&lt;/div&gt;
&lt;div style=&quot;float: right; width: 49%;&quot;&gt;
    &lt;fieldset&gt;
        &lt;legend&gt;我准备选择的图片2 [尝试将上面的图片拖下来]&lt;/legend&gt;
        &lt;div id=&quot;j_image_select2&quot; style=&quot;height: 150px;&quot;&gt;
            
        &lt;/div&gt;
    &lt;/fieldset&gt;
&lt;/div&gt;</pre>
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