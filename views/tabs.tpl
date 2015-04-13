<script type="text/javascript">

</script>
<div class="pageContent">
    <div class="pageFormContent" layouth="29">
        <div style="margin: 0 auto; width: 550px;">
            <fieldset>
                <legend>选项卡</legend>
                <div class="tabs" currentIndex="1" eventType="click">
                    <div class="tabsHeader">
                        <div class="tabsHeaderContent">
                            <ul class="nav nav-tabs">
                                <li><a href="javascript:;"><span>标题1</span></a></li>
                                <li><a href="javascript:;"><span>标题2</span></a></li>
                                <li><a href="php/get-project-list.php" class="j-ajax"><span>标题3</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tabsContent">
                        <div>
                            <pre>
                            currentIndex: 0-n	default:0
                            eventType: click|hover	default:click
                            </pre>
                        </div>
                        <div>内容2</div>
                        <div></div>
                    </div>
                </div>
                <p>&nbsp;</p>
                <div class="tabs" currentIndex="0" eventType="click">
                    <div class="tabsHeader">
                        <div class="tabsHeaderContent">
                            <ul class="nav nav-tabs">
                                <li><a href="javascript:;"><span>标题1</span></a></li>
                                <li><a href="javascript:;"><span>标题2</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tabsContent" style="height:250px;">
                        <div>内容1
                            <p>
                                <label>客户名称：</label>
                                <input type="text" name="name" class="form-control" size="30" value="" >
                            </p>
                        </div>
                        <div>
                            
                            <div class="tabs" currentIndex="0" eventType="click" style="width:300px">
                                <div class="tabsHeader">
                                    <div class="tabsHeaderContent">
                                        <ul class="nav nav-tabs">
                                            <li><a href="javascript:;"><span>标题1</span></a></li>
                                            <li><a href="javascript:;"><span>标题2</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tabsContent" style="height:150px;">
                                    <div>内容1</div>
                                    <div>内容2</div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <br>
                <p>实例代码：</p>
                <pre>&lt;div class=&quot;tabs&quot; currentIndex=&quot;0&quot; eventType=&quot;click&quot; style=&quot;width:300px&quot;&gt;
    &lt;div class=&quot;tabsHeader&quot;&gt;
        &lt;div class=&quot;tabsHeaderContent&quot;&gt;
            &lt;ul class=&quot;nav nav-tabs&quot;&gt;
                &lt;li&gt;&lt;a href=&quot;javascript:;&quot;&gt;&lt;span&gt;标题1&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
                &lt;li&gt;&lt;a href=&quot;javascript:;&quot;&gt;&lt;span&gt;标题2&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
            &lt;/ul&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;tabsContent&quot; style=&quot;height:150px;&quot;&gt;
        &lt;div&gt;内容1&lt;/div&gt;
        &lt;div&gt;内容2&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>
                <p><span class="red">*</span> 参数配置同DWZ</p>
            </fieldset>
        </div>
    </div>
    <div class="formBar">
        <ul>
            <li><button type="button" class="btn btn-close btn-sm">关闭</button></li>
        </ul>
    </div>
</div>