<style type="text/css">
.about_item li {line-height: 1.7;}
    
</style>
<div class="pageContent">
    <form action="ajaxDone1.html" id="j_form_form" class="pageForm form-validate" method="post" callback="navTabAjaxDone" noEnter>
        <div class="pageFormContent" layouth="29">
            <h4>关于本框架</h4>
            <div class="callout callout-red">
                Bootstrap for DWZ富客户端框架，基于<a href="http://j-ui.com" target="_blank">DWZ富客户端框架</a>修改，主要针对皮肤，编辑器，表单验证等方面进行了修改。
            </div>
            <h5>兼容性：</h5>
            <ul class="about_item">
                <li>　<i class="fa fa-dot-circle-o"></i>　IE8.0+, Chrome[<span class="red">最佳</span>], Firefox, Safari。（IE8 未详细测试，估计问题不大，但一些CSS3的效果就不要想了，如圆角、动画什么的）</li>
                <li>　<i class="fa fa-dot-circle-o"></i>　<span class="red">本框架不适用于需要兼容IE6、7的开发者或使用者。</span></li>
                <li>　<i class="fa fa-dot-circle-o"></i>　PS. 未考虑兼容IE6和IE7，一是因为Bootstrap3.2不支持，二是因为目前主流系统已是WIN7(IE8+)，三是带WebKit内核的浏览器大量出现，如360浏览器、搜狗浏览器、百度浏览器等。</li>
            </ul>
            <h5>修改要点：</h5>
            <ul class="about_item">
                <li>　<i class="fa fa-dot-circle-o"></i>　引入了前端框架 <a href="http://v3.bootcss.com/" target="_blank">Bootstrap 3.2</a>，替换了原有皮肤</li>
                <li>　<i class="fa fa-dot-circle-o"></i>　引入了图标字体 <a href="http://fontawesome.io/" target="_blank">Font Awesome 4.1</a></li>
                <li>　<i class="fa fa-dot-circle-o"></i>　替换了HTML编辑器为 <a href="http://kindeditor.net/" target="_blank">KindEditor 4.1.10</a></li>
                <li>　<i class="fa fa-dot-circle-o"></i>　替换了表单验证插件为 <a href="https://github.com/posabsolute/jQuery-Validation-Engine" target="_blank">jquery.validationEngine 2.6.2</a></li>
                <li>　<i class="fa fa-dot-circle-o"></i>　替换了树形菜单为 <a href="http://www.ztree.me/" target="_blank">zTree 3.5.15</a></li>
                <li>　<i class="fa fa-dot-circle-o"></i>　替换了拖动排序为 <a href="http://dragsort.codeplex.com/" target="_blank">dragsort 0.5.1</a></li>
                <li>　<i class="fa fa-dot-circle-o"></i>　修改了弹出窗口dialog的多层Modal效果</li>
                <li>　<i class="fa fa-dot-circle-o"></i>　其他：美化select(<a href="http://silviomoreto.github.io/bootstrap-select/" target="_blank">Bootstrap-select 1.4.2</a>)、checkbox和radio(<a href="https://github.com/fronteed/iCheck/" target="_blank">iCheck 1.0.1</a>)、新增标签(自动完成)[基于<a href="http://yingzhuo.iteye.com/blog/1739377" target="_blank">BootstrapPlugin - tags</a>修改]</li>
                <li>　<i class="fa fa-dot-circle-o"></i>　上传：不支持HTML5的浏览器默认为(<a href="http://www.uploadify.com/" target="_blank">uploadify 3.2.1</a>)，支持HTML5的浏览器使用(<a href="http://www.cnblogs.com/lvdabao/p/3498370.html" target="_blank">Huploadify 2.0</a>，本人已作修改，[新增上传图片预览功能，拖放上传功能]，完美整合本框架</li>
            </ul>            
        </div>
        <div class="formBar">
            <ul>
                <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
            </ul>
        </div>
    </form>
</div>