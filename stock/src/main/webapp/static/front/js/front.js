var pageSize = 10;
var pageNo = 1;
var totalPage;
var GenericIds;
var cond = {};
$(function(){
	//全局变量
	var CART_TAG = "CART";
	var cart = new Array();
	var $tree = $('#leftTree');
	var nodes = [];
	var lang = $.cookie('__I18N_LOCALE__');
	//方法的声明 start
	var jumpToPage = function(no){
		if(no == 0 || no > totalPage) return;
		var ids = '';
		if(GenericIds){
			for(var i = 0 ; i < GenericIds.length ; i++){
				ids += (GenericIds[i] + ',');				
			}
		}
		if(cond.level4)
			ids += (cond.level4+',');
		if(cond.level5)
			ids += (cond.level5+',');
		if(cond.level6)
			ids += (cond.level6+',');
		ids = ids.substring(0, ids.length-1);
		$.post('loadProducts', {ids:ids,pageno:no,pageSize:pageSize}, function(data){
			loadProducts(data);
		});
	};
	var unique = function (arr) {
	    var result = [], hash = {};
	    for (var i = 0, elem; (elem = arr[i]) != null; i++) {
	        if (!hash[elem]) {
	            result.push(elem);
	            hash[elem] = true;
	        }
	    }
	    return result;
	};
	var load456Level = function(){
		var idsStr = '';
		if(GenericIds){
			for(var i = 0 ; i < GenericIds.length ; i++){
				idsStr += (GenericIds[i] + ',');				
			}
		}
		idsStr = idsStr.substring(0, idsStr.length-1);
		var idsCond = '';
		if(cond.level4){
			idsCond += (cond.level4 + ',');
		}	
		if(cond.level5){
			idsCond += (cond.level5 + ',');
		}	
		if(cond.level6){
			idsCond += (cond.level6 + ',');
		}
		idsCond = idsCond.substring(0, idsCond.length-1);
		$.post('load456Level', {ids:idsStr,idsCond:idsCond}, function(data){
			if(data.level4empty){
				$('#level4').empty();
				for(var i = 0 ; i < data.level4.length ; i++){
					var $span = $('<img class="item" itemId="'+ data.level4[i].id +'" src="static/front/img/pro_pic/'+ data.level4[i].text +'.jpg"/>');
					$span.on('click', function(){
						$('#level4 .item').removeClass('active');
						$(this).addClass('active');
						//树状条件
						var ids = '';
						if(GenericIds){
							for(var i = 0 ; i < GenericIds.length ; i++){
								ids += (GenericIds[i] + ',');				
							}
						}
						//横向条件
						if(cond.level5)
							ids += (cond.level5+',');
						if(cond.level6)
							ids += (cond.level6+',');
						var id = eval($(this).attr('itemId'));
						ids += (id+',');
						cond.level4 = id;
						ids = ids.substring(0, ids.length-1);
						$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
							loadProducts(data);
							load456Level();
						});							
					}).appendTo('#level4');
				}
				$('#level4').append('<span class="clearfix"></span>');
			}
			//条件五
			if(data.level5empty){
				$('#outer_diameter').empty().append('<option value="">' + (lang == 'en' ? 'select' : '请选择') + '</option>')
				for (var i = 0; i < data.level5.length; i++) {
					$('<option value="'+ data.level5[i].id +'" ' + ((cond.level5 && cond.level5 == data.level5[i].id) ? 'selected':'') + ' ></option>')
					.text(data.level5[i].text)
					.appendTo('#outer_diameter');
				}
			}			

			//条件6
			if(data.level6empty){
				$('#wall_thickness').empty().append('<option value="">' + (lang == 'en' ? 'select' : '请选择') + '</option>');
				for (var i = 0; i < data.level6.length; i++) {
					$('<option value="'+ data.level6[i].id +'" ' + ((cond.level6 && cond.level6 == data.level6[i].id) ? 'selected':'') + '></option>')
					.text(data.level6[i].text)
					.appendTo('#wall_thickness');
				}
			}			
		});
	}
	var getButton = function(id){
		var btn = '';
		if(id){
			for(var i = 0 ; i < cart.length ; i++){
				if(cart[i].id == id){
					btn += '<button class="added">'+ (lang == 'en' ? 'added' : '已添加') + '</button>';
					break;
				}
			}
			if(btn == ''){
				btn +=('<button class="add"  title="添加到购物车" prdId="'+ id +'">'+ (lang == 'en' ? 'add' : '添加') +'</button>')
			}
		}
		return btn;
	}
	//加载产品列表
	var loadProducts = function(data){
		pageNo = data.page.pageNumber;
		if(data.page.totalPage == 0){
			totalPage = 1;
		} else {
			totalPage = data.page.totalPage;
		}
		var lang = data.language;
		var html = '';
		//创建行记录
		var list = data.page.list;
		for(var i = 0 ; i < list.length ; i++){
			html += ('<tr '+ (i%2 != 0 ? '': 'class=odd')  +'>'+
				'<td>'+ list[i]['name_'+lang] +'</td>'+
				'<td>'+ list[i].material +'</td>'+
				'<td>'+ list[i].outer_diameter +'</td>'+
				'<td>'+ list[i].wall_thickness +'</td>'+
				'<td>'+ getButton(list[i].id) +'</td>'+
			'</tr>');
		}
		$('#container tbody').empty().append(html);
		var $pagination = $('<div class="page"></div>');
		$('.page').empty().append(lang == 'en' ? ('<span style="width:60%;float:left;" class="margin-padding">total:'+ 
				data.page.totalRow +' records,'+ 
				totalPage + ' pages,every page:'+
				data.page.pageSize +' records,current page '+ 
		 		data.page.pageNumber +'</span>') : ('<span style="width:50%;float:left;" class="margin-padding">共'+ 
				data.page.totalRow +'条结果,'+ 
				totalPage + '页,每页'+
				data.page.pageSize +'条记录,当前第'+ 
		 		data.page.pageNumber +'页</span>'));
		 //分页项
		 $('<span style="float:right;" class="margin-padding '+ (pageNo == totalPage ? 'disable':'next') +'">'+ (lang == 'en' ? 'next' : '下一页') +'</span>').on('click', function(){
		 	jumpToPage(pageNo+1);
		 }).appendTo('.page');
		 $('<span style="float:right;" class="margin-padding '+ (pageNo == 1 ? 'disable':'pre') +'">'+ (lang == 'en' ? 'precious' : '上一页') +'</span>').on('click', function(){
		 	jumpToPage(pageNo-1);
		 }).appendTo('.page');
		 $('.page').append('<span class="clearfix"></span>');
	};

	//刷新购物车
	var refreshCart = function(){
		$.post('getCart',{},function(data){
			cart = data;
			if(cart){
				$('#cartTotal').html(lang == 'en' ? ('total:'+cart.length):('总计'+cart.length+'件商品'));
			} else {
				cart = [];
				$('#cartTotal').html(lang == 'en' ? 'total:0':'总计0件商品');
			}
		});	
	};
	//方法的声明 end
	
	
	
	//初始逻辑 start
	//调整购物车的位置
	$('#outer_diameter').on('change', function(){
		//树状条件
		var ids = '';
		if(GenericIds){
			for(var i = 0 ; i < GenericIds.length ; i++){
				ids += (GenericIds[i] + ',');				
			}
		}
		if(cond.level4)
			ids += (cond.level4+',');
		if(cond.level6)
			ids += (cond.level6+',');
		//横向条件
		var id = eval($(this).val());
		if(id){
			ids += (id+',');
			cond.level5 = id;
		} else {
			cond.level5 = null;
		}
		ids = ids.substring(0, ids.length-1);
		$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
			loadProducts(data);
			load456Level();	
		});					
	});
	$('#wall_thickness').on('change', function(){
		//树状条件
		var ids = '';
		if(GenericIds){
			for(var i = 0 ; i < GenericIds.length ; i++){
				ids += (GenericIds[i] + ',');				
			}
		}
		//横向条件
		if(cond.level4)
			ids += (cond.level4+',');
		if(cond.level5)
			ids += (cond.level5+',');
		//追加本条件
		var id = eval($(this).val());
		if(id){
			ids += (id+',');
			cond.level6 = id;
		}else {
			cond.level6 = null;
		}
		ids = ids.substring(0, ids.length-1);
		$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
			loadProducts(data);
			load456Level();
		});					
	});	
	$('#cartModule').animate({'left':$('#bodyWrapper').offset().left+$('#bodyWrapper').width()},1500);
	//拷贝逻辑了
	$.post('getCart',{},function(data){
		cart = data;
		if(cart){
			$('#cartTotal').html(lang == 'en' ? ('total:'+cart.length):('总计'+cart.length+'件商品'));
		} else {
			cart = [];
			$('#cartTotal').html(lang == 'en' ? 'total:0':'总计0件商品');
		}
	});
	//拷贝逻辑了
	// 树
	$tree.jstree({
		plugins		:	['sort', 'types', 'wholerow','state'],
		core		:	{
			multiple		:	false,
			data			:	{
				url		:	'loadChildrenNodes',
				data	:	 function(node){
					//父节点
					var idsArr = new Array();
					for(var i = 0 ; i < node.parents.length ; i++){
						if(node.parents[i] != '#')
							idsArr.push($tree.jstree('get_node',node.parents[i]).data);
					}
					idsArr = unique(idsArr);
					//本节点
					if(node.id != '#'){
						idsArr.push(node.data);
					}
					var str = '';
					for(var i = 0 ; i < idsArr.length ; i++){
						str += ( idsArr[i] +',')
					}
					str = str.substring(0,str.length-1);
					return {ids: str,condition:1};
				}
			}
		},
		check_callback : true,
		themes : {
			responsive : false
		},
		sort		:	function(id1, id2) {
			var a = $tree.jstree('get_node', id1, false);
			var b = $tree.jstree('get_node', id2, false);
			return a.text > b.text ? 1 : -1;
		},
		types 		: {
			'default' : { 'icon' : 'folder' },
			'file' : { 'valid_children' : [], 'icon' : 'file' }
		},
	}).on('select_node.jstree', function(e, data){
		$tree.jstree('open_node',data.node,function(){
			//父节点拼接
			var parents = data.node.parents;
			var ids = '';
			var idsArr = new Array();
			for(var i = 0 ; i < parents.length ; i++){
				if(parents[i] != '#'){
					var id = $tree.jstree('get_node',parents[i]).data;
					idsArr.push(id);
					ids += (id + ',');				
				}
			}
			//本节点
			ids += (data.node.data + ',');
			idsArr.push(data.node.data);
			GenericIds = unique(idsArr);
			ids = ids.substring(0, ids.length-1);
			//判断第一第二层，，，，加载
			if(parents.length < 3){
				$tree.jstree('load_node',data.node, function(){
					
				});
			}
			$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
				loadProducts(data);
			});
			cond = {};
			load456Level();
		});
	});
	load456Level();
	$.post('loadProducts', {ids:null,pageno:1,pageSize:pageSize}, function(data){
		loadProducts(data);
	});
	//添加到购物车按钮的事件绑定
	$(document).on('click', 'button.add', function(){
		$.post('addItem',{id:$(this).attr('prdId')}, $.proxy(function(data){
			if(data == 1){
				refreshCart();
				$(this).unbind().removeClass('add').addClass('added').empty().text(lang == 'en' ? 'added' : '已添加');
			}
		},this));
	}).on('click', 'button.clear' ,function(){
		$.post('clearItems',{},function(){
			window.location.reload();
		});
	}).on('click', 'button.viewCart', function(){
		window.location.href = 'cart';
	});
	//cookie的语言切换
	$('.lang').on('click', function(){
		var locate = '__I18N_LOCALE__';
		var lang = $(this).attr('language');
		if(lang == $.cookie(locate))return ;
		$.cookie(locate,lang);
		window.location.reload();
	});
});
