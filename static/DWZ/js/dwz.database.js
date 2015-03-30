/**
 * @author ZhangHuihua@msn.com
 */
(function($){
    var _lookup = {currentGroup:"", suffix:"", $target:null, pk:"id"};
    var _util = {
        _lookupPrefix: function(key){
            var strDot = _lookup.currentGroup ? "." : "";
            return _lookup.currentGroup + strDot + key + _lookup.suffix;
        },
        lookupPk: function(key){
            return this._lookupPrefix(key);
        },
        lookupField: function(key){
            return this.lookupPk(key);
        }
    };
    
    $.extend({
        bringBackSuggest: function(args){
            var $box = _lookup['$target'].parents(".unitBox:first");
            $box.find(":input").each(function(){
                var $input = $(this), inputName = $input.attr("name");
                
                for (var key in args) {
                    var name = (_lookup.pk == key) ? _util.lookupPk(key) : _util.lookupField(key);

                    if (name == inputName) {
                        $input.val(args[key]);
                        break;
                    }
                }
            });
        },
        bringBack: function(args){
            $.bringBackSuggest(args);
            $.pdialog.closeCurrent();
        }
    });
    
    $.fn.extend({
        lookup: function(){
            return this.each(function(){
                var $this = $(this), options = {mask:true, 
                    width:$this.attr('width')||820, height:$this.attr('height')||400,
                    maxable:eval($this.attr("maxable") || "true"),
                    resizable:eval($this.attr("resizable") || "true")
                };
                $this.click(function(event){
                    _lookup = $.extend(_lookup, {
                        currentGroup: $this.attr("lookupGroup") || "",
                        suffix: $this.attr("suffix") || "",
                        $target: $this,
                        pk: $this.attr("lookupPk") || "id"
                    });
                    
                    var url = unescape($this.attr("href")).replaceTmById($(event.target).parents(".unitBox:first"));
                    if (!url.isFinishedTm()) {
                        alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
                        return false;
                    }
                    
                    $.pdialog.open(url, "_blank", $this.attr("title") || $this.text(), options);
                    return false;
                });
            });
        },
        multLookup: function(){
            return this.each(function(){
                var $this = $(this), args={};
                $this.click(function(event){
                    var $unitBox = $this.parents(".unitBox:first");
                    $unitBox.find("[name='"+$this.attr("multLookup")+"']").filter(":checked").each(function(){
                        var _args = DWZ.jsonEval($(this).val());
                        for (var key in _args) {
                            var value = args[key] ? args[key]+"," : "";
                            args[key] = value + _args[key];
                        }
                    });

                    if ($.isEmptyObject(args)) {
                        alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
                        return false;
                    }
                    $.bringBack(args);
                });
            });
        },
        suggest: function(){
            var op = {suggest$:"#suggest", suggestShadow$: "#suggestShadow"};
            var selectedIndex = -1;
            return this.each(function(){
                var $input = $(this).attr('autocomplete', 'off').keydown(function(event){
                    if (event.keyCode == DWZ.keyCode.ENTER && $(op.suggest$).is(':visible')) return false; //屏蔽回车提交
                });
                
                var suggestFields=$input.attr('suggestFields').split(",");
                
                function _show(event){
                    var offset = $input.offset();
                    var iTop = offset.top+this.offsetHeight;
                    var $suggest = $(op.suggest$);
                    if ($suggest.size() == 0) $suggest = $('<div id="suggest"></div>').appendTo($('body'));

                    $suggest.css({
                        left:offset.left+'px',
                        top:iTop+'px'
                    }).show();
                    
                    _lookup = $.extend(_lookup, {
                        currentGroup: $input.attr("lookupGroup") || "",
                        suffix: $input.attr("suffix") || "",
                        $target: $input,
                        pk: $input.attr("lookupPk") || "id"
                    });

                    var url = unescape($input.attr("suggestUrl")).replaceTmById($(event.target).parents(".unitBox:first"));
                    if (!url.isFinishedTm()) {
                        alertMsg.error($input.attr("warn") || DWZ.msg("alertSelectMsg"));
                        return false;
                    }
                    
                    var postData = {};
                    postData[$input.attr("postField")||"inputValue"] = $input.val();

                    $.ajax({
                        global:false,
                        type:'POST', dataType:"json", url:url, cache: false,
                        data: postData,
                        success: function(response){
                            if (!response) return;
                            var html = '';

                            $.each(response, function(i){
                                var liAttr = '', liLabel = '';
                                
                                for (var i=0; i<suggestFields.length; i++){
                                    var str = this[suggestFields[i]];
                                    if (str) {
                                        if (liLabel) liLabel += '-';
                                        liLabel += str;
                                    }
                                }
                                for (var key in this) {
                                    if (liAttr) liAttr += ',';
                                    liAttr += key+":'"+this[key]+"'";
                                }
                                html += '<li lookupAttrs="'+liAttr+'">' + liLabel + '</li>';
                            });
                            
                            var $lis = $suggest.html('<ul>'+html+'</ul>').find("li");
                            $lis.click(function(){
                                _select($(this));
                            });
                            if ($lis.size() == 1 && event.keyCode != DWZ.keyCode.BACKSPACE) {
                                _select($lis.eq(0));
                            } else if ($lis.size() == 0){
                                var jsonStr = "";
                                for (var i=0; i<suggestFields.length; i++){
                                    if (_util.lookupField(suggestFields[i]) == event.target.name) {
                                        break;
                                    }
                                    if (jsonStr) jsonStr += ',';
                                    jsonStr += suggestFields[i]+":''";
                                }
                                jsonStr = "{"+_lookup.pk+":''," + jsonStr +"}";
                                $.bringBackSuggest(DWZ.jsonEval(jsonStr));
                            }
                        },
                        error: function(){
                            $suggest.html('');
                        }
                    });

                    $(document).bind("click", _close);
                    return false;
                }
                function _select($item){
                    var jsonStr = "{"+ $item.attr('lookupAttrs') +"}";
                    
                    $.bringBackSuggest(DWZ.jsonEval(jsonStr));
                }
                function _close(){
                    $(op.suggest$).html('').hide();
                    selectedIndex = -1;
                    $(document).unbind("click", _close);
                }
                
                $input.focus(_show).click(false).keyup(function(event){
                    var $items = $(op.suggest$).find("li");
                    switch(event.keyCode){
                        case DWZ.keyCode.ESC:
                        case DWZ.keyCode.TAB:
                        case DWZ.keyCode.SHIFT:
                        case DWZ.keyCode.HOME:
                        case DWZ.keyCode.END:
                        case DWZ.keyCode.LEFT:
                        case DWZ.keyCode.RIGHT:
                            break;
                        case DWZ.keyCode.ENTER:
                            _close();
                            break;
                        case DWZ.keyCode.DOWN:
                            if (selectedIndex >= $items.size()-1) selectedIndex = -1;
                            else selectedIndex++;
                            break;
                        case DWZ.keyCode.UP:
                            if (selectedIndex < 0) selectedIndex = $items.size()-1;
                            else selectedIndex--;
                            break;
                        default:
                            _show(event);
                    }
                    $items.removeClass("selected");
                    if (selectedIndex>=0) {
                        var $item = $items.eq(selectedIndex).addClass("selected");
                        _select($item);
                    }
                });
            });
        },
        
        itemDetail: function(){
            return this.each(function(){
                var $table = $(this).css("clear","both"), $tbody = $table.find("tbody"), initNum = $table.attr('initNum') || 0;
                var isTree = $table.hasClass('j-treetable') ? true : false;
                var fields=[];

                $table.find("tr:first th[type]").each(function(i){
                    var $th = $(this);
                    var field = {
                        type: $th.attr("type") || "text",
                        patternDate: $th.attr("dateFmt") || "yyyy-MM-dd",
                        name: $th.attr("name") || "",
                        defaultVal: $th.attr("defaultVal") || "",
                        size: $th.attr("size") || "12",
                        enumUrl: $th.attr("enumUrl") || "",
                        lookupGroup: $th.attr("lookupGroup") || "",
                        lookupUrl: $th.attr("lookupUrl") || "",
                        lookupPk: $th.attr("lookupPk") || "id",
                        suggestUrl: $th.attr("suggestUrl"),
                        suggestFields: $th.attr("suggestFields"),
                        postField: $th.attr("postField") || "",
                        fieldClass: $th.attr("fieldClass") || "",
                        fieldAttrs: $th.attr("fieldAttrs") || ""
                        //追加
                        ,html: $th.attr("html") || ""
                    };
                    fields.push(field);
                });
                
                /*K'naan@2014-08-04修改删除方法*/
                $tbody.on('click', 'a.j-del', function() {
                    var $btnDel = $(this);
                    var callfun = $btnDel.attr('callfun'); //新增删除时的回调函数
                    function delDbData(){
                        if ($btnDel.is("[href^=javascript:]")) {
                            $btnDel.parents("tr:first").remove();
                            initSuffix($tbody);
                            if (callfun) {
                                var fn = str2Func(callfun);
                                if (fn) fn();
                            }
                            return false;
                        }
                        $.ajax({
                            type:'POST', dataType:"json", url:$btnDel.attr('href'), cache: false,
                            success: function(json) {
                                DWZ.ajaxDone(json);
                                if (json[DWZ.keys.statusCode] == DWZ.statusCode.ok) {
                                    $btnDel.parents("tr:first").remove();
                                    initSuffix($tbody);
                                    if (callfun) {
                                        var fn = str2Func(callfun);
                                        if (fn) fn();
                                    }
                                }
                            },
                            error: DWZ.ajaxError
                        });
                    }
                    if ($btnDel.attr("title")){
                        alertMsg.confirm($btnDel.attr("title"), {okCall: delDbData});
                    } else {
                        delDbData();
                    }
                    return false;
                });
                
                /*K'naan修改添加按钮*/
                var trTm = "";
                var $numAdd = $table.find('tr:first').find("input.num-add");
                var $btnAdd = $table.find('tr:first').find("a.j-add");
                $numAdd.bind('keydown', function(e) {
                    if (e.which == 13) {
                        e.preventDefault();
                        $btnAdd.click();
                    }
                });
                $btnAdd.click(function() {
                    var rowNum = 1;
                    if (!isNaN($(this).prev().val())) rowNum = parseInt($(this).prev().val());
                    if (!trTm) trTm = trHtml(fields, isTree);
                        var $firstTr;
                        for (var i = 0; i < rowNum; i++) {
                            var $tr = $(trTm);
                            if (i == 0) $firstTr = $tr;
                            $tr.hide().appendTo($tbody); //新增行
                            initSuffix($tbody);
                            initEnter($tbody);
                            $tr.initUI().show().css('display', '');
                            
                        }
                        /*置入焦点*/
                        if ($firstTr && $firstTr.length) {
                            var $input = $firstTr.find('.form-control');
                            $input.each(function() {
                                var $txt = $(this);
                                if (!$txt.prop('readonly')) {
                                    $txt.focus();
                                    return false;
                                }
                            });
                        }
                });
                /*end*/
                /*K'naan 新增初始化行及回车for Tab*/
                if ((initNum * 1) > 0) {
                    var $rowNum = $btnAdd.prev();
                    $rowNum.val(initNum);
                    $btnAdd.click();
                    $rowNum.val(1);
                }
                /*回车 for tab*/
                initEnter($tbody);
            });
            
            /**
             * K'naan 新增回车--for Tab
             */
            function initEnter($tbody) {
                var $inps = $tbody.find('tr').find('.form-control');
                $inps.each(function(i) {
                    $(this).bind('keydown', function (e) {
                        var key = e.which;
                        if (key == 13) {
                            e.preventDefault();
                            var nexInd = i + 1;
                            if ($inps.eq(nexInd)) {
                                $inps.eq(nexInd).focus();
                            }
                        }
                    });
                });
            }
            
            /**
             * 删除时重新初始化下标
             * K'naan 部分修改
             */
            function initSuffix($tbody) {
                $tbody.find('>tr').each(function(i){
                    var $tr = $(this);
                    var data_id = $tr.attr('data-tt-id');
                    if (data_id) {
                        $tr.attr('data-tt-id', data_id.replaceSuffix(i + 1));
                        $tr.addClass('leaf expanded');
                        if ($tr.find('td:eq(0)').find('.indenter').length == 0) {
                            $tr.find('td:eq(0)').prepend('<span class="indenter" style="padding-left: 0px;"></span>');
                        }
                        if ($tr.find('td:eq(0)').find('.indenter').length > 0) {
                            $tr.find('td:eq(0)').find('.indenter').not(':first').remove();
                        }
                    }
                    $(':input, :file, div, a, label', this).each(function(){
                        var $this = $(this),
                            name  = $this.attr('name'), 
                            val   = $this.val(),
                            fors  = $this.attr('for'),
                            id    = $this.attr('id'),
                            href  = $this.attr('href');

                        if (name) $this.attr('name', name.replaceSuffix(i));
                        if (fors) $this.attr('for', fors.replaceSuffix(i));
                        if (id) $this.attr('id', id.replaceSuffix(i).replaceSuffix2(i));
                        if (href) $this.attr('href', href.replaceSuffix(i));
                        
                        var lookupGroup = $this.attr('lookupGroup');
                        if (lookupGroup) {$this.attr('lookupGroup', lookupGroup.replaceSuffix(i));}
                        
                        var suffix = $this.attr("suffix");
                        if (suffix) {$this.attr('suffix', suffix.replaceSuffix(i));}
                        
                        if (val && val.indexOf("#index#") >= 0) $this.val(val.replace('#index#', i + 1));
                        /*增加*/
                        if ($this.hasClass("no")) {
                            $this.val(i + 1);
                            if ($this.attr("prefix")) { /*如果有前缀*/
                                $this.val($this.attr("prefix") + $this.val());
                            }
                        }
                    });
                });
            }
            
            function tdHtml(field){
                var html = '', suffix = '';
                
                if (field.name.endsWith("[#index#]")) suffix = "[#index#]";
                else if (field.name.endsWith("[]")) suffix = "[]";
                
                var suffixFrag = suffix ? ' suffix="' + suffix + '" ' : '';
                
                var attrFrag = '';
                var attrs = {};
                if (field.fieldAttrs){
                    attrs = DWZ.jsonEval(field.fieldAttrs);
                    for (var key in attrs) {
                        attrFrag += key+'="'+attrs[key]+'"';
                    }
                }
                switch(field.type){
                    case 'del':
                        var del_value = attrs.value || '删除';
                        html = '<a href="javascript:void(0)" class="btn btn-red btn-sm j-del'+ field.fieldClass + '" '+ attrFrag +'>'+ del_value +'</a>';
                        break;
                    case 'lookup':
                        var suggestFrag = '';
                        if (field.suggestFields) {
                            suggestFrag = 'autocomplete="off" lookupGroup="'+field.lookupGroup+'"'+suffixFrag+' suggestUrl="'+field.suggestUrl+'" suggestFields="'+field.suggestFields+'"' + ' postField="'+field.postField+'"';
                        }

                        html = '<div class="lookup-box"><input type="hidden" name="'+field.lookupGroup+'.'+field.lookupPk+suffix+'"/>'
                            + '<input type="text" name="'+field.name+'"'+suggestFrag+' lookupPk="'+field.lookupPk+'" size="'+ field.size +'" class="form-control '+field.fieldClass+'"/>'
                            + '<a class="j-lookup" href="'+field.lookupUrl+'" lookupGroup="'+field.lookupGroup+'" '+suggestFrag+' lookupPk="'+field.lookupPk+'" title="选择"><i class="fa fa-search"></i></a></div>';
                        break;
                    case 'attach':
                        html = '<input type="hidden" name="'+field.lookupGroup+'.'+field.lookupPk+suffix+'"/>'
                            + '<input type="text" name="'+field.name+'" size="'+field.size+'" readonly="readonly" size="'+ field.size +'" class="'+field.fieldClass+'"/>'
                            + '&nbsp;<a class="j-lookup" href="'+field.lookupUrl+'" lookupGroup="'+field.lookupGroup+'" '+suffixFrag+' lookupPk="'+field.lookupPk+'" width="560" height="300" title="选择">选择</a>';
                        break;
                    case 'date':
                        var defaultDate = field.defaultVal;
                        if (defaultDate == 'now') {
                            defaultDate = (new Date()).formatDate(field.patternDate);
                        }
                        html = '<input type="text" name="'+field.name+'" value="'+defaultDate+'" size="'+ field.size +'" class="form-control date '+field.fieldClass+'" dateFmt="'+field.patternDate+'" size="'+field.size+'" '+ attrFrag +' />';
                        break;
                    case 'textarea':
                        html = '<textarea name="'+field.name+'" rows="1" clos="1" class="form-control '+field.fieldClass+'">'+field.defaultVal+'</textarea>';
                        break;
                    case 'html':
                        var htmls = '';
                        if (field.html)
                            htmls = field.html;
                        htmls = htmls.replace(/&amp;/g, "'");
                        html = htmls;
                        break;
                    default:
                        html = '<input type="text" name="'+field.name+'" value="'+field.defaultVal+'" size="'+ field.size +'" class="form-control '+field.fieldClass+'" '+attrFrag+'/>';
                        break;
                }
                return '<td>'+html+'</td>';
            }
            function trHtml(fields, isTree){
                var html = '';
                $(fields).each(function(){
                    html += tdHtml(this);
                });
                if (!isTree) {
                    html = '<tr>'+html+'</tr>';
                } else {
                    html = '<tr data-tt-id="#index#">'+html+'</tr>';
                }
                return html;
            }
        },
        
        selectedTodo: function(){
            
            function _getIds(selectedIds, targetType){
                var ids = "";
                var $box = targetType == "dialog" ? $.pdialog.getCurrent() : navTab.getCurrentPanel();
                $box.find("input:checked").filter("[name='"+selectedIds+"']").each(function(i){
                    var val = $(this).val();
                    ids += i==0 ? val : ","+val;
                });
                return ids;
            }
            return this.each(function(){
                var $this = $(this);
                var selectedIds = $this.attr("rel") || "ids";
                var postType = $this.attr("postType") || "map";

                $this.click(function(){
                    var targetType = $this.attr("targetType");
                    var ids = _getIds(selectedIds, targetType);
                    if (!ids) {
                        alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
                        return false;
                    }
                    
                    var _callback = $this.attr("callback") || (targetType == "dialog" ? dialogAjaxDone : navTabAjaxDone);
                    if (! $.isFunction(_callback)) _callback = eval('(' + _callback + ')');
                    
                    function _doPost(){
                        $.ajax({
                            type:'POST', url:$this.attr('href'), dataType:'json', cache: false,
                            data: function(){
                                if (postType == 'map'){
                                    return $.map(ids.split(','), function(val, i) {
                                        return {name: selectedIds, value: val};
                                    })
                                } else {
                                    var _data = {};
                                    _data[selectedIds] = ids;
                                    return _data;
                                }
                            }(),
                            success: _callback,
                            error: DWZ.ajaxError
                        });
                    }
                    var title = $this.attr("title");
                    if (title) {
                        alertMsg.confirm(title, {okCall: _doPost});
                    } else {
                        _doPost();
                    }
                    return false;
                });
                
            });
        }
    });
})(jQuery);

