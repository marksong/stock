var pageSize = 10;
var pageNo = 1;
var totalPage;
var GenericIds;
var cond = {};
$(function(){
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
			if(data.level4.length > 0){
				$('#level4').empty();
				for(var i = 0 ; i < data.level4.length ; i++){
					var $span = $('<span class="item" itemId="'+ data.level4[i].id +'">'+ data.level4[i].text +'</span>');
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
//						if(cond.level5)
//							ids += (cond.level5+',');
//						if(cond.level6)
//							ids += (cond.level6+',');
						var id = eval($(this).attr('itemId'));
						ids += (id+',');
						ids = ids.substring(0, ids.length-1);
						cond.level4 = id;
						cond.level5 = null;
						cond.level6 = null;
						$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
							loadProducts(data);
							load456Level();
						});							
					}).appendTo('#level4');
				}
				$('#level4').append('<span class="clearfix"></span>');
			}
			if (data.level5.length > 0) {
				$('#level5').empty();
				for(var i = 0 ; i < data.level5.length ; i++){
					$('<span class="item" itemId="'+ data.level5[i].id +'">'+ data.level5[i].text +'</span>').on('click', function(){
						$('#level5 .item').removeClass('active');
						$(this).addClass('active');
						//树状条件
						var ids = '';
						if(GenericIds){
							for(var i = 0 ; i < GenericIds.length ; i++){
								ids += (GenericIds[i] + ',');				
							}
						}
						if(cond.level4)
							ids += (cond.level4+',');
						//横向条件
						var id = eval($(this).attr('itemId'));
						ids += (id+',');
						ids = ids.substring(0, ids.length-1);
						cond.level5 = id;
						cond.level6 = null;
						$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
							loadProducts(data);
							load456Level();	
						});							
					}).appendTo('#level5');
				}
				$('#level5').append('<span class="clearfix"></span>');			
			}
			if (data.level6.length > 0) {
				$('#level6').empty();
				for(var i = 0 ; i < data.level6.length ; i++){
					$('<span class="item" itemId="'+ data.level6[i].id +'">'+ data.level6[i].text +'</span>').on('click', function(){
						$('#level6 .item').removeClass('active');
						$(this).addClass('active');
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
						var id = eval($(this).attr('itemId'));
						ids += (id+',');
						ids = ids.substring(0, ids.length-1);
						cond.level6 = id;
						$.post('loadProducts', {ids:ids,pageno:1,pageSize:pageSize}, function(data){
							loadProducts(data);
							load456Level();
						});							
					}).appendTo('#level6');
				}
				$('#level6').append('<span class="clearfix"></span>');
			}
		});
	}
	//加载产品列表
	var loadProducts = function(data){
		pageNo = data.page.pageNumber;
		if(data.page.totalPage == 0){
			totalPage = 1;
		} else {
			totalPage = data.page.totalPage;
		}
		$('#container').empty();
		var lang = data.language;
		var html = '<table id="productTable">';
		//创建表头
		html += ('<thead>'+
			'<th width=40%>名称</th>'+
			'<th width=25%>材质</th>'+
			'<th width=10%>类型</th>'+
			'<th width=10%>外径</th>'+
			'<th width=15%>皮管厚度</th>'+
		'</thead><tbody>');
		//创建行记录
		var list = data.page.list;
		for(var i = 0 ; i < list.length ; i++){
			html += ('<tr '+ (i%2 != 0 ? '': 'class=odd')  +'>'+
				'<td>'+ list[i]['name_'+lang] +'</td>'+
				'<td>'+ list[i].material +'</td>'+
				'<td>'+ list[i].type +'</td>'+
				'<td>'+ list[i].outer_diameter +'</td>'+
				'<td>'+ list[i].wall_thickness +'</td>'+
			'</tr>');
		}
		html += '</tbody></table>';
		$(html).appendTo('#container');
		var $pagination = $('<div class="page"></div>');
		$('<span style="width:50%;float:left;" class="margin-padding">共'+ 
				data.page.totalRow +'条结果,'+ 
				totalPage + '页,每页'+
				data.page.pageSize +'条记录,当前第'+ 
		 data.page.pageNumber +'页</span>').appendTo($pagination);
		 //分页项
		 $('<span style="float:right;" class="margin-padding '+ (pageNo == totalPage ? 'disable':'next') +'">下一页</span>').on('click', function(){
		 	jumpToPage(pageNo+1);
		 }).appendTo($pagination);
		 $('<span style="float:right;" class="margin-padding '+ (pageNo == 1 ? 'disable':'pre') +'">上一页</span>').on('click', function(){
		 	jumpToPage(pageNo-1);
		 }).appendTo($pagination);
		 $pagination.append('<span class="clearfix"></span>');
		 $($pagination).appendTo('#container');
	};
	var $tree = $('#leftTree');
	var nodes = new Array();
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
});
