/**
 * @author Roger Wu
 * reference:dwz.drag.js, dwz.dialogDrag.js, dwz.resize.js, dwz.taskBar.js
 */
(function($){
    $.pdialog = {
        _op:{height:300, width:580, minH:40, minW:50, total:20, max:false, mask:false, resizable:true, drawable:true, maxable:true,minable:true,fresh:true},
        _current:null,
        _zIndex:42,
        getCurrent:function(){
            return this._current;
        },
        /*K'naan@2014-08-19 修改：整合刷新和重载入dialog*/
        refresh:function(dialogId) {
            if (!dialogId) {
                this._reload(this._current, {data:{}});
            } else {
                var dialog = (op.dialogId && $('body').data(op.dialogId)) || this._current;
                if (dialog) 
                    this._reload(dialog, {data:{}});
            }
        },
        reload:function(url, options) {
            var op = $.extend({data:{}, dialogId:'', callback:null}, options);
            var dialog = (op.dialogId && $('body').data(op.dialogId)) || this._current;
            if (dialog) {
                dialog.data('url', url);
                this._reload(dialog, op);
            }
        },
        _reload:function(dialog, options) {
            var url = dialog.data('url');
            var jDContent = dialog.find('.dialogContent');
            jDContent.ajaxUrl({
                type:(options.type || 'GET'), url:url, data:options.data, callback:function(response) {
                    jDContent.find('[layoutH]').layoutH(jDContent);
                    $('.pageContent', dialog).width(dialog.width() - 14);
                    $(':button.btn-close', dialog).click(function(){
                        $.pdialog.close(dialog);
                        return false;
                    });
                    if (options.callback && $.isFunction(options.callback)) options.callback(response);
                }
            });
        },
        //打开一个层
        open:function(url, dlgid, title, options) {
            var op = $.extend({},$.pdialog._op, options);
            var dialog = $('body').data(dlgid);
            //重复打开一个层
            if (dialog) {
                if (dialog.is(':hidden')) {
                    dialog.show();
                }
                if (op.fresh || url != dialog.data('url')) {
                    dialog.data('url',url);
                    dialog.find('.dialogHeader').find('h1').html('<i class="fa fa-caret-square-o-down"></i> '+ title);
                    this.switchDialog(dialog);
                    this._reload(dialog, options);
                }
            } else { //打开一个全新的层
                $('body').append(DWZ.frag['dialogFrag']);
                dialog = $('>.dialog-box:last-child', 'body');
                dialog.attr('data-id', dlgid);
                dialog.data('id',dlgid);
                dialog.data('url',url);
                if(options.close) dialog.data('close',options.close);
                if(options.param) dialog.data('param',options.param);
                
                dialog.find('.dialogHeader').find('h1').html('<i class="fa fa-caret-square-o-down"></i> '+ title);
                dialog.css('zIndex', ($.pdialog._zIndex += 2));
                $.pdialog._init(dialog, options);
                dialog.click(function(){
                    $.pdialog.switchDialog(dialog);
                });
                
                if(op.resizable)
                    dialog.jresize();
                if(op.drawable)
                     dialog.dialogDrag();
                $('a.close', dialog).click(function(event){ 
                    $.pdialog.close(dialog);
                    return false;
                });
                if (op.maxable) {
                    $('a.maximize', dialog).show().click(function(event){
                        $.pdialog.switchDialog(dialog);
                        $.pdialog.maxsize(dialog);
                        dialog.jresize('destroy').dialogDrag('destroy');
                        return false;
                    });
                } else {
                    $('a.maximize', dialog).hide();
                }
                $('a.restore', dialog).click(function(event){
                    $.pdialog.restore(dialog);
                    dialog.jresize().dialogDrag();
                    return false;
                });
                if (op.minable) {
                    $('a.minimize', dialog).show().click(function(event){
                        $.pdialog.minimize(dialog);
                        return false;
                    });
                } else {
                    $('a.minimize', dialog).hide();
                }
                $('div.dialogHeader a', dialog).mousedown(function(){
                    return false;
                });
                $('div.dialogHeader', dialog).dblclick(function(){
                    if($('a.restore',dialog).is(':hidden'))
                        $('a.maximize',dialog).trigger('click');
                    else
                        $('a.restore',dialog).trigger('click');
                });
                if(op.max) {
                    $.pdialog.maxsize(dialog);
                    dialog.jresize('destroy').dialogDrag('destroy');
                }
                $('body').data(dlgid, dialog);
                $.pdialog._current = dialog;
                $.pdialog.attachShadow(dialog);
                //load data
                var $this = this;
                var jDContent = $('.dialogContent', dialog);
                jDContent.loadUrl(url, {}, function(){
                    jDContent.find('[layoutH]').layoutH(jDContent);
                    $('.pageContent', dialog).width(dialog.width() - 10);
                    $('button.btn-close', dialog).click(function(){
                        $.pdialog.close(dialog);
                        return false;
                    });
                });
            }
            if (op.mask) {
                $('body').append(DWZ.frag['dwzDialogMask']);
                var mask = $('>.dialogBackground:last-child', 'body');
                mask.css('zIndex', $.pdialog._zIndex - 1).attr('id', 'mask-'+ dlgid);
                $('a.minimize', dialog).hide();
                dialog.data('mask', true);
                mask.show();
            }else {
                //add a task to task bar
                if(op.minable) $.taskBar.addDialog(dlgid,title);
            }
        },
        /**
         * 切换当前层
         * @param {Object} dialog
         */
        switchDialog:function(dialog) {
            var index = $(dialog).css('zIndex');
            $.pdialog.attachShadow(dialog);
            if($.pdialog._current) {
                var cindex = $($.pdialog._current).css('zIndex');
                $($.pdialog._current).css('zIndex', index);
                $(dialog).css('zIndex', cindex);
                $.pdialog._current = dialog;
            }
            $.taskBar.switchTask(dialog.data('id'));
        },
        /**
         * 给当前层附上阴隐层
         * @param {Object} dialog
         */
        attachShadow:function(dialog) {
            
        },
        _init:function(dialog, options) {
            var op = $.extend({}, this._op, options);
            var height = op.height>op.minH?op.height:op.minH;
            var width = op.width>op.minW?op.width:op.minW;
            if(isNaN(dialog.height()) || dialog.height() < height){
                $(dialog).height(height+'px');
                $('.dialogContent',dialog).height(height - $('.dialogHeader', dialog).outerHeight() - $('.dialogFooter', dialog).outerHeight() - 6);
            }
            if(isNaN(dialog.css('width')) || dialog.width() < width) {
                $(dialog).width(width+'px');
            }
            
            var iTop = ($(window).height()-dialog.height())/2;
            dialog.css({
                left: ($(window).width()-dialog.width())/2,
                top: iTop > 0 ? iTop : 0
            });
        },
        /**
         * 初始化半透明层
         * @param {Object} resizable
         * @param {Object} dialog
         * @param {Object} target
         */
        initResize:function(resizable, dialog,target) {
            $('body').css('cursor', target + '-resize');
            resizable.css({
                top: $(dialog).css('top'),
                left: $(dialog).css('left'),
                height:$(dialog).css('height'),
                width:$(dialog).css('width')
            });
            resizable.show();
        },
        /**
         * 改变阴隐层
         * @param {Object} target
         * @param {Object} options
         */
        repaint:function(target,options){
            
        },
        /**
         * 改变左右拖动层的高度
         * @param {Object} target
         * @param {Object} tmove
         * @param {Object} dialog
         */
        resizeTool:function(target, tmove, dialog) {
            $('div[class^="resizable"]', dialog).filter(function(){
                return $(this).attr('tar') == 'w' || $(this).attr('tar') == 'e';
            }).each(function(){
                $(this).css('height', $(this).outerHeight() + tmove);
            });
        },
        /**
         * 改变原始层的大小
         * @param {Object} obj
         * @param {Object} dialog
         * @param {Object} target
         */
        resizeDialog:function(obj, dialog, target) {
            var oleft = parseInt(obj.style.left);
            var otop = parseInt(obj.style.top);
            var height = parseInt(obj.style.height);
            var width = parseInt(obj.style.width);
            if(target == 'n' || target == 'nw') {
                tmove = parseInt($(dialog).css('top')) - otop;
            } else {
                tmove = height - parseInt($(dialog).css('height'));
            }
            $(dialog).css({left:oleft,width:width,top:otop,height:height});
            $('.dialogContent', dialog).css('width', (width-0) + 'px');
            $('.pageContent', dialog).css('width', (width-12) + 'px');
            if (target != 'w' && target != 'e') {
                var content = $('.dialogContent', dialog);
                content.css({height:height - $('.dialogHeader', dialog).outerHeight() - $('.dialogFooter', dialog).outerHeight() - 6});
                content.find('[layoutH]').layoutH(content);
                $.pdialog.resizeTool(target, tmove, dialog);
            }
            $.pdialog.repaint(target, {oleft:oleft,otop: otop,tmove: tmove,owidth:width});
            
            $(window).trigger(DWZ.eventType.resizeGrid);
        },
        close:function(dialog) {
            if(typeof dialog == 'string') dialog = $('body').data(dialog);
            var close = dialog.data('close');
            var go = true;
            if(close && $.isFunction(close)) {
                var param = dialog.data('param');
                if(param && param != ''){
                    param = DWZ.jsonEval(param);
                    go = close(param);
                } else {
                    go = close();
                }
                if(!go) return;
            }
            
            $(dialog).hide();
            if ($(dialog).data('mask')) {
                $('#mask-'+ $(dialog).data('id')).remove();
            } else {
                if ($(dialog).data('id')) $.taskBar.closeDialog($(dialog).data('id'));
            }
            $('body').removeData($(dialog).data('id'));
            $(dialog).trigger(DWZ.eventType.pageClear).remove();
            if ($('.dialogContent', 'body').length == 0) {$.pdialog._zIndex = 42;}
        },
        closeCurrent:function(){
            this.close($.pdialog._current);
        },
        checkTimeout:function(){
            var $conetnt = $('.dialogContent', $.pdialog._current);
            var json = DWZ.jsonEval($conetnt.html());
            if (json && json[DWZ.keys.statusCode] == DWZ.statusCode.timeout) this.closeCurrent();
        },
        maxsize:function(dialog) {
            $(dialog).data('original',{
                top:$(dialog).css('top'),
                left:$(dialog).css('left'),
                width:$(dialog).css('width'),
                height:$(dialog).css('height')
            });
            $('a.maximize',dialog).hide();
            $('a.restore',dialog).show();
            var iContentW = $(window).width();
            var iContentH = $(window).height() - 34;
            $(dialog).css({top:'0px',left:'0px',width:iContentW+'px',height:iContentH+'px'});
            $.pdialog._resizeContent(dialog,iContentW,iContentH);
        },
        restore:function(dialog) {
            var original = $(dialog).data('original');
            var dwidth = parseInt(original.width);
            var dheight = parseInt(original.height);
            $(dialog).css({
                top:original.top,
                left:original.left,
                width:dwidth,
                height:dheight
            });
            $.pdialog._resizeContent(dialog,dwidth,dheight);
            $('a.maximize',dialog).show();
            $('a.restore',dialog).hide();
            $.pdialog.attachShadow(dialog);
        },
        minimize:function(dialog){
            $(dialog).hide();
            //$('div.shadow').hide();
            var task = $.taskBar.getTask($(dialog).data('id'));
            $('.resizable').css({
                top: $(dialog).css('top'),
                left: $(dialog).css('left'),
                height:$(dialog).css('height'),
                width:$(dialog).css('width')
            }).show().animate({top:$(window).height()-60,left:task.position().left,width:task.outerWidth(),height:task.outerHeight()},250,function(){
                $(this).hide();
                $.taskBar.inactive($(dialog).data('id'));
            });
        },
        _resizeContent:function(dialog,width,height) {
            var content = $('.dialogContent', dialog);
            content.css({width:(width-0) + 'px',height:height - $('.dialogHeader', dialog).outerHeight() - $('.dialogFooter', dialog).outerHeight() - 6});
            content.find('[layoutH]').layoutH(content);
            $('.pageContent', dialog).css('width', (width-12) + 'px');
            
            $(window).trigger(DWZ.eventType.resizeGrid);
        }
    };
})(jQuery);