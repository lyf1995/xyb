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
	});
	
	//弹出dialog
	$('.applyRecruit').click(function(){
		var recruitId=$('#recruitId').val();
		var nowThis=$(this);
		$('#btn-dialogBox').dialogBox({
			width: 300,
			height: 250,
			hasClose: true,
			hasBtn: true,
			confirmValue: '确定',
			confirm:function(){
				$.ajax({
					url:'applyRecruit.html',
					type:'GET',
					data:'recruitId='+recruitId,
					success:function(data){
						nowThis.off('click');
						nowThis.attr('class','btn btn-has');
						nowThis.html('已经申请');
						alert(data);
					},
					beforeSend:function(){
					$('body').loading({
						loadingWidth:240,
						title:'请稍等!',
						name:'test',
						discription:'',
						direction:'column',
						type:'origin',
						// originBg:'#71EA71',
						originDivWidth:40,
						originDivHeight:40,
						originWidth:6,
						originHeight:6,
						smallLoading:false,
						loadingMaskBg:'rgba(0,0,0,0.2)'
						});
					},
					complete : function(){
						removeLoading('test');
					}
					
				});
			},
			cancelValue: '取消',
			cancel:function(){
				
			},
			title: '注意',
			content: '确定是否申请校招？'
		});
	});	
	
   //在线聊天
	
	var userId=$('#userId').val();
	var schId=$('#schId').val();
	var comId=$('#comId').val();
	
	
	function getContact(){
		console.log('userId:'+userId+'schId:'+schId+'comId:'+comId);
		$.ajax({
			url:'getContacts.html',
			type:'GET',
			dataType:'json',
			data:{'sendId':comId,'receiveId':schId,type:3},
			success:function(data){
				$('.modal-body').empty();
				$.each(data,function(i,item){
					if(item.sendUserId==userId){
						var div=$('<div></div>');
						div.addClass('clearfix');
						var span=$('<span>'+item.content+'</span>');
						span.addClass('modal-right');
						div.append(span);
						var img=$('<img src="'+item.sendPic+'"/>');
						img.addClass('img-right');
						span.before(img);
						$('.modal-body').append(div);
					}
					else{
						var div=$('<div></div>');
						div.addClass('clearfix');
						var span=$('<span>'+item.content+'</span>');
						span.addClass('modal-left');
						div.append(span);
						var img=$('<img src="'+item.receivePic+'"/>');
						img.addClass('img-left');
						span.before(img);
						$('.modal-body').append(div);
					}
				});
				$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
			}
		});
	};
	var interval=null;
	$('#callSchool').on('click',function(){
		getContact();
		interval=setInterval(getContact,1000);
	});
	$('.close').on('click',function(){
		clearInterval(interval);
	});

	$('#send').on('click',function(){
		var content=$('#content').val();
		$.ajax({
			url:'sendContacts.html',
			type:'POST',
			dataType:'json',
			data:{'sendId':comId,'receiveId':schId,'content':content,type:3},
			success:function(data){
				var div=$('<div></div>');
				div.addClass('clearfix');
				var span=$('<span>'+content+'</span>');
				span.addClass('modal-right');
				div.append(span);
				var img=$('<img src="'+data+'"/>');
				img.addClass('img-right');
				span.before(img);
				$('.modal-body').append(div);
				$('.modal-body').scrollTop($('.modal-body')[0].scrollHeight);
				$('#content').val('');
			}
		});
	});
});