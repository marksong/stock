var pageSize = 10;
var pageNo = 1;
var totalPage;
var GenericIds;
var cond = {};
$(function(){
	$('.returnBackBtn').on('click', function(){
		window.location.href = '../index';
	});
	//cookie的语言切换
	$('.lang').on('click', function(){
		var locate = '__I18N_LOCALE__';
		var lang = $(this).attr('language');
		if(lang == $.cookie(locate))return ;
		$.cookie(locate,lang);
		window.location.reload();
	});
	$('#isoBtn').on('click', function(){
		$('#imgBox').empty()
		.append('<img src="../static/front/img/iso_en.jpg" width="100%"/>')
		.append('<img src="../static/front/img/iso_zh.jpg" width="100%"/>');
	});
	$('#tsBtn').on('click', function(){
		$('#imgBox').empty()
		.append('<img src="../static/front/img/ts.jpg" width="100%"/>');
	});
	$('#pedBtn').on('click', function(){
		$('#imgBox').empty()
		.append('<img src="../static/front/img/ped_1.jpg" width="100%"/>')
		.append('<img src="../static/front/img/ped_2.jpg" width="100%"/>');
	});
	
});
