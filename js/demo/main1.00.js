var cssValuesYellow = {
    'background-image' : 'url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMSAxIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIj48bGluZWFyR3JhZGllbnQgaWQ9Imxlc3NoYXQtZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPjxzdG9wIG9mZnNldD0iMCUiIHN0b3AtY29sb3I9IiNGRUMwMkQiIHN0b3Atb3BhY2l0eT0iMSIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI0ZGQUQxOSIgc3RvcC1vcGFjaXR5PSIxIi8+PC9saW5lYXJHcmFkaWVudD48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2xlc3NoYXQtZ2VuZXJhdGVkKSIgLz48L3N2Zz4=)',
    'background-image' : '-webkit-linear-gradient(top, #FEC02D 0%, #FFAD19 100%)',
    'background-image' : '-moz-linear-gradient(top, #FEC02D 0%, #FFAD19 100%)',
    'background-image' : '-o-linear-gradient(top, #FEC02D 0%, #FFAD19 100%)',
    'background-image' : 'linear-gradient(to bottom, #FEC02D 0%, #FFAD19 100%)'
};

var cssValuesBrown = {
    'background-image' : 'url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMSAxIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIj48bGluZWFyR3JhZGllbnQgaWQ9Imxlc3NoYXQtZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMCUiPjxzdG9wIG9mZnNldD0iNTAlIiBzdG9wLWNvbG9yPSIjNkQzMTE5IiBzdG9wLW9wYWNpdHk9IjEiLz48c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMzOTE1MDAiIHN0b3Atb3BhY2l0eT0iMSIvPjwvbGluZWFyR3JhZGllbnQ+PHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNsZXNzaGF0LWdlbmVyYXRlZCkiIC8+PC9zdmc+)',
    'background-image' : '-webkit-linear-gradient(left, #6D3119 50%, #391500 100%)',
    'background-image' : '-moz-linear-gradient(left, #6D3119 50%, #391500 100%)',
    'background-image' : '-o-linear-gradient(left, #6D3119 50%, #391500 100%)',
    'background-image' : 'linear-gradient(to right, #6D3119 50%, #391500 100%)'
};


function nav_hover(i) {
    $('#navDiv' + i).hover( function(){
        var elem = '#navDiv' + i +'>div';
        $(elem).stop();
        $(elem).css(cssValuesYellow);
        $(elem).animate({ width: '100%'}, 200);
    }, function () {
        var elem = '#navDiv' + i +'>div';
        $(elem).stop();
        $(elem).animate({ width: '1.5%'}, 200);
        setTimeout("$('" + elem + "').css(cssValuesBrown);", 200);
    });
}

for (var i = 1; i <= 6; i++) {
    nav_hover(i);
}