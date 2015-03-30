function initEnv() {
    $("body").append(DWZ.frag["dwzFrag"]);

    if ( $.browser.msie && /6.0/.test(navigator.userAgent) ) {
        try {
            document.execCommand("BackgroundImageCache", false, true);
        }catch(e){}
    }
    //清理浏览器内存,只对IE起效
    if ($.browser.msie) {
        window.setInterval("CollectGarbage();", 10000);
    }

    $(window).resize(function(){
        initLayout();
        $(this).trigger(DWZ.eventType.resizeGrid);
    });

    var ajaxbg = $("#background, #progressBar");
    var waitbg = $("#background, #progressBar_custom");
    ajaxbg.hide();
    waitbg.hide();
    $(document).ajaxStart(function(){
        ajaxbg.show();
    }).ajaxStop(function(){
        ajaxbg.hide();
    });
    
    $("#leftside").jBar({minW:150, maxW:700});
    
    if ($.taskBar) $.taskBar.init();
    navTab.init();
    if ($.fn.switchEnv) $("#switchEnvBox").switchEnv();
    if ($.fn.navMenu) $("#navMenu").navMenu();
        
    setTimeout(function(){
        initLayout();
        initUI();    
    }, 10);
    
    /*Regional*/
    $.setRegional("datepicker", {
        dayNames: ['日', '一', '二', '三', '四', '五', '六'],
        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
    });
}
function initLayout(){
    var iContentW = $(window).width() - (DWZ.ui.sbar ? $("#sidebar").width() + 10 : 31) - 5;
    var iContentH = $(window).height() - $("#header").height() - 31;

    $("#container").width(iContentW);
    $("#container .tabsPageContent").height(iContentH - 31).find("[layoutH]").layoutH();
    $("#sidebar, #sidebar_s .collapse, #splitBar, #splitBarProxy").height(iContentH - 5);
    $("#taskbar").css({top: iContentH + $("#header").height() + 5, width:$(window).width()});
}

function initUI(_box){
    var $p = $(_box || document);
    
    //tables
    $("table.j-table", $p).jTable();

    //auto bind tabs
    $("div.tabs", $p).each(function(){
        var $this = $(this);
        var options = {};
        options.currentIndex = $this.attr("currentIndex") || 0;
        options.eventType = $this.attr("eventType") || "click";
        $this.tabs(options);
    });
        
/*    if ($.fn.xheditor) {
        $("textarea.editor", $p).each(function(){
            var $this = $(this);
            var op = {html5Upload:false, skin: 'vista',tools: $this.attr("tools") || 'full'};
            var upAttrs = [
                ["upLinkUrl","upLinkExt","zip,rar,txt"],
                ["upImgUrl","upImgExt","jpg,jpeg,gif,png"],
                ["upFlashUrl","upFlashExt","swf"],
                ["upMediaUrl","upMediaExt","avi"]
            ];
            
            $(upAttrs).each(function(i){
                var urlAttr = upAttrs[i][0];
                var extAttr = upAttrs[i][1];
                
                if ($this.attr(urlAttr)) {
                    op[urlAttr] = $this.attr(urlAttr);
                    op[extAttr] = $this.attr(extAttr) || upAttrs[i][2];
                }
            });
            
            $this.xheditor(op);
        });
    }*/
    
    if ($.fn.uploadify && $.fn.Huploadify) {
        $(":file[uploaderOption]", $p).each(function(){
            var $this = $(this);
            var options = {
                swf:'DWZ/plugins/uploadify/scripts/uploadify.swf',
                fileObjName: $this.attr('name') || 'file',
                auto: true,
                multi: false,
                height: 26,
                onUploadError: uploadifyError,
                /*以下仅Huploadify适用*/
                breakPoints:false, //断点续传
                saveInfoLocal:true,
                previewImg:true,//预览上传图片
                previewLoadimg:'DWZ/plugins/Huploadify/images/loading.gif', //预览前的载入图标
                dragDrop:true,
                showUploadedSize:true,
                removeTimeout:1000
            };
            
            var uploaderOption = DWZ.jsonEval($this.attr("uploaderOption"));
            $.extend(options, uploaderOption);
            
            //DWZ.debug("uploaderOption: "+DWZ.obj2str(uploaderOption));
            if (window.FileReader) {
                var $up = $('<div id="'+ $this.attr('id') +'"></div>');
                $up.insertBefore($this).Huploadify(options);
                $this.remove();
            } else {
                $this.uploadify(options);
            }
        });
    }
    
    //datepicker
    if ($.fn.datepicker){
        function _datePicker($obj) {
            var $this = $obj;
            var opts = {};
            if ($this.attr("dateFmt")) opts.pattern = $this.attr("dateFmt");
            if ($this.attr("minDate")) opts.minDate = $this.attr("minDate");
            if ($this.attr("maxDate")) opts.maxDate = $this.attr("maxDate");
            if ($this.attr("mmStep")) opts.mmStep = $this.attr("mmStep");
            if ($this.attr("ssStep")) opts.ssStep = $this.attr("ssStep");
            $this.datepicker(opts);
        }
        $('input.date', $p).each(function(){
            _datePicker($(this));
        });
    }

    // navTab
    $("a[target=navTab]", $p).each(function(){
        $(this).click(function(event){
            var $this = $(this);
            $this.parent().addClass('active').siblings().removeClass('active');
            var title = $this.attr("title") || $this.text();
            var tabid = $this.attr("rel") || "_blank";
            var fresh = eval($this.attr("fresh") || "true");
            var external = eval($this.attr("external") || "false");
            var url = unescape($this.attr("href")).replaceTmById($(event.target).parents(".unitBox:first"));
            var reloadtips = $this.attr('reloadtips'); //K'naan@2014-08-11
            DWZ.debug(url);
            if (!url.isFinishedTm()) {
                alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
                return false;
            }
            navTab.openTab(tabid, url,{title:title, fresh:fresh, external:external, reloadtips:reloadtips});
            event.preventDefault();
        });
    });

    //dialogs
    $("a[target=dialog]", $p).each(function(){
        $(this).click(function(event){
            var $this = $(this);
            var title = $this.attr("title") || $this.text();
            var rel = $this.attr("rel") || "_blank";
            var options = {};
            var w = $this.attr("width");
            var h = $this.attr("height");
            if (w) options.width = w;
            if (h) options.height = h;
            options.max = eval($this.attr("max") || "false");
            options.mask = eval($this.attr("mask") || "false");
            options.maxable = eval($this.attr("maxable") || "true");
            options.minable = eval($this.attr("minable") || "true");
            options.fresh = eval($this.attr("fresh") || "true");
            options.resizable = eval($this.attr("resizable") || "true");
            options.drawable = eval($this.attr("drawable") || "true");
            options.close = eval($this.attr("close") || "");
            options.param = $this.attr("param") || "";

            var url = unescape($this.attr("href")).replaceTmById($(event.target).parents(".unitBox:first"));
            DWZ.debug(url);
            if (!url.isFinishedTm()) {
                alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
                return false;
            }
            $.pdialog.open(url, rel, title, options);
            
            return false;
        });
    });
    $("a[target=ajax]", $p).each(function(){
        $(this).click(function(event){
            var $this = $(this);
            var rel = $this.attr("rel");
            if (rel) {
                var $rel = $("#"+rel);
                $rel.loadUrl($this.attr("href"), {}, function(){
                    $rel.find("[layoutH]").layoutH();
                });
            }

            event.preventDefault();
        });
    });
    
    $("div.pagination-box", $p).each(function(){
        var $this = $(this);
        $this.pagination({
            targetType:$this.attr("targetType"),
            rel:$this.attr("rel"),
            totalCount:$this.attr("totalCount"),
            numPerPage:$this.attr("numPerPage"),
            pageNumShown:$this.attr("pageNumShown"),
            currentPage:$this.attr("currentPage")
        });
    });

    // dwz.ajax.js
    if ($.fn.ajaxTodo) $("a[target=ajaxTodo]", $p).ajaxTodo();
    if ($.fn.dwzExport) $("a[target=dwzExport]", $p).dwzExport();
    if ($.fn.checkedExport) $("a[target=checkedExport]", $p).checkedExport(); //选中导出
    if ($.fn.checkedAjaxTodo) $("a[target=checkedAjaxTodo]", $p).checkedAjaxTodo(); //选中项ajaxPost

    if ($.fn.lookup) $("a[lookupGroup]", $p).lookup();
    if ($.fn.multLookup) $("[multLookup]:button", $p).multLookup();
    if ($.fn.suggest) $("input[suggestFields]", $p).suggest();
    if ($.fn.itemDetail) $("table.itemDetail", $p).itemDetail();
    if ($.fn.selectedTodo) $("a[target=selectedTodo]", $p).selectedTodo();
    if ($.fn.pagerForm) $("form[rel=pagerForm]", $p).pagerForm({parentBox:$p});
    
    // 执行第三方jQuery插件【 第三方jQuery插件注册：DWZ.regPlugins.push(function($p){}); 】
    $.each(DWZ.regPlugins, function(index, fn){
        fn($p);
    });
    
    //--------------------------------以下为未注册的插件---------------------------------
    //accordion
    $('.j-accordion', $p).each(function() {
        var $this = $(this);
        var initAccordion = function(hBox, height) {
            var offsety   = $this.data('offsety') || 0;
            var height    = height || ($(hBox).height() - (offsety * 1));
            var $pheader  = $this.find('.panel-heading');
            var h1        = $pheader.outerHeight();
            $this.css('height', height);
            height = height - (h1 * $pheader.length) - (5 * ($pheader.length));
            $this.find('.panel-collapse').find('.panel-body').css('height', height);
        }
        var hBox   = $this.data('heightbox');
        var height = $this.data('height');
        if (hBox || height) {
            initAccordion(hBox, height);
            $(window).resize(function() {
                initAccordion(hBox, height);
            });
        }
        $this.on('shown.bs.collapse', function() {
            var $collapse = $this.find('[data-toggle=collapse]');
            $collapse.find('i').removeClass('fa-caret-square-o-down').addClass('fa-caret-square-o-right');
            $collapse.removeClass('active').not('.collapsed').addClass('active').find('i').removeClass('fa-caret-square-o-right').addClass('fa-caret-square-o-down');
        });
    });
    
    //show more Search
    $('.j-showMoreSearch', $p).each(function() {
        var $this = $(this);
        var rel   = $this.attr('rel');
        if (!rel) rel = new Date().getTime();
        rel = 'moreSearch_'+ rel;
        var $more = $p.find('.moreSearch');
        $this.click(function() {
            if ($more.length == 0) return;
            if ($more.is(':visible')) {
                $this.html('<i class="fa fa-angle-double-down"></i>');
                $('body').data(rel, false);
            } else {
                $this.html('<i class="fa fa-angle-double-up"></i>');
                $('body').data(rel, true);
            }
            $more.fadeToggle('slow', 'linear');
        });
        if ($('body').data(rel)) {
            $more.fadeIn();
            $this.html('<i class="fa fa-angle-double-up"></i>');
        }
    });
    
    //i-check
    $('.j-icheck').iCheck({
        checkboxClass: 'icheckbox_minimal-purple',
        radioClass: 'iradio_minimal-purple',
        increaseArea: '20%' // optional
    });
    $(':checkbox.checkboxCtrl', $p).on('ifChanged', function(event) {
        var checked = event.target.checked == true ? 'check' : 'uncheck';
        var group = $(this).attr('group');
        $(":checkbox[name='"+ group +"']", $p).iCheck(checked);
    });
    
    //textarea autoheight
    $('textarea.autosize', $p).autosize();
    
    //根据input[text|password]、textarea的size或cols属性固定宽度(以适应不同浏览器)
    $(':text, :password, textarea', $p).each(function() {
        var $this = $(this);
        var $itemDetail = $this.closest('table.itemDetail');
        if (!$itemDetail.length) {
            var size = $this.attr('size') || $this.attr('cols');
            if (!size) return;
            var width = size * 10;
            if (width) $this.css('width', width);
        }
    });
    
    //validate form
    $("form.form-validate", $p).each(function() {
        var $this       = $(this);
        var overflowDIV = $this.attr('overflowDIV') || '.pageFormContent';
        var callback    = $this.attr('callback') || DWZ.ajaxDone;
        if (callback) 
            callback = str2Func(callback);
        $this.validationEngine({
            isOverflown: true,
            overflowDIV: overflowDIV,
            promptPosition: 'bottomRight',
            onValidationComplete: function(form, valid) {
                if (valid) {
                    return validateCallback(form, callback);
                } else {
                    return false;
                };
            }
        });
    });
    
    //form添加noEnter属性，禁止文本框回车提交
    $('form[noEnter]', $p).each(function() {
        $(':text', $(this)).keypress(function(e) {
            var key = e.which;
             if(key == 13)
                return false;
        });
    });

    //编辑/只读表格
    $('table.itemDetail tbody', $p).each(function() {
        var $tbody = $(this);
        function _doEdit($tr, $edit) {
            $tr.attr('isreadonly', '').find('.form-control').each(function() {
                var $this = $(this);
                $this.removeClass('readonly').prop('readonly', false);
                if ($this.hasClass('date') && _datePicker) _datePicker($this);
            });
            $tr.find('.j-lookup, .uploadify', $tr).show();
            $tr.find('button.selectpicker').prop('disabled', false);//.selectpicker('refresh');
            $edit && $edit.text('完成');
        }
        function _doRead($tr, $edit) {
            $tr.attr('isreadonly', true).find('.form-control').addClass('readonly').prop('readonly', true).css('cursor', 'text');
            $tr.find('.j-lookup, .uploadify').hide();
            $tr.find('button.selectpicker').prop('disabled', true);//.selectpicker('refresh');
            $tr.find('input.date').off('click');
            $edit && $edit.text('编辑');
        }
        $tbody.find('tr.readonly').each(function() {
            _doRead($(this));
        });
        $tbody.find('.j-edit').click(function() {
            var $this = $(this);
            var $tr   = $this.closest('tr');
            $tr.attr('isreadonly') ? _doEdit($tr, $this) : _doRead($tr, $this);
        });
        $tbody.on('dblclick', 'tr.readonly', function() {
            var $this = $(this);
            var $edit = $this.find('.j-edit');
            $this.attr('isreadonly') ? _doEdit($this, $edit) : _doRead($this, $edit);
        });
    });
    
    //颜色选择器
    if ($.fn.colorpicker) {
        $('.j-colorpicker', $p).each(function() {
            var $this     = $(this);
            var isbgcolor = $this.attr('isbgcolor');
            $this.colorpicker();
            if (isbgcolor) {
                $this.on('changeColor', function(ev) {
                    $this.css('background', ev.color.toHex());
                });
            }
        });
        $('.j-clearcolor', $p).each(function() {
            var $this = $(this);
            var element = $this.attr('element');
            if (element) {
                $this.click(function() {
                    $(element).val('').css('background', '');
                });
            }
        });
    }
    
    //编辑器
    $('textarea.j-content', $p).each(function() {
        var editor = $(this);
            pasteType       = editor.attr('pasteType'),
            uploadJson      = editor.attr('uploadJson'),
            fileManagerJson = editor.attr('fileManagerJson'),
            items           = editor.attr('items'),
            minHeight       = editor.attr('minHeight') || 260,
            autoHeight      = editor.attr('autoHeight'),
            afterUpload     = editor.attr('afterUpload') || null,
            afterSelectFile = editor.attr('afterSelectFile') || null,
            X_afterSelect   = editor.attr('X_afterSelect') || null; //自定义函数--用于上传或选择图片并插入成功后--取得该图片的url
        if (items) {
            items = items.split(',');
        } else {
            items = KindEditor.options.items;
        }
        if (afterUpload) {
            afterUpload = str2Func(afterUpload);
        }
        if (afterSelectFile) {
            afterSelectFile = str2Func(afterSelectFile);
        }
        if (X_afterSelect) {
            X_afterSelect = str2Func(X_afterSelect);
        }
        if (autoHeight && autoHeight != 'true') autoHeight = false;
        var htmlTags = {
            font : [/*'color', 'size', 'face', '.background-color'*/],
            span : ['.color', '.background-color', '.font-size', '.font-family'
                    /*'.color', '.background-color', '.font-size', '.font-family', '.background',
                    '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.line-height'*/
            ],
            div : ['.margin', '.padding', '.text-align'
                    /*'align', '.border', '.margin', '.padding', '.text-align', '.color',
                    '.background-color', '.font-size', '.font-family', '.font-weight', '.background',
                    '.font-style', '.text-decoration', '.vertical-align', '.margin-left'*/
            ],
            table: ['align', 'width'
                    /*'border', 'cellspacing', 'cellpadding', 'width', 'height', 'align', 'bordercolor',
                    '.padding', '.margin', '.border', 'bgcolor', '.text-align', '.color', '.background-color',
                    '.font-size', '.font-family', '.font-weight', '.font-style', '.text-decoration', '.background',
                    '.width', '.height', '.border-collapse'*/
            ],
            'td,th': ['align', 'valign', 'width', 'height', 'colspan', 'rowspan'
                    /*'align', 'valign', 'width', 'height', 'colspan', 'rowspan', 'bgcolor',
                    '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.font-weight',
                    '.font-style', '.text-decoration', '.vertical-align', '.background', '.border'*/
            ],
            a : ['href', 'target', 'name'],
            embed : ['src', 'width', 'height', 'type', 'loop', 'autostart', 'quality', '.width', '.height', 'align', 'allowscriptaccess'],
            img : ['src', 'width', 'height', 'border', 'alt', 'title', 'align', '.width', '.height', '.border'],
            'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6' : [
                'class', 'align', '.text-align', '.color', /*'.background-color', '.font-size', '.font-family', '.background',*/
                '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.text-indent', '.margin-left'
            ],
            pre : ['class'],
            hr : ['class', '.page-break-after'],
            'br,tbody,tr,strong,b,sub,sup,em,i,u,strike,s,del' : []
        }
        KindEditor.create(editor, {
            pasteType                : pasteType,
            minHeight                : minHeight,
            autoHeightMode           : autoHeight,
            items                    : items,
            uploadJson               : uploadJson,
            fileManagerJson          : fileManagerJson,
            allowFileManager         : true,
            fillDescAfterUploadImage : true, //上传图片成功后转到属性页，为false则直接插入图片[设为true方便自定义函数(X_afterSelect)]
            afterUpload              : afterUpload,
            afterSelectFile          : afterSelectFile,
            X_afterSelect            : X_afterSelect,
            htmlTags                 : htmlTags,
            cssPath                  : 'DWZ/editor-content.css',
            afterBlur                : function() {this.sync();}
        });
    });
    //Ztree
    if ($.fn.zTree) {
        $('.ztree', $p).each(function() {
            var $ztree = $(this);
            var attrs  = jQuery.parseJSON($ztree.attr('attrs'));
            if (!attrs) return;
            var expandAll      = attrs.expandAll || false;
            var simpleData     = attrs.simpleData || true;
            var addHoverDom    = attrs.addHoverDom || null;
            var removeHoverDom = attrs.removeHoverDom || null;
            var maxAddLevel    = attrs.maxAddLevel || 2;
            var addDiyDom      = attrs.addDiyDom || null;
            var editEnable     = attrs.editEnable || false;
            var showRemoveBtn  = attrs.showRemoveBtn || false;
            var showRenameBtn  = attrs.showRenameBtn || false;
            var checkEnable    = attrs.checkEnable || false;
            var chkStyle       = attrs.chkStyle || 'checkbox';
            var radioType      = attrs.radioType || null;
            var onClick        = attrs.onClick || null;
            var beforeDrag     = attrs.beforeDrag || null;
            var beforeDrop     = attrs.beforeDrop || null;
            var beforeRemove   = attrs.beforeRemove || null;
            var onDrop         = attrs.onDrop || null;
            var onRemove       = attrs.onRemove || null;
            var onCheck        = attrs.onCheck || null;
            var nodes          = $ztree.attr('nodes');
            if (!nodes) return;
            nodes              = nodes.replace(/&apos;/g, "'"); 
            var zNodes         = jQuery.parseJSON(nodes);
            if (addHoverDom) {
                addHoverDom = (addHoverDom == 'edit') ? _addHoverDom : str2Func(addHoverDom);
            }
            if (removeHoverDom) {
                removeHoverDom = (removeHoverDom == 'edit') ? _removeHoverDom : str2Func(removeHoverDom);
            }
            var setting = {
                view: {
                    addHoverDom: addHoverDom || null,
                    removeHoverDom: removeHoverDom || null,
                    addDiyDom: (addDiyDom != null) ? str2Func(addDiyDom) : null
                },
                edit: {
                    enable: editEnable,
                    showRemoveBtn: showRemoveBtn,
                    showRenameBtn: showRenameBtn
                },
                check: {
                    enable: checkEnable,
                    chkStyle: chkStyle,
                    radioType: radioType
                },
                callback: {
                    onClick: onClick != null ? str2Func(onClick) : null,
                    beforeDrag: beforeDrag != null ? str2Func(beforeDrag) : _beforeDrag,
                    beforeDrop: beforeDrop != null ? str2Func(beforeDrop) : _beforeDrop,
                    onDrop: onDrop != null ? str2Func(onDrop) : null,
                    onCheck: onCheck != null ? str2Func(onCheck) : null,
                    beforeRemove: beforeRemove != null ? str2Func(beforeRemove) : null,
                    onRemove: onRemove != null ? str2Func(onRemove) : null
                },
                data: {
                    simpleData: {
                        enable: simpleData
                    }
                }
            };
            
            $.fn.zTree.init($ztree, setting, zNodes);
            var IDMark_A = "_a";
            var zTree = $.fn.zTree.getZTreeObj($ztree.attr('id'));
            if (expandAll) zTree.expandAll(true);
            //添加、删除按钮
            function _addHoverDom(treeId, treeNode) {
                var level = treeNode.level;
                var $obj = $("#"+ treeNode.tId + IDMark_A);
                var $add = $("#diyBtn_add_"+ treeNode.id);
                var $del = $("#diyBtn_del_"+ treeNode.id);
                if (!$add.length) {
                    if (level < maxAddLevel) {
                        $edit = $('<a href="javascript:;" class="tree_add" id="diyBtn_add_'+ treeNode.id +'" title="添加"></a>');
                        $edit.appendTo($obj);
                        $edit.on("click", function(){
                            zTree.addNodes(treeNode, {name:"新增Item"});
                        });
                    }
                }
                if (!$del.length) {
                    var $del = $('<a href="javascript:;" class="tree_del" id="diyBtn_del_'+ treeNode.id +'" title="删除"></a>');
                    $del.appendTo($obj);
                    $del.on("click", function(event) {
                        var delFn = function() {
                            alertMsg.confirm('确认要删除 '+ treeNode.name +' 吗？', {
                                okCall: function() {
                                    zTree.removeNode(treeNode);
                                    if (onRemove) {
                                        var fn = str2Func(onRemove);
                                        if (fn)
                                            fn.call(fn, event, treeId, treeNode);
                                    }
                                },
                                cancelCall: function () {
                                    return;
                                }
                            });
                        };
                        if (beforeRemove) {
                            var fn = str2Func(beforeRemove);
                            if (fn) {
                                var isdel = fn.call(fn, treeId, treeNode);
                                if (isdel && isdel == true) delFn();
                            }
                        } else {
                            delFn();
                        }
                    });
                }
            }
            //移除添加删除按钮
            function _removeHoverDom(treeId, treeNode) {
                var $add = $("#diyBtn_add_"+ treeNode.id);
                var $del = $("#diyBtn_del_"+ treeNode.id);
                if ($add && $add.length) {
                    $add.off('click').remove();
                }
                if ($del && $del.length) {
                    $del.off('click').remove();
                }
            }
            //拖拽
            function _beforeDrag(treeId, treeNodes) {
                for (var i=0, l=treeNodes.length; i<l; i++) {
                    if (treeNodes[i].drag === false) {
                        return false;
                    }
                }
                return true;
            }
            function _beforeDrop(treeId, treeNodes, targetNode, moveType) {
                return targetNode ? targetNode.drop !== false : true;
            }
        });
    }
    //zTree弹出下拉选择器
    $('.j-selectzTree', $p).each(function() {
        var $this     = $(this);
        var $tree     = $($this.data('tree')),
            width     = $this.data('width') || $this.outerWidth(),
            height    = $this.data('height') || 'auto',
            w         = parseFloat($this.css('width')),
            h         = $this.outerHeight();
        if (!$tree || !$tree.length) return;
        var treeid = $tree.attr('id');
        var $box   = $('#'+ treeid +'_select_box');
        var setPosition = function($box) {
            var top  = $this.offset().top,
                left = $this.offset().left;
            var $clone     = $tree.clone().appendTo($('body'));
            var treeHeight = $clone.outerHeight();
            $clone.remove();
            var offsetBot  = $(window).height() - treeHeight - top - h;
            var maxHeight  = $(window).height() - top - h;
            if (height == 'auto' && offsetBot < 0) maxHeight = maxHeight + offsetBot;
            $box.css({top:(top + h), left:left, 'max-height':maxHeight});
        };
        $this.click(function() {
            if ($box && $box.length) {
                setPosition($box);
                $box.show();
                return;
            }
            var zindex = 2;
            var dialog = $.pdialog.getCurrent();
            if (dialog && dialog.length) {
                zindex = dialog.css('zIndex') + 1;
            }
            $box  = $('<div id="'+ treeid +'_select_box" class="tree-box"></div>')
                        .css({position:'absolute', 'zIndex':zindex, 'min-width':width, height:height, overflow:'auto', background:'#FAFAFA', border:'1px #EEE solid'})
                        .hide()
                        .appendTo($('body'));
            $tree.appendTo($box).css('width','100%').data('fromObj', $this).removeClass('hide').show();
            setPosition($box);
            $box.show();
        });
        $('body').on('mousedown', function(e) {
            var $target = $(e.target);
            if (!($this[0] == e.target || ($box && $box.length > 0 && $target.closest('.tree-box').length > 0))) {
                $box.hide();
            }
        });
        var $scroll = $this.closest('[layoutH]');
        if ($scroll && $scroll.length) {
            $scroll.scroll(function() {
                if ($box && $box.length) {
                    setPosition($box);
                }
            });
        }
        /*销毁tree*/
        $this.on('destory.selectzTree.b-jui', function() {
            $box.remove();
        });
    });
    
    //bootstrap - select && 联动
    $('select.selectpicker', $p).selectpicker();
    $('select.selectpicker', $p).change(function() {
        var $this       = $(this);
        var $nextselect = $($this.data('nextselect'));
        var refurl      = $this.data('refurl');
        var _setEmpty   = function($select) {
            var $_nextselect = $($select.data('nextselect'));
            if ($_nextselect && $_nextselect.length) {
                var emptytxt = $_nextselect.data('emptytxt') || '&nbsp;';
                $_nextselect.html('<option>'+ emptytxt +'</option>').selectpicker('refresh');
                _setEmpty($_nextselect);
            }
        };
        if (($nextselect && $nextselect.length) && refurl) {
            $.ajax({
                type     : 'POST', 
                dataType : "json", 
                url      : refurl.replace("{value}", encodeURIComponent($this.val())), 
                cache    : false,
                data     : {},
                success  : function(json) {
                    if (!json) return;
                    var html = '';
                    $.each(json, function(i) {
                        if (json[i] && json[i].length > 1) {
                            html += '<option value="'+json[i][0]+'">' + json[i][1] + '</option>';
                        }
                    });
                    if (!html) {
                        html = $nextselect.data('emptytxt') || '&nbsp;';
                        html = '<option>'+ html +'</option>';
                    }
                    $nextselect.html(html).selectpicker('refresh');
                    _setEmpty($nextselect);
                },
                error   : DWZ.ajaxError
            });
        }
    });
    
    //bootstrap - tags
    if ($.fn.tags) {
        $(".tags-control", $p).each(function() {
            var $this = $(this);
            var url   = $this.data('url'),
                type  = $this.data('type') || 'GET',
                param = $this.data('parametername') || 'tagName',
                max   = $this.data('max') || 0,
                clear = $this.data('clearnotfound') || false;
            $this.tags({
                url: url,
                type: type,
                parameterName: param,   // 生成的<input type='hidden' />的name属性
                max: max,              // 允许的最大标签个数(0=不限)
                clearNotFound: clear   // 是否清除未查找到的输入字符
            });
        });
    }
    
    //bootstrap - tooltips
    $('.j-tooltip', $p).each(function() {
        var $this = $(this);
        var html      = $this.data('html') || false;
        var placement = $this.data('placement') || 'auto';
        var content   = $this.data('content') || $($this.data('el-content')).html() || $this.attr('title') || false;
        $this.tooltip({html:html, placement:placement, title:content, container:'body'});
    });
    
    //bootstrap - popover
    $('.j-popover', $p).each(function() {
        var $this = $(this);
        var html      = $this.data('html') || false;
        var content   = $this.data('content') || $($this.data('el-content')).html() || false;
        var placement = $this.data('placement') || 'auto';
        var trigger   = $this.data('trigger') || 'click';
        $this.popover({html:html, placement:placement, content:content, trigger:trigger});
    });
    
    //dragsort
    if ($.fn.dragsort) {
        $('.j-dragsort', $p).each(function() {
            var $this = $(this);
            var selector    = $this.data('selector') || 'div',
                exclude     = $this.data('exclude') || 'input, textarea',
                dragend     = $this.data('dragend'),
                dragBetween = $this.data('between') || false,
                placeholder = $this.data('placeholder'),
                s_container = $this.data('scrollcontainer') || window,
                otherBox    = $this.data('otherbox') || null;
            if (placeholder) {
                placeholder = $(placeholder).html();
            } else {
                placeholder = '<li class="placeHolder"><div></div></li>';
            }
            if (dragend) {
                dragend = str2Func(dragend) || function() {};
            } else {
                dragend = function() {};
            }
            if (s_container && s_container != window) {
                s_container = $this.closest(s_container);
                if (!s_container.length) s_container = window;
            }
            var $dragBox = $this;
            if (otherBox && $(otherBox).length) $dragBox = $this.add(otherBox);
            $dragBox.dragsort({
                dragSelector        : selector, // 需要拖动的子元素选择器
                dragSelectorExclude : exclude,  // 需要排除的可拖动元素
                dragEnd             : dragend,  // 拖动结束回调
                dragBetween         : dragBetween,  // 是否允许在多个容器间互相拖拽
                placeHolderTemplate : placeholder,  // 拖动时[目的地]的占位模板
                scrollContainer     : s_container
            });
        });
    }
    
}