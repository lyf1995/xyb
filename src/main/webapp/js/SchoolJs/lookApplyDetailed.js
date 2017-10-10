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

	$(document).ajaxStart(function(){
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
	}).ajaxStop(function(){
		removeLoading('test');
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
				$.get('recruitStatus.html',{'recruitId':recruitId,'companyId':companyId,'recruitStatus':'同意对接'},
					function(data){
					$('#nowRecruitStatus').html('公司状态：'+data.status);
					alert('设置成功');
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
				$.get('recruitStatus.html',{'recruitId':recruitId,'companyId':companyId,'recruitStatus':'不合适'},
						function(data){
						$('#nowRecruitStatus').html('公司状态：'+data.status);
						alert('设置成功');
					});
			},
			cancelValue: '取消',
			cancel:function(){
				
			},
			title: '注意',
			content: '确定是否将该公司设置为不合适？'
		});
	});
});