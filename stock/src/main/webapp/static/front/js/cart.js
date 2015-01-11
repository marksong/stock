var pageSize = 10;
var pageNo = 1;
var totalPage;
var GenericIds;
var cond = {};
$(function(){
	$('#prepareSend').on('click', function(e){
		var arr = new Array();
		var lang = $.cookie('__I18N_LOCALE__');
		//组装选中的数据
		$('input[name=total]').each(function(e){
			if($(this).parents('tr').find('input[name=select]').is(':checked')){
				if(!$(this).attr('hasError')){
					var obj = new Object();
					obj.id = $(this).attr('forId');
					obj.stock = $(this).attr('stock');
					obj.book = $(this).val();
					arr.push(obj);
				}
			}
		});
		if(arr.length > 0){
			$.layer({
			    type: 1,
			    shade: [0],
			    area: ['auto', 'auto'],
			    title: false,
			    border: [0],
			    page: {dom : '.layerBox'}
			});
		} else {
			alert(lang == 'en' ? 'Choose products for sending!':'选择要发送的产品!');
		}
	});
	$('#btn_send').on('click', function(){
		var send = true;
		var lang = $.cookie('__I18N_LOCALE__');
		var arr = new Array();
		for(var i = 0 ; i < $('.corpInfo').length ; i++){
			if($('.corpInfo').eq(i).val() == ''){
				send = false;
				break;
			}
		}
		if(send){
			$('input[name=total]').each(function(e){
				if($(this).parents('tr').find('input[name=select]').is(':checked')){
					if(!$(this).attr('hasError')){
						var obj = new Object();
						obj.id = $(this).attr('forId');
						obj.stock = $(this).attr('stock');
						obj.book = $(this).val();
						arr.push(obj);
					}
				}
			});
			$.ajax({
				url		:	'sendMail',
				type	:	'post',
				data	:	{
					json:JSON.stringify(arr),
					corpName:$('input[name=corpName]').val(),
					corpAddr:$('input[name=corpAddr]').val(),
					telephone:$('input[name=telephone]').val(),
					mail:$('input[name=mail]').val(),
					contactName:$('input[name=contactName]').val()
				},
				dataType:	'json',
				success	:	function(data){
					if(data == 1){
						alert(lang == 'en' ? 'Send success!':'邮件发送成功!');
						layer.closeAll();
					} else {
						alert(lang == 'en' ? 'Send faild!':'邮件发送失败!');
					}
				}
			});
		} else 
			alert(lang == 'en' ? 'Have messages that not be written!':'还有未填写的信息！');
			
	});
	
	
	$('.returnBackBtn').on('click', function(){
		window.location.href = 'index';
	});
	//购物车表格构造
	var initCartContent = function(data){
		var lang = $.cookie('__I18N_LOCALE__');
		if(data.length > 0){
			//构造身子
			var $body = $('<tbody></tbody>');
			for(var i = 0 ; i < data.length ; i++){
				var $gloable = $('<tr '+ (i%2 == 0 ? 'class="odd"':'') +'></tr>');
				var $td = $('<td></td>');
				$('<input type="checkbox" value="'+ data[i].id +'" name="select" checked="checked"/>').on('click', function(){
					var $input = $(this).parents('tr').find('[name=total]');
					if($input.attr('hasError') || $input.val() == ''){
						$(this).prop('checked',false);
					}
				}).appendTo($td);
				$gloable.append($td)
				.append('<td>'+ data[i].name +'</td>')
				.append('<td>'+ data[i].product_standards +'</td>')
				.append('<td>'+ data[i].material +'</td>')
				.append('<td>'+ data[i].outer_diameter +'</td>')
				.append('<td>'+ data[i].wall_thickness +'</td>')
				.append('<td>'+ data[i].stock +'</td>');
				var $inputTd = $('<td></td>');
				$('<input name="total" style="width:60px;" value="1" forId="'+ data[i].id +'" stock="'+ data[i].stock +'" type="text" />').on('keyup afterpaste', function(e){
					$(this).val($(this).val().replace(/\D/g,''));
					var isOdd = $(this).parents('tr').hasClass('odd');
					$(this).removeAttr('hasError');
					if($(this).val() == ''){
						$(this).attr('hasError','1').parent().css('background-color', isOdd ? '#f0fdfa':'white');
					} else {
						var v = eval($(this).val());
						var stock = eval($(this).attr('stock'));
						$(this).parent().css('background-color', v > 0 && v <= stock   ? (isOdd ? '#f0fdfa':'white'):'red');
						if(v > stock){
							alert(lang == 'en' ? 'Over the stock of this product,please reset!':'超过库存量，请重新输入!');
							$(this).val('').parent().css('background-color',isOdd ? '#f0fdfa':'white');							
						} else if(v == 0){
							alert(lang == 'en' ? 'Stock must over zero,please reset!':'库存量须大于0，请重新输入!');
							$(this).val('').parent().css('background-color',isOdd ? '#f0fdfa':'white');							
						}
					}
				}).appendTo($inputTd);
				//增加删除按钮列
				var $delete = $('<td></td>');
				$('<button class="added" forId="'+ data[i].id +'">'+ (lang == 'en' ? 'delete':'删除') +'</button>').on('click', function(){
					if(confirm(lang == 'en' ? 'Confirm to delete the product?':'确认删除该产品吗？')){
						$.post('removeItem',{id:$(this).attr('forId')}, $.proxy(function(data){
							if(data == 1)
								$(this).parents('tr').remove();
							
						},this));
					}
				}).appendTo($delete);
				$gloable.append($inputTd).append($delete).appendTo($body);
			}
			$('#cartTable').append($body);
		}
		
	};
	$.post('viewCart',{},initCartContent);
	//cookie的语言切换
	$('.lang').on('click', function(){
		var locate = '__I18N_LOCALE__';
		var lang = $(this).attr('language');
		if(lang == $.cookie(locate))return ;
		$.cookie(locate,lang);
		window.location.reload();
	});
});
