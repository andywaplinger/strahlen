// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


var Strahlen = {};

$(document).ready(function(){
    $('body').scrollTop(0);

    Strahlen.setBodyPadding();

    $('#feature-nav li:not(:last-child) a').click(function(event) {
        var offset = parseInt($('#nav-container').height()) + 50;
        event.preventDefault();
        Strahlen.scrollto($(this).attr('href'), offset - 50 );
    });



    if(window.location.hash){
        setTimeout(function(){
            var height = parseInt($('#nav-container').height());
           var padding = $('#opt-in-container').is(':visible') ? 215 : 240;
           // console.log('p');
            // console.log(padding);

            //185
            $('body').scrollTop( ( $(window.location.hash).position().top + height + padding ));
        },15);
    }

    $('#close-email-input').click(function(){
        Strahlen.removeEmailBar();
    });
});


Strahlen.scrollto = function (element, offset){
    $(element)[0].scrollIntoView();
    scrollBy(0, -(offset) );
}

Strahlen.removeEmailBar = function(){
    $('#opt-in-container').empty().remove();
    Strahlen.setBodyPadding();
    $.get('/hide_opt_in');
}

Strahlen.setBodyPadding = function(){
    var height = parseInt($('#nav-container').height()) + 50;
    $('body').css('padding-top', height).data('offset', height);
}