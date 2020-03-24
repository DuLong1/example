layui.config({
	base : "layui/js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	

	//添加组织架构
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$(".newsAdd_btn").click(function(){
			var index = layui.layer.open({
				title : "添加试卷",
				type : 2,
				area: ['600px', '500px'],
				content : "edit.action",
			});			
		});
		
		$(".news_edit").click(function(){
			var orgId=$(this).attr("data-id");
			var index = layui.layer.open({
				title : "查看试卷详情",
				type : 2,
				area: ['500px', '400px'],
				content : "look.action?id="+orgId,
			});		
			layui.layer.full(index);
		});
		
	}).resize();
	
	//删除
	$("body").on("click",".news_del",function(){  //删除
		var id=$(this).attr("data-id");
		layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
			//_this.parents("tr").remove();
			document.location ="paper/delete.action?id="+id;
			layer.close(index);
		})
	});
	

	//批量删除
	$(".batchDel").click(function(){
		var $checkbox = $('.news_list tbody input[type="checkbox"][name="ids"]');
		var $checked = $('.news_list tbody input[type="checkbox"][name="ids"]:checked');
		
		if($checkbox.is(":checked")){
			layer.confirm('确定删除选中的信息？',{icon:3, title:'提示信息'},function(index){
				var index = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
	            setTimeout(function(){
	            	var url="deletes.action?ids=";
	            	//删除数据
	            	for(var j=0;j<$checked.length;j++){
	            		if(j==$checked.length-1){
	            			url+=$checked.eq(j).parents("tr").find(".news_del").attr("data-id");
	            		}else{
	            			url+=$checked.eq(j).parents("tr").find(".news_del").attr("data-id")+"&ids="
	            			
	            		}
	            	}
	            	document.location=url;
	            	$('.news_list thead input[type="checkbox"]').prop("checked",false);
	            	form.render();
	                layer.close(index);
					layer.msg("删除成功");
	            },2000);
	        })
		}else{
			layer.msg("请选择需要删除的文章");
		}
	})

	//全选
	form.on('checkbox(allChoose)', function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		child.each(function(index, item){
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});

	//通过判断文章是否全部选中来确定全选按钮是否选中
	form.on("checkbox(choose)",function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked')
		if(childChecked.length == child.length){
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
		}else{
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
		}
		form.render('checkbox');
	})

	
 
	//操作
	
})
