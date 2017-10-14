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

	/*固定侧边栏*/
	var nav=$('#middle-left');
	var right=$('#middle-right');
	$(window).scroll(function(){
		if($(window).scrollTop()>=120)
		{
			nav.addClass('fixednav');
			right.addClass('fixedright');
		}
		else
		{
			nav.removeClass('fixednav');
			right.removeClass('fixedright');
		}
	});


	/*固定侧边栏未创建状态*/
	isCreate('jbxxSide','isCreate');
	isCreate('qzyxSide','isCreate');
	isCreate('grjjSide','isCreate');
	isCreate('xmjySide','isCreate');
	isCreate('xnzwSide','isCreate');
	isCreate('yynlSide','isCreate');

	function isCreate(id,isclass){
		var spans=$('#'+id).find('span.'+isclass);
		var n=0;
		$.each(spans,function(){
			if($(this).html()!=='')
				n++;
		});
		if(n!=0)
		{	
			id=id.split('S')[0];
			$('#middle-left ul li').find('span#'+id).removeClass('no-create').addClass('create').html('');
		}
		else{
			id=id.split('S')[0];
			$('#middle-left ul li').find('span#'+id).removeClass('create').addClass('no-create').html('未创建');
		}
	}


	/*侧边栏进度条*/
	(function progress(){
		var spans=$('#middle-left ul li').find('span');
		var all=spans.length;
		var isCreate=spans.filter('.create').length;
		var progress=$('.progress-bar');
		var pro_span=$('.pro-span');
		var value=(isCreate/all).toFixed(2)*100+'%';
		progress.css('width',value);
		pro_span.html(value);
	})();


	/*固定状态栏*/
	var status=$('.status');
	$(window).scroll(function(){
		if($(window).scrollTop()>=120)
		{
			status.addClass('fixstatus');
			$('#jbxxSide').addClass('fixtop');
		}
		else
		{
			status.removeClass('fixstatus');
			$('#jbxxSide').removeClass('fixtop');
		}
	});

	//返回
	$('#return').on('click',function(){
		var postId=$(this).data('postid');
		window.location.href="lookApply.html?postId="+postId;
	});
	
	//弹出通知面试dialog
	$('#interview').click(function(){
		var postId=$(this).data('postid');
		var studentId=$(this).data('studentid');
		$('#btn-dialogBox').dialogBox({
			width: 300,
			height: 250,
			hasClose: true,
			hasBtn: true,
			confirmValue: '确定',
			confirm:function(){
				$.ajax({
					url:'postStatus.html',
					type:'GET',
					dataType:'json',
					data:{'studentId':studentId,'postId':postId,'postStatus':'通知面试'},
					success:function(data){
						$("#nowPostStatus").children('span').eq(0).html("简历状态："+data.status);
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
			content: '确定是否将此简历设置为通知面试？'
		});
	});


	//弹出不合适dialog
	$('#Inappropriate').click(function(){
		var postId=$(this).data('postid');
		var studentId=$(this).data('studentid');
		$('#btn-dialogBox').dialogBox({
			width: 300,
			height: 250,
			hasClose: true,
			hasBtn: true,
			confirmValue: '确定',
			confirm:function(){
				$.ajax({
					url:'postStatus.html',
					type:'GET',
					dataType:'json',
					data:{'studentId':studentId,'postId':postId,'postStatus':'不合适'},
					success:function(data){
						$("#nowPostStatus").children('span').eq(0).html("简历状态："+data.status);
						alert("设置成功");
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
			content: '确定是否将此简历设置为不合适？'
		});
	});
	
	
	//在线聊天
	
	var userId=$('#userId').val();
	var stuId=$('#stuId').val();
	var comId=$('#comId').val();
	
	
	function getContact(){
		console.log('userId:'+userId+'stuId:'+stuId+'comId:'+comId);
		$.ajax({
			url:'getContacts.html',
			type:'GET',
			dataType:'json',
			data:{'sendId':comId,'receiveId':stuId,type:1},
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
	$('#callStudent').on('click',function(){
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
			data:{'sendId':comId,'receiveId':stuId,'content':content,type:1},
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
	
})