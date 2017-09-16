function nav_hover(i) {
    $('#navDiv' + i).hover( function(){
        $('#navDiv' + i +'>div').css('opacity', 0);
    }, function () {
        $('#navDiv' + i +'>div').css('opacity', 1);
    });
}

for (var i = 1; i < 6; i++) {
    nav_hover(i);
}
