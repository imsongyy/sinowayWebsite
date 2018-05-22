
$(document).ready(function(){
    "use strict";

    var window_width 	 = $(window).width(),
        window_height 		 = window.innerHeight,
        header_height 		 = $(".default-header").height(),
        header_height_static = $(".site-header.static").outerHeight(),
        fitscreen 			 = window_height - header_height;


    $(".fullscreen").css("height", window_height)
    $(".fitscreen").css("height", fitscreen);

    //-------- Active Sticky Js ----------//
    $(".default-header").sticky({topSpacing:0});


    if(document.getElementById("default-select")){
        $('select').niceSelect();
    };

    $('.img-pop-up').magnificPopup({
        type: 'image',
        gallery:{
            enabled:true
        }
    });



    // $('.navbar-nav>li>a').on('click', function(){
    //     $('.navbar-collapse').collapse('hide');
    // });

    //  Counter Js

    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });


    $('.play-btn').magnificPopup({
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
    });



    $('.active-feature-carusel').owlCarousel({
        items:3,
        loop:true,
        autoplay:true,
        margin:30,
        nav:true,
        navText: ["<span class='lnr lnr-arrow-up'></span>","<span class='lnr lnr-arrow-down'></span>"],
        responsive:{
            0:{
                items: 1
            },
            414:{
                items: 2
            },
            768:{
                items: 3
            }
        }
    });


    // Select all links with hashes
    $('.navbar-nav a[href*="#"]')
        // Remove links that don't actually link to anything
        .not('[href="#"]')
        .not('[href="#0"]')
        .on('click',function(event) {
            // On-page links
            if (
                location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                &&
                location.hostname == this.hostname
            ) {
                // Figure out element to scroll to
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                // Does a scroll target exist?
                if (target.length) {
                    // Only prevent default if animation is actually gonna happen
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top-50
                    }, 1000, function() {
                        // Callback after animation
                        // Must change focus!
                        var $target = $(target);
                        $target.focus();
                        if ($target.is(":focus")) { // Checking if the target was focused
                            return false;
                        } else {
                            $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
                            $target.focus(); // Set focus again
                        };
                    });
                }
            }
        });


    $(document).ready(function() {
        $('#mc_embed_signup').find('form').ajaxChimp();
    });


    $(".single-service").hover(function(){
        $(this).find($("img")).addClass("animated flip");
    },function(){
        $(this).find($("img")).removeClass("flip");
    })
    $(".qqWrap").hover(function(){
        $("#qq").addClass("animated tada");
    },function(){
        $("#qq").removeClass("animated tada");
    })
    $(".cispList .col-md-2").hover(function(){
        $(this).find("img").addClass("animated flip");
    },function(){
        $(this).find("img").removeClass("animated flip");
    })
});
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0, pos);
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var basePath = localhostPaht+projectName;


var htmlData = {
    data:[],
}


function getData(){
    $.ajax({
        type : "POST",
        url : basePath + "/getInformation?flag=1",
        async: false,
        dataType : "json",
        success : function(result){
        	if(result.msg == "success"){
        		htmlData.data = result.result;
        	}
        	for(var i=0;i<htmlData.data.length;i++){
        	    htmlData.data[i].createTime = formatDateTime(htmlData.data[i].createTime);
        	} 
        }
    })
}
getData();


function formatDateTime(inputTime) {
    var date = new Date(inputTime);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
};
var vm = new Vue({
    el : "#price",
    data : htmlData,
    methods : {

    }
})
function load() {
    vm.$mount("#app");
}
