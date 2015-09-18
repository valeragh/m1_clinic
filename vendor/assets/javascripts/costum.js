
var flipTimer;
var $logo;
var showing = false;


function getScroll() {
  scrollDistance = $(window).scrollTop();
}



function fancyNav() {
  scrollDistance = $(window).scrollTop();

  if (scrollDistance < 50) {
    $('.navbar-nav').css('box-shadow', "0px 1px 5px 0px RGBA(6, 57, 106, 0)" );
  }
  else if (scrollDistance >= 50 && scrollDistance < 100) {
    $('.navbar-nav').css('box-shadow', "0px 1px 5px 0px RGBA(6, 57, 106, 0." + scrollDistance/3 + ")" );
  }
  else {
    $('.navbar-nav').css('box-shadow', "0px 1px 5px 0px RGBA(6, 57, 106, 0.33)" );
  }
  shrinkNav = Math.floor(100 - scrollDistance/4);

  if (shrinkNav > 100) {
    shrinkNav = 100;
    if (showing) {
      showing = false;
      $('.navbar-nav').removeClass("show-shadow");
      $logo.addClass('rotateninety');
      setTimeout(toggleLogoSrc, 400);
    }
  }
  else if (shrinkNav < 25) {
    shrinkNav = 25;
    if (!showing) {
      showing = true;
      $('.navbar-nav').addClass("show-shadow");
      $logo.addClass('rotateninety');
      setTimeout(toggleLogoSrc, 400);
    }
  }
  else {
    if (showing) {
      showing = false;
      $('.navbar-nav').removeClass("show-shadow");
      $logo.addClass('rotateninety');
      setTimeout(toggleLogoSrc, 400);
    }
  }

  $('.navbar-nav img').css('width', shrinkNav + '%');
  var vw = (4.5*(shrinkNav/100)) + 'vw';
}

function ScrollStart() {
  fancyNav();
}

function Scroll() {
  fancyNav();
}



function flipLogoBack() {
  $logo.removeClass('rotateninety');
}
function toggleLogoSrc() {
  var src = $logo.attr('src');
  if (src === "/assets/1M_clinic_logo_light.png") {
    $logo.attr({ src: "/assets/1M_clinic_logo.png"});
  } else {
    $logo.attr({ src: "/assets/1M_clinic_logo_light.png" });
  }
}


$(window).scroll(function() {
  if (windowWidth > 992) {
    fancyNav();
    navLogoHeight = $('.nav-logo').outerHeight( );
    $('.navbar-nav li').css('margin-top', navLogoHeight/1.7);
    $('.navbar-nav li').css('margin-bottom', navLogoHeight/1.8);
    $('.nav-logo').css('margin-top', (navLogoHeight/3)/2.25).css('margin-bottom', 0);
  }



});

$(document).ready(function($) {
  $logo = $('.leodis-nav-logo');


  if (windowWidth > 992) {
    var navLogoHeight = $('.nav-logo').outerHeight( );
    $('.navbar-nav li').css('margin-top', navLogoHeight/1.7);
    $('.navbar-nav li').css('margin-bottom', navLogoHeight/1.8);
    $('.nav-logo').css('margin-top', (navLogoHeight/3)/2.25).css('margin-bottom', 0);
  }


  if (windowWidth > 992) {
    $logo.load(function() {
      flipLogoBack();
    });
  }


});

$(window).on("resize", function() {
  navLogoHeight = $('.nav-logo').outerHeight( );
  $('.navbar-nav li').css('margin-top', navLogoHeight/1.7);
  $('.navbar-nav li').css('margin-bottom', navLogoHeight/1.8);
  $('.nav-logo').css('margin-top', (navLogoHeight/3)/2.25).css('margin-bottom', 0);

  if (windowWidth > 992) {
    fancyNav();
  }

});
var windowWidth = $(window).outerWidth();