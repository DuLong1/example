$(function(){
	
	(function() {
		$('.banner').flexslider({
		animation: 'slide',                 // 必备参数，自动滑动
        animationLoop: true,           // 是否循环滑动，默认为 true
         itemWidth: 500,                  // 定义每个 item 宽度，单位为 px，默认为 100%
         itemMargin: 0,                     // 定义每个 item margin，默认为 0
         controlNav: false,                // 是否显示滑动控制小圆点，默认为 true
        directionNav: false,               // 是否显示左右滑动控制控件，默认为 true
        slideshowSpeed: 2000,        // 每次自动滑动间隔时间，默认为 7000，单位为 ms
         animationSpeed: 500           // 手动点击滑动时间，默认为 600，单位为 ms
		});
	});
	// 首页轮播
	$(".content-wp .banner .play-nav li").bind("click",function(event){
		$(".content-wp .banner .play-nav li").removeClass("cur");
		$(this).addClass("cur");
		
		$(".content-wp .banner .banner-list li").css("z-index","1");
		$(".content-wp .banner .banner-list a[data-index='"+$(this).find("a").text()+"']").parent().css("z-index","9");
		event.stopPropagation();
	});
})