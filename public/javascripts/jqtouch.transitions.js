/*

            _/    _/_/    _/_/_/_/_/                              _/       
               _/    _/      _/      _/_/    _/    _/    _/_/_/  _/_/_/    
          _/  _/  _/_/      _/    _/    _/  _/    _/  _/        _/    _/   
         _/  _/    _/      _/    _/    _/  _/    _/  _/        _/    _/    
        _/    _/_/  _/    _/      _/_/      _/_/_/    _/_/_/  _/    _/     
       _/                                                                  
    _/

    Created by David Kaneda <http://www.davidkaneda.com>
    Documentation and issue tracking on Google Code <http://code.google.com/p/jqtouch/>
    
    Special thanks to Jonathan Stark <http://jonathanstark.com/>
    and pinch/zoom <http://www.pinchzoom.com/>
    
    (c) 2009 by jQTouch project members.
    See LICENSE.txt for license.

*/

(function(jQuery) {
    
    jQuery.fn.transition = function(css, options) {
        return this.each(function(){
            var jQueryel = jQuery(this);
            var defaults = {
                speed : '300ms',
                callback: null,
                ease: 'ease-in-out'
            };
            var settings = jQuery.extend({}, defaults, options);
            if(settings.speed === 0) {
                jQueryel.css(css);
                window.setTimeout(settings.callback, 0);
            } else {
                if (jQuery.browser.safari)
                {
                    var s = [];
                    for(var i in css) {
                        s.push(i);
                    }
                    jQueryel.css({
                        webkitTransitionProperty: s.join(", "), 
                        webkitTransitionDuration: settings.speed, 
                        webkitTransitionTimingFunction: settings.ease
                    });
                    if (settings.callback) {
                        jQueryel.one('webkitTransitionEnd', settings.callback);
                    }
                    setTimeout(function(el){ el.css(css) }, 0, jQueryel);
                }
                else
                {
                    jQueryel.animate(css, settings.speed, settings.callback);
                }
            }
        });
    }
})(jQuery);