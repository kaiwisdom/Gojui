/**
 * Theme Plugins
 * @author ZhangHuihua@msn.com
 */
(function($){
    $.fn.extend({
        theme: function(options){
            var op = $.extend({themeBase:"themes"}, options);
            var _themeHref = op.themeBase + "/#theme#/core.css";
            return this.each(function(){
                var jThemeLi = $(this).find("li[theme]");
                var setTheme = function(themeName) {
                    $("head").find("link[href$='core.css']").attr("href", _themeHref.replace("#theme#", themeName));
                    jThemeLi.find('i').removeClass('fa-check-circle').addClass('fa-circle');
                    jThemeLi.filter('[theme='+ themeName +']').find('i').removeClass('fa-circle').addClass('fa-check-circle');
                    
                    if ($.isFunction($.cookie)) $.cookie("dwz_theme", themeName, { path: '/', expires: 30 });
                    
                }
                
                jThemeLi.each(function(index){
                    var $this = $(this);
                    var themeName = $this.attr("theme");
                    $this.click(function() {
                        setTheme(themeName);
                    });
                });
            
                if ($.isFunction($.cookie)){
                    var themeName = $.cookie("dwz_theme");
                    if (themeName) {
                        setTheme(themeName);
                    } else {
                        setTheme("purple");
                    }
                }
                
                /*var jThemeLi = $(this).find(">li[theme]");
                var setTheme = function(themeName){
                    $("head").find("link[href$='style.css']").attr("href", _themeHref.replace("#theme#", themeName));
                    jThemeLi.find(">div").removeClass("selected");
                    jThemeLi.filter("[theme="+themeName+"]").find(">div").addClass("selected");
                    
                    if ($.isFunction($.cookie)) $.cookie("dwz_theme", themeName);
                }
                
                jThemeLi.each(function(index){
                    var $this = $(this);
                    var themeName = $this.attr("theme");
                    $this.addClass(themeName).click(function(){
                        setTheme(themeName);
                    });
                });
                    
                if ($.isFunction($.cookie)){
                    var themeName = $.cookie("dwz_theme");
                    if (themeName) {
                        setTheme(themeName);
                    }
                }*/
                
            });
        }
    });
})(jQuery);
