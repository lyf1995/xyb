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
		});
	$('#logo-right-ul li').eq(1).hover(
		function(){
			$('#logo-right-child-ul').stop(true,false).slideDown(300);
			$(this).children('img').attr('src','../../images/up2.png');
		},function(){
			$('#logo-right-child-ul').stop(true,false).slideUp(300);
			$(this).children('img').attr('src','../../images/down2.png');
		}
	);
	/*固定状态栏*/
	var status=$('.status');
	$(window).scroll(function(){
		if($(window).scrollTop()>=120)
		{
			status.addClass('fixstatus');
			$('#com-info').addClass('fixtop');
		}
		else
		{
			status.removeClass('fixstatus');
			$('#com-info').removeClass('fixtop');
		}
	});

	//返回
	$('#return').on('click',function(){
		var recruitId=$(this).data('recruitid');
		window.location.href="lookApply.html?recruitId="+recruitId;
	});
	
	//弹出同意对接dialog
	$('#agree').click(function(){
		var recruitId=$(this).data('recruitid');
		var companyId=$(this).data('companyid');
		$('#btn-dialogBox').dialogBox({
			width: 300,
			height: 250,
			hasClose: true,
			hasBtn: true,
			confirmValue: '确定',
			confirm:function(){
				$.ajax({
					url:'recruitStatus.html',
					type:'GET',
					dataType:'json',
					data:{'recruitId':recruitId,'companyId':companyId,'recruitStatus':'同意对接'},
					success:function(data){
						$('#nowRecruitStatus').html('公司状态：'+data.status);
						alert('设置成功');
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
			content: '确定是否将该公司设置为同意对接？'
		});
	});


	//弹出不合适dialog
	$('#Inappropriate').click(function(){
		var recruitId=$(this).data('recruitid');
		var companyId=$(this).data('companyid');
		$('#btn-dialogBox').dialogBox({
			width: 300,
			height: 250,
			hasClose: true,
			hasBtn: true,
			confirmValue: '确定',
			confirm:function(){
				$.ajax({
					url:'recruitStatus.html',
					type:'GET',
					datatype:'json',
					data:{'recruitId':recruitId,'companyId':companyId,'recruitStatus':'不合适'},
					success:function(data){
						$('#nowRecruitStatus').html('公司状态：'+data.status);
						alert('设置成功');
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
			content: '确定是否将该公司设置为不合适？'
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
			data:{'sendId':schId,'receiveId':comId},
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
	$('#callCompany').on('click',function(){
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
			data:{'sendId':schId,'receiveId':comId,'content':content},
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