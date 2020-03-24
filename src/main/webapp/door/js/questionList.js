$(function(){

	// 问题列表
	$(".quelist-wrap .question-box").bind("mouseover",function(event){
		$(this).addClass("hover-quescontainer");
		$(this).find(".view-analyse").find(".view-link").css("color","#11a68d!important");
		event.stopPropagation();
	}).bind("mouseleave",function(event){
		$(this).removeClass("hover-quescontainer");
		$(this).find(".view-analyse").find(".view-link").css("color","#11a68d!important");
		event.stopPropagation();
	});
	
	$(".question-box").bind("click",function(event){
		$(".quelist-wrap").css("left","0px");
		$(".question-box").removeClass("selected-quescontainer");
		$(this).addClass("selected-quescontainer");
		$(".queanalyse-wrap").show(800);
		$(".queanalyse-wrap").css("left", (document.body.clientWidth - 1200) / 2 + $('.question-box').width()+ 20);
		var dataIndex = $(this).attr("data-index");
		$.ajax({
			type : "get", 
			url : mainHttp + "question/getQuestion/" + $(this).attr("data-id")+ ".html",
			async : true,
			dataType : "json",
			success : function(data) {// 返回数据根据结果进行相应的处理,无论请求成功还是失败，都会走这个方法的
				$(".dt-index").text(dataIndex);
				$(".ui-border-top .center-li .current").text(dataIndex);
				$(".exam-answer-content").html(data.result.answer);
				$(".exam-analysis-content").html(data.result.analysis);
			}
		});
	});
	
	$(".queanalyse-wrap .close-btn").bind("click",function(event){
		$(".queanalyse-wrap").hide(200);
		$(".quelist-wrap").css("left","");
		$(".question-box").removeClass("selected-quescontainer");
	});
	
	$(window).scroll(function() {
		if($(window).scrollTop() > 0){
			$('.queanalyse-wrap').css("top", 0);
		}else{
			$('.queanalyse-wrap').css("top", 162);
		}
    });
	
})