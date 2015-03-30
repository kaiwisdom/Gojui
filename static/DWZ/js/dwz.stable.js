/**
 * @author Roger Wu v1.0
 * @author ZhangHuihua@msn.com 2011-4-1
 */
(function($){
    $.fn.jTable = function(options) {
        return this.each(function() {
            var $table  = $(this);
            var tlength = $table.width();
            var aStyles = [];
            var $tc     = $table.parent().addClass('j-resizeGrid'); // table parent container
            var layoutH = $(this).attr('layoutH');
            var gStyle  = $(this).attr('g-style') || ''; //K'naan@2014-04-15添加tbody中表格的style属性及id属性
            var gId     = $(this).attr('g-id') || '';
            var oldThs = $table.find('thead > tr:last-child').find('th');
            for (var i = 0, l = oldThs.size(); i < l; i++) {
                var $th   = $(oldThs[i]);
                var style = [], width = $th.innerWidth() - (100 * $th.innerWidth() / tlength) - 2;
                style[0]  = parseInt(width);
                style[1]  = $th.attr('align');
                style[2]  = $th.attr('class');
                aStyles[aStyles.length] = style;
            }
            $(this).wrap('<div class="grid"></div>');
            var $grid = $table.parent().html($table.html());
            var thead = $grid.find('thead');
            thead.wrap('<div class="gridHeader"><div class="gridThead"><table class="table table-bordered" style="width:'+ (tlength - 20) + 'px;"></table></div></div>');
            var lastH = $('>tr:last-child', thead);
            var ths   = $('>th', lastH);
            ths.each(function(i){
                var $th = $(this), style = aStyles[i];
                if ($th.attr('align')) {
                    $th.addClass($th.attr('align'));
                }
                $th.addClass(style[1]).removeAttr('align').removeAttr('width').width(style[0]).html('<div class="gridCol">'+ $th.html() +'</div>');
                if ($th.attr('orderField')) {
                    $th.addClass('orderby').addClass(aStyles[2]);
                    var $order = $('<a href="javascript:;" class="order"><span class="up" title="升序"><i class="fa fa-angle-up"></i></span><span class="down" title="降序"><i class="fa fa-angle-down"></i></span></a>');
                    $order.attr('orderField', $th.attr('orderField')).appendTo($th.find('.gridCol')).click(function() {
                        var $this = $(this);
                        if ($th.hasClass('asc')) {
                            $this.addClass('desc');
                        } else if ($th.hasClass('desc')) {
                            $this.addClass('asc');
                        }
                    }).hover(function() {
                        var $this = $(this);
                        if ($th.hasClass('asc')) {
                            $th.removeClass('asc').addClass('desc');
                        } else if ($th.hasClass('desc')) {
                            $th.removeClass('desc').addClass('asc');
                        }
                    }).orderBy({
                        targetType: $table.attr('targetType'),
                        rel: $table.attr('rel'),
                        asc: $table.attr('asc') || 'asc',
                        desc: $table.attr('desc') || 'desc'
                    });
                }
            });
            var tbody = $grid.find('>tbody');
            var layoutStr = layoutH ? ' layoutH="' + layoutH + '"' : '';
            
            tbody.wrap('<div class="gridScroller"'+ layoutStr +' style="width:'+ $tc.width() +'px;"><div class="gridTbody"><table class="table table-striped table-hover table-bordered" style="width:'+ (tlength - 20) +'px; '+ gStyle +'" id="'+ gId +'"></table></div></div>');
            var ftr = $('>tr:first-child', tbody);
            var $trs = tbody.find('>tr');
            $('>td', ftr).each(function(i) {
                if (i < aStyles.length) $(this).width(aStyles[i][0]);
            });
            $grid.append('<div class="resizeMarker" style="display:none; height:300px; left:57px;"></div><div class="resizeProxy" style="left:377px; display:none; height:300px;"></div>');
            
            var scroller = $('.gridScroller', $grid);
            scroller.scroll(function(event){
                var header = $('.gridThead', $grid);
                if(scroller.scrollLeft() > 0){
                    header.css('position', 'relative');
                    var scroll = scroller.scrollLeft();
                    header.css('left', scroller.cssv('left') - scroll);
                }
                if(scroller.scrollLeft() == 0) {
                    header.css('position', 'relative');
                    header.css('left', '0px');
                }
                return false;
            });        
            
            $('>tr', thead).each(function() {
                $('>th', this).each(function(i){
                    var th = this, $th = $(this);
                    $th.mouseover(function(event){
                        var offset = $.jTableTool.getOffset(th, event).offsetX;
                        if($th.outerWidth() - offset < 5) {
                            $th.css('cursor', 'col-resize').mousedown(function(event) {
                                $('.resizeProxy', $grid).show().css({
                                    left: $.jTableTool.getRight(th)- $('.gridScroller', $grid).scrollLeft(),
                                    top:$.jTableTool.getTop(th),
                                    height:$.jTableTool.getHeight(th,$grid),
                                    cursor:'col-resize'
                                });
                                $('.resizeMarker', $grid).show().css({
                                        left: $.jTableTool.getLeft(th) + 1 - $('.gridScroller', $grid).scrollLeft(),
                                        top: $.jTableTool.getTop(th),
                                        height:$.jTableTool.getHeight(th,$grid)                                    
                                });
                                $('.resizeProxy', $grid).jDrag($.extend(options, {scop:true, cellMinW:20, relObj:$('.resizeMarker', $grid)[0],
                                        move: 'horizontal',
                                        event:event,
                                        stop: function(){
                                            var pleft = $('.resizeProxy', $grid).position().left;
                                            var mleft = $('.resizeMarker', $grid).position().left;
                                            var move = pleft - mleft - $th.outerWidth() -9;

                                            var cols = $.jTableTool.getColspan($th);
                                            var cellNum = $.jTableTool.getCellNum($th);
                                            var oldW = $th.width(), newW = $th.width() + move;
                                            var $dcell = $('>td', ftr).eq(cellNum - 1);
                                            
                                            $th.width(newW +'px');
                                            $dcell.width(newW +'px');
                                            
                                            $('.resizeMarker,.resizeProxy', $grid).hide();
                                        }
                                    })
                                );
                            });
                        } else {
                            $th.unbind('mousedown');
                        }
                        return false;
                    });
                });
            });
        
            function _resizeGrid(){
                $('div.j-resizeGrid').each(function(){
                    var width = $(this).innerWidth();
                    if (width){
                        $('div.gridScroller', this).width(width +'px');
                        $('.table', this).width((width - 20) +'px');
                    }
                });
            }
            $(window).unbind(DWZ.eventType.resizeGrid).bind('resizeGrid', _resizeGrid);
        });
    };
    
    $.jTableTool = {
        getLeft:function(obj) {
            var width = 0;
            $(obj).prevAll().each(function(){
                width += $(this).outerWidth();
            });
            return width - 1;
        },
        getRight:function(obj) {
            var width = 0;
            $(obj).prevAll().andSelf().each(function(){
                width += $(this).outerWidth();
            });
            return width - 1;
        },
        getTop:function(obj) {
            var height = 0;
            $(obj).parent().prevAll().each(function(){
                height += $(this).outerHeight();
            });
            return height;
        },
        getHeight:function(obj, parent) {
            var height = 0;
            var head = $(obj).parent();
            head.nextAll().andSelf().each(function(){
                height += $(this).outerHeight();
            });
            $('.gridTbody', parent).children().each(function(){
                height += $(this).outerHeight();
            });
            return height;
        },
        getCellNum:function(obj) {
            return $(obj).prevAll().andSelf().size();
        },
        getColspan:function(obj) {
            return $(obj).attr('colspan') || 1;
        },
        getStart:function(obj) {
            var start = 1;
            $(obj).prevAll().each(function(){
                start += parseInt($(this).attr('colspan') || 1);
            });
            return start;
        },
        getPageCoord:function(element){
            var coord = {x: 0, y: 0};
            while (element){
                coord.x += element.offsetLeft;
                coord.y += element.offsetTop;
                element = element.offsetParent;
            }
            return coord;
        },
        getOffset:function(obj, evt){
            if($.browser.msie ) {
                var objset = $(obj).offset();
                var evtset = {
                    offsetX:evt.pageX || evt.screenX,
                    offsetY:evt.pageY || evt.screenY
                };
                var offset ={
                    offsetX: evtset.offsetX - objset.left,
                    offsetY: evtset.offsetY - objset.top
                };
                return offset;
            }
            var target = evt.target;
            if (target.offsetLeft == undefined){
                target = target.parentNode;
            }
            var pageCoord = $.jTableTool.getPageCoord(target);
            var eventCoord ={
                x: window.pageXOffset + evt.clientX,
                y: window.pageYOffset + evt.clientY
            };
            var offset ={
                offsetX: eventCoord.x - pageCoord.x,
                offsetY: eventCoord.y - pageCoord.y
            };
            return offset;
        }
    };
})(jQuery);