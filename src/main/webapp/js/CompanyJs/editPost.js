$(function(){

	/*header*/
	var oExtImg=$('a.a-ext').children('img');
	var oInfoImg=$('a.a-info').children('img');
	var oSetImg=$('a.a-set').children('img');
	$('a.a-ext').hover(
		function(){
			$(this).removeClass('out');
			$(this).addClass('over');
			oExtImg.remove();
		},
		function(){
			oExtImg.prependTo($('a.a-ext'));
			$(this).removeClass('over');
			$(this).addClass('out');
	});
	$('a.a-info').hover(
		function(){
			$(this).removeClass('out');
			$(this).addClass('over');
			oInfoImg.remove();
		},
		function(){
			$(this).removeClass('over');
			$(this).addClass('out');
			oInfoImg.prependTo($('a.a-info'));
	});
	$('a.a-set').hover(
		function(){
			$(this).removeClass('out');
			$(this).addClass('over');
			oSetImg.remove();
		},
		function(){
			$(this).removeClass('over');
			$(this).addClass('out');
			oSetImg.prependTo($('a.a-set'));
	});
	$('div.a-wel').hover(
		function(){
			$(this).removeClass('out-up');
			$(this).addClass('over-down');
			$(this).children('ul').css('display','block');
			$(this).children('img').attr('src','../../images/up.png');
		

		},
		function(){
			$(this).removeClass('over-down');
				$(this).addClass('out-up');
			$(this).children('ul').css('display','none');
			$(this).children('img').attr('src','../../images/down.png');
		}
	);
	$('#logo-right-ul li').eq(1).hover(
		function(){
			$('#logo-right-child-ul').stop(true,false).slideDown(300);
			$(this).children('img').attr('src','../../images/up2.png');
		},function(){
			$('#logo-right-child-ul').stop(true,false).slideUp(300);
			$(this).children('img').attr('src','../../images/down2.png');
		}
	)



	//addDiv
	$('div.addDiv').click(function(){
		//岗位福利
		if($(this).hasClass('gwfl')){
			var addBox=$(this).prev('.add-box');
			var childNum=addBox.children().length;
			var n=0;
			$.each(addBox.find('input'),function(index,value){
				if($(this).val()==''||$(this).val()==null)
					n++;
			});
			if(n===0){
				var addItem=$('<div class="add-item"></div>');
				var label=$('<label><label>');
				label.html(childNum+1+'.');
				var input=$('<input class="form form-control">');
				addItem.append(label);
				addItem.append(input);
				addBox.append(addItem);
			}
			else{
				alert('您还有未编辑过的内容');
			}
			
		}

		//岗位职责
		else if($(this).hasClass('gwzz')){
			var addBox=$(this).prev('.add-box');
			var childNum=addBox.children().length;
			var n=0;
			$.each(addBox.find('input'),function(index,value){
				if($(this).val()==''||$(this).val()==null)
					n++;
			});
			if(n===0){
				var addItem=$('<div class="add-item"></div>');
				var label=$('<label><label>');
				label.html(childNum+1+'.');
				var input=$('<input class="form form-control">');
				addItem.append(label);
				addItem.append(input);
				addBox.append(addItem);
			}
			else{
				alert('您还有未编辑过的内容');
			}
		}

		//岗位要求
		else{
			var addBox=$(this).prev('.add-box');
			var childNum=addBox.children().length;
			var n=0;
			$.each(addBox.find('input'),function(index,value){
				if($(this).val()==''||$(this).val()==null)
					n++;
			});
			if(n===0){
				var addItem=$('<div class="add-item"></div>');
				var label=$('<label><label>');
				label.html(childNum+1+'.');
				var input=$('<input class="form form-control">');
				addItem.append(label);
				addItem.append(input);
				addBox.append(addItem);
			}
			else{
				alert('您还有未编辑过的内容');
			}
		}
	});

	$('#post-form').submit(function(){
		//岗位福利
		var addDiv=$('div.gwfl');
		var addBox=addDiv.prev('.add-box');
		var gwflStr='';
		for(var i=0;i<addBox.find('input').length;i++)
		{
			if(addBox.find('input').eq(i).val()==''){
				addBox.find('input').eq(i).remove();
			}
		}
		for(var i=0;i<addBox.find('input').length;i++){
			if(addBox.find('input').eq(i).val()!=''){
				if(i==addBox.find('input').length-1){
					gwflStr=gwflStr+addBox.find('input').eq(i).val();
				}
				else{
					gwflStr=gwflStr+addBox.find('input').eq(i).val()+'&&';
				}
			}
			
		}
		$('input[name=gwfl]').val(gwflStr);

		//岗位职责
		var addDiv=$('div.gwzz');
		var addBox=addDiv.prev('.add-box');
		var gwzzStr='';
		for(var i=0;i<addBox.find('input').length;i++)
		{
			if(addBox.find('input').eq(i).val()==''){
				addBox.find('input').eq(i).remove();
			}
		}
		for(var i=0;i<addBox.find('input').length;i++){
			if(addBox.find('input').eq(i).val()!=''){
				if(i==addBox.find('input').length-1){
					gwzzStr=gwzzStr+addBox.find('input').eq(i).val();
				}
				else{
					gwzzStr=gwzzStr+addBox.find('input').eq(i).val()+'&&';
				}
			}
		}
		$('input[name=gwzz]').val(gwzzStr);


		//岗位要求
		var addDiv=$('div.gwyq');
		var addBox=addDiv.prev('.add-box');
		var gwyqStr='';
		for(var i=0;i<addBox.find('input').length;i++)
		{
			if(addBox.find('input').eq(i).val()==''){
				addBox.find('input').eq(i).remove();
			}
		}
		for(var i=0;i<addBox.find('input').length;i++){
			if(addBox.find('input').eq(i).val()!=''){
				if(i==addBox.find('input').length-1){
					gwyqStr=gwyqStr+addBox.find('input').eq(i).val();
				}
				else{
					gwyqStr=gwyqStr+addBox.find('input').eq(i).val()+'&&';
				}
			}
		}
		$('input[name=gwyq]').val(gwyqStr);
	});
	
	//显示原来的信息
	function showOldInfo(name){
		var oldInfo=$('input[name='+name+']').val();
		var oldInfoArry=oldInfo.split("&&");
		var addBox=$('div.'+name+'').prev('.add-box');
		$.each(oldInfoArry,function(index){
			var addItem=$('<div class="add-item"></div>');
			var label=$('<label><label>');
			label.html(index+1+'.');
			var input=$('<input class="form form-control" value="'+oldInfoArry[index]+'">');
			addItem.append(label);
			addItem.append(input);
			addBox.append(addItem);
		});
	}
	showOldInfo("gwfl");
	showOldInfo("gwzz");
	showOldInfo("gwyq");

});