var jQT = new $.jQTouch({
  icon:'apple-touch-icon.png',
  //addGlossToIcon: false,
  startupScreen:"apple-touch-startup.png",
  statusBar:'black-translucent',
  slideSelector: '#jqt li a, slide',
  preloadImages:[
    '/jqtouch/themes/jqt/img/back_button.png',
    '/jqtouch/themes/jqt/img/back_button_clicked.png',
    '/jqtouch/themes/jqt/img/button_clicked.png',
    '/jqtouch/themes/jqt/img/grayButton.png',
    '/jqtouch/themes/jqt/img/whiteButton.png',
    '/jqtouch/themes/jqt/img/loading.gif'
  ],
  statusBar: 'black-translucent',
  useAnimations: false,
  //formSelector: false, //not enabling Ajax
	cacheGetRequests: false  
});

$(window).bind('load orientationchange', function(){
  $('#jqt').removeClass('profile landscape').addClass(Math.abs(window.orientation) == 90 ? 'landscape' : 'profile');
  scrollTo(0,0);
});
