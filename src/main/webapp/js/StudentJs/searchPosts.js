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
	$('#logo-right-ul li').eq(2).hover(
		function(){
			$('#logo-right-child-ul').stop(true,false).slideDown(300);
			$(this).children('img').attr('src','../../images/up2.png');
		},function(){
			$('#logo-right-child-ul').stop(true,false).slideUp(300);
			$(this).children('img').attr('src','../../images/down2.png');
		}
	)



	/*searchBox*/
	$(document).click(function(){
		$('div.search-box').find('ul').slideUp();
	});
	$('div.search-box').find('span').click(function(event){
		$(this).next('ul').slideToggle();
		event.stopPropagation();
	});
	$('div.search-box').find('li').click(function(){
		$(this).parent().slideUp();
		$(this).parent().prev('span').html($(this).html());
	});

	$('.post-show-box').hover(function(){
		$(this).find('div.operation-show').stop().slideToggle();
	});
	
	//ajax加载时显示
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
	
	
	//弹出dialog
	$('.postResume').click(function(){
		var postId=$(this).parent().parent().data('postid');
		var nowThis=$(this);
		$('#btn-dialogBox').dialogBox({
			width: 300,
			height: 250,
			hasClose: true,
			hasBtn: true,
			confirmValue: '确定',
			confirm:function(){
				$.ajax({
					url:'postRecume.html',
					type:'GET',
					data:'postId='+postId,
					dataType:'json',
					success:function(data){
						nowThis.attr('class','a-has a-big');
						nowThis.off('click');
						nowThis.html('已经投递');
						alert(data);
					}
					
				});
			},
			cancelValue: '取消',
			cancel:function(){
				
			},
			title: '注意',
			content: '确定是否投递简历？'
		});
	});
});