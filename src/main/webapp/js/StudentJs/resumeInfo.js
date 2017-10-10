$(function(){
	$('.date_picker').date_input();
	//将日期表单中的yyyy-M-d转化为yyyy-MM-dd
	$('#edit-birth').on('change',function(){
		var birth=this.value;
		var birthArr=birth.split("-");
		if(birthArr[1].length<2)
		{
			birthArr[1]='0'+birthArr[1];
		}
		if(birthArr[2].length<2)
		{
			birthArr[2]='0'+birthArr[2];
		}
		var newBirth=birthArr.join("-");
		this.value=newBirth;
	});
	
	//简历附件
	$('.fujianDiv').on('click',function(){
		$('#fujianFile').click();
	});
	function fujianHas(){
		var fujianContainer=$('.fujianContainer');
		if(fujianContainer.children().length==0){
			fujianContainer.addClass('fujianNone');
		}
	}
	fujianHas();

	$('#fujianFile').on('change',function(){
		
		var fujian=$('#fujianFile')[0].files[0];
		
		var formData = new FormData();
		formData.append('fujian',fujian);
		
		$.ajax({
			url:'addfujian.html',
			type:'POST',
			data:formData,
			processData: false,
			contentType: false,
			dataType:'JSON',
			success:function(data){
				var fujianContainer=$('.fujianContainer');
				fujianContainer.removeClass('fujianNone')
				fujianContainer.empty();
				var alink=$('<a href="javascript:;" class="aFujian" title="'+data+'">'+data+'</a>');
				var span=$('<a href="javascript:;" class="deleteFujian" style="position:absolute;right:10px;">删除</a>');
				fujianContainer.append(alink);
				fujianContainer.append(span);		
			}
			
		});
		
	});
	$('.deleteFujian').on('click',function(){
		$.ajax({
			url:'deleteFujian.html',
			type:'GET',
			success:function(data){
				var fujianContainer=$('.fujianContainer');
				fujianContainer.empty();
				fujianContainer.addClass('fujianNone');
			}
		});
	});
	
	//照片
	$('#edit-picture').on('click',function(){
		$('#pictureFile').click();
	});

	$('#pictureFile').on('change',function(){
		var r= new FileReader();
		f=document.getElementById('pictureFile').files[0];
		r.readAsDataURL(f);
		r.onload=function(e){
			document.getElementById('edit-picture').src=this.result;
		};
	});
	
	
	
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
	);
	
	/*jquery1.8以前使用
	$('#loading').ajaxStart(function(){
		$(this).show(1000);
	}).ajaxStop(function(){
		$(this).hide(1000);
	});*/

	/*jquery1.8以后使用*/
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
	
	
	/*基本信息*/
	$('#jbxx-xiugai').on('click',function(){
		$('#jbxx-show').css('display','none');
		$('#jbxx-edit').css('display','block');
		$('#edit-name').val($('#show-name').html());
		$('#edit-birth').val($('#show-birth').html());
		var sex=$('#show-sex').html();
		if(sex=='男')
			$('#edit-male').attr('checked','checked');
		else if(sex=='女')
			$('#edit-fmale').attr('checked','checked');
		else
			$('#edit-male').attr('checked','checked');
		$('#edit-tel').val($('#show-tel').html());
		$('#edit-email').val($('#show-email').html());
		$('#edit-address').val($('#show-address').html());
		$('#edit-school').val($('#show-school').html());
		$('#edit-major').val($('#show-major').html());
	});
	$('#jbxx-edit-btn-cancel').on('click',function(){
		$('#jbxx-show').css('display','block');
		$('#jbxx-edit').css('display','none');
	});
	$('#jbxx-edit-btn-baocun').click(function(){
		var edit_name=$('#edit-name').val();
		var edit_birth=$('#edit-birth').val();
		var sex=$('#edit-male').attr('checked');
		var edit_sex=null;
		if(sex)
			edit_sex='男';
		else
			edit_sex='女';
		var edit_tel=$('#edit-tel').val();
		var edit_email=$('#edit-email').val();
		var edit_address=$('#edit-address').val();
		var edit_school=$('#edit-school').val();
		var edit_major=$('#edit-major').val();
		var edit_picture=$("#pictureFile")[0].files[0];
		
		/*var formData = new FormData();
		formData.append('name',edit_name);
		formData.append('birth',edit_birth);
		formData.append('sex',edit_sex);
		formData.append('tel',edit_tel);
		formData.append('email',edit_email);
		formData.append('address',edit_address);
		formData.append('school',edit_school);
		formData.append('major',edit_major);
		formData.append('picture',edit_picture);*/
		
		var formData = new FormData($('#jbxxForm')[0]);  
		/*$.post('editJbxx.html',
			{
				'name':edit_name,
				'birth':edit_birth,
				'sex':edit_sex,
				'tel':edit_tel,
				'email':edit_email,
				'address':edit_address,
				'school':edit_school,
				'major':edit_major
			},
			function(data){
				$('#show-name').html(edit_name);
				$('#show-birth').html(edit_birth);
				$('#show-sex').html(edit_sex);
				$('#show-tel').html(edit_tel);
				$('#show-email').html(edit_email);
				$('#show-address').html(edit_address);
				$('#show-school').html(edit_school);
				$('#show-major').html(edit_major);

				$('#jbxx-show').css('display','block');
				$('#jbxx-edit').css('display','none');
				isCreate('jbxxSide','isCreate');
				progress();
		});*/
		
		$.ajax({
			url:'editJbxx.html',
			type:'POST',
			data:formData,
			contentType : false,// 告诉jQuery不要去设置Content-Type请求头  
	        processData : false,// 告诉jQuery不要去处理发送的数据  
	        success:function(data){
	        	$('#show-name').html(edit_name);
				$('#show-birth').html(edit_birth);
				$('#show-sex').html(edit_sex);
				$('#show-tel').html(edit_tel);
				$('#show-email').html(edit_email);
				$('#show-address').html(edit_address);
				$('#show-school').html(edit_school);
				$('#show-major').html(edit_major);
				$('#show-picture').attr('src',data);

				$('#jbxx-show').css('display','block');
				$('#jbxx-edit').css('display','none');
				isCreate('jbxxSide','isCreate');
				progress();
	        },
	        error:function(data){
	        	alert('修改失败');
	        }
		});
	});





	/*个人简介*/
	$('#grjj-xiugai').click(function(){
		$('#grjj-show').css('display','none');
		$('#grjj-edit').css('display','block');
		$('#edit-grjj').val($('#show-grjj').text());
	});
	$('#grjj-edit-btn-cancel').click(function(){
		$('#grjj-show').css('display','block');
		$('#grjj-edit').css('display','none');
	});
	$('#grjj-edit-btn-baocun').click(function(){
		var edit_grjj=$('#edit-grjj').val();
		$.post('editGrjj.html','grjj='+edit_grjj,function(data){
			
			$('#show-grjj').text(edit_grjj);

			$('#grjj-show').css('display','block');
			$('#grjj-edit').css('display','none');
			isCreate('grjjSide','isCreate');
			progress();
		});
	});


	/*求职意向*/
	$('#qzyx-xiugai').click(function(){
		$('#qzyx-show').css('display','none');
		$('#qzyx-edit').css('display','block');
		var type=$('#show-Jobtype').html();
		if(type=='实习+就业')
			$('#edit-shixijiuye').attr('checked','checked');
		else if(type=='实习')
			$('#edit-shixi').attr('checked','checked');
		else if(type=='就业')
			$('#edit-jiuye').attr('checked','checked');
		else
		{
			$('#edit-shixijiuye').attr('checked',false);
			$('#edit-shixi').attr('checked',false);
			$('#edit-jiuye').attr('checked',false);
		}
		$('#edit-targetAddress').val($('#show-targetAddress').html());
		$('#edit-post').val($('#show-post').html());
		var salary=$('#show-salary').html().split('/')[0];
		$('#edit-salary').val(salary);
	});
	$('#qzyx-edit-btn-cancel').click(function(){
		$('#qzyx-show').css('display','block');
		$('#qzyx-edit').css('display','none');
	});
	$('#qzyx-edit-btn-baocun').click(function(){
		var edit_targetAddress=$('#edit-targetAddress').val();
		var edit_post=$('#edit-post').val();
		var edit_salary=$('#edit-salary').val();
		var edit_Jobtype=null;
		var typeShixi=$('#edit-shixi').attr('checked');
		var typeJiuye=$('#edit-jiuye').attr('checked');
		var typeShixijiuye=$('#edit-shixijiuye').attr('checked');
		if(typeShixi)
			edit_Jobtype='实习';
		if(typeJiuye)
			edit_Jobtype='就业';
		if(typeShixijiuye)
			edit_Jobtype='实习+就业';

		$.post('editQzyx.html',
			{
				'targetAddress':edit_targetAddress,
				'post':edit_post,
				'salary':edit_salary,
				'type':edit_Jobtype
			},function(data){
				$('#show-Jobtype').html(edit_Jobtype);
				$('#show-targetAddress').html(edit_targetAddress);
				$('#show-post').html(edit_post);
				$('#show-salary').html(edit_salary);

				$('#qzyx-show').css('display','block');
				$('#qzyx-edit').css('display','none');
				
				isCreate('qzyxSide','isCreate');
				progress();
		});
	});




	/*项目经验*/
	$('#xmjy-tianjia').click(function(){
		if($('#xmjy-edit').css('display')=='block')
		{
			alert('请先保存编辑过的信息');
		}
		else{
			$('#xmjy-show').css('display','none');
			$('#xmjy-add').css('display','block');
		}
		
	});
	$('#xmjy-add-btn-cancel').click(function(){
		$('#xmjy-show').css('display','block');
		$('#xmjy-add').css('display','none');
		$('#add-itemStartYear').val(null);
		$('#add-itemStartMonth').val(null);
		$('#add-itemEndYear').val(null);
		$('#add-itemEndMonth').val(null);
		$('#add-itemName').val(null);
		$('#add-itemDuty').val(null);
		$('#add-itemDescribe').val(null);
	});
	
	$('#xmjy-add-btn-tianjia').click(function(){
		var add_itemName=$('#add-itemName').val();
		var add_itemStartYear=$('#add-itemStartYear').val();
		var add_itemStartMonth=$('#add-itemStartMonth').val();
		var add_itemEndYear=$('#add-itemEndYear').val();
		var add_itemEndMonth=$('#add-itemEndMonth').val();
		var add_itemDuty=$('#add-itemDuty').val();
		var add_itemDescribe=$('#add-itemDescribe').val();
		
		$.post('addXmjy.html',
				{
					'itemName':add_itemName,
					'itemStartYear':add_itemStartYear,
					'itemStartMonth':add_itemStartMonth,
					'itemEndYear':add_itemEndYear,
					'itemEndMonth':add_itemEndMonth,
					'itemDuty':add_itemDuty,
					'itemDescribe':add_itemDescribe
				},function(data){
					
					addXmjy(add_itemName,add_itemStartYear,add_itemStartMonth,add_itemEndYear,add_itemEndMonth,add_itemDuty,add_itemDescribe,data);

					$('#xmjy-show').css('display','block');
					$('#xmjy-add').css('display','none');
					$('#add-itemStartYear').val(null);
					$('#add-itemStartMonth').val(null);
					$('#add-itemEndYear').val(null);
					$('#add-itemEndMonth').val(null);
					$('#add-itemName').val(null);
					$('#add-itemDuty').val(null);
					$('#add-itemDescribe').val(null);

					isCreate('xmjySide','isCreate');
					progress();
			
		});
		
	});
	$('#xmjy-edit-btn-cancel').click(function(){
		$('#xmjy-show').css('display','block');
		$('#xmjy-edit').css('display','none');
	});
	$('#xmjy-edit-btn-baocun').click(function(){

		var id=$('#xmjy-edit').find('input[type=hidden]')[0].dataset.xmjyid;
		var edit_itemName=$('#edit-itemName').val();
		var edit_itemStartYear=$('#edit-itemStartYear').val();
		var edit_itemStartMonth=$('#edit-itemStartMonth').val();
		var edit_itemEndYear=$('#edit-itemEndYear').val();
		var edit_itemEndMonth=$('#edit-itemEndMonth').val();
		var edit_itemDuty=$('#edit-itemDuty').val();
		var edit_itemDescribe=$('#edit-itemDescribe').val();

		$.post('editXmjy.html',
					{
						'id':id,
						'itemName':edit_itemName,
						'itemStartYear':edit_itemStartYear,
						'itemStartMonth':edit_itemStartMonth,
						'itemEndYear':edit_itemEndYear,
						'itemEndMonth':edit_itemEndMonth,
						'itemDuty':edit_itemDuty,
						'itemDescribe':edit_itemDescribe
					},function(data){
						var lists=$('#xmjy-show').find('div.xmjy-list');
						for(var i=0;i<lists.length;i++)
						{
							if(lists.eq(i).data('xmjyid')==id)
							{
								lists.eq(i).find('span.show-itemName').html(edit_itemName);
								lists.eq(i).find('span.show-itemDuty').html(edit_itemDuty);
								lists.eq(i).find('span.show-itemDescribe').html(edit_itemDescribe);
								lists.eq(i).find('span.show-itemTime').html(edit_itemStartYear+'-'+edit_itemStartMonth+'~'+edit_itemEndYear+'-'+edit_itemEndMonth);
							}
						}

						$('#xmjy-show').css('display','block');
						$('#xmjy-edit').css('display','none');
			   });
	});

		$('.inline-xiugai1').on('click',editXmjy);
		$('.inline-shanchu1').on('click',deleteXmjy);

		function addXmjy(itemName,itemStartYear,itemStartMonth,itemEndYear,itemEndMonth,itemDuty,itemDescribe,itemId){
		var show_box=$('div.xmjy-show-box');
		var list=$('<div class="xmjy-list clearfix" data-xmjyid='+itemId+'></div>');
		var line1=$('<div class="line-50"></div>');
		var span1=$('<span></span>');
		var show_itemName=$('<span class="show-itemName isCreate">'+itemName+'</span>');

		var line2=$('<div class="line-50"></div>');
		var span2=$('<span></span>');
		var show_itemTime=$('<span class="show-itemTime isCreate">'+itemStartYear+'-'+itemStartMonth+'~'+itemEndYear+'-'+itemEndMonth+'</span>');
		var xiugai=$('<span> 修改</span>');
		xiugai.click(editXmjy);
		var shanchu=$('<span> 删除</span>');
		shanchu.click(deleteXmjy);
		xiugai.addClass('inline-xiugai1');
		shanchu.addClass('inline-shanchu1');

		var line3=$('<div class="line-50"></div>');
		var span3=$('<span></span>');
		var show_itemDuty=$('<span class="show-itemDuty isCreate">'+itemDuty+'</span>');

		var line4=$('<div class="line-100"></div>');
		var span4=$('<span></span>');
		var show_itemDescribe=$('<span class="show-itemDescribe isCreate">'+itemDescribe+'</span>');

		show_box.append(list);

		list.append(line1);
		span1.html('项目名称：');
		line1.append(span1);
		line1.append(show_itemName);

		list.append(line2);
		span2.html('项目时间：');
		line2.append(span2);
		line2.append(show_itemTime);
		line2.append(xiugai);
		line2.append(shanchu);
		
		list.append(line3);
		span3.html('项目职责：');
		line3.append(span3);
		line3.append(show_itemDuty);

		list.append(line4);
		span4.html('项目描述：');
		line4.append(span4);
		line4.append(show_itemDescribe);
	}
	function editXmjy(){
		location.href = "#xmjySide";
		var id=$(this).parent().parent().data('xmjyid');
		$('#xmjy-edit').css('display','block');
		$('#xmjy-show').css('display','none');
		var itemName=$(this).parent().parent().find('span.show-itemName').html();
		var itemDuty=$(this).parent().parent().find('span.show-itemDuty').html();
		var itemDescribe=$(this).parent().parent().find('span.show-itemDescribe').html();

		var time=$(this).parent().parent().find('span.show-itemTime').html();
		var startTime=time.split('~')[0];
		var endTime=time.split('~')[1];

		var itemStartYear=startTime.split('-')[0];
		var itemStartMonth=startTime.split('-')[1];
		var itemEndYear=endTime.split('-')[0];
		var itemEndMonth=endTime.split('-')[1];

		$('#edit-itemName').val(itemName);
		$('#edit-itemDuty').val(itemDuty);
		$('#edit-itemDescribe').val(itemDescribe);
		$('#edit-itemStartYear').val(itemStartYear);
		$('#edit-itemStartMonth').val(itemStartMonth);
		$('#edit-itemEndYear').val(itemEndYear);
		$('#edit-itemEndMonth').val(itemEndMonth);

		$('#xmjy-edit').find('input[type=hidden]')[0].dataset.xmjyid=id;
	}
	function deleteXmjy(){
		var id=$(this).parent().parent().data('xmjyid');
		var xmjy=$(this);
		$.post('deleteXmjy.html',{'id':id},function(data){
			
			xmjy.parent().parent().remove();
			isCreate('xmjySide','isCreate');
			progress();
		})
	}

	/*校内职务*/
	$('#xnzw-tianjia').click(function(){
		if($('#xnzw-edit').css('display')=='block')
		{
			alert('请先保存编辑过的信息');
		}
		else{
			$('#xnzw-show').css('display','none');
			$('#xnzw-add').css('display','block');
		}
	});
	$('#xnzw-add-btn-cancel').click(function(){
		$('#xnzw-show').css('display','block');
		$('#xnzw-add').css('display','none');
		$('#add-dutyStartYear').val(null);
		$('#add-dutyStartMonth').val(null);
		$('#add-dutyEndYear').val(null);
		$('#add-dutyEndMonth').val(null);
		$('#add-dutyName').val(null);
		$('#add-dutyDescribe').val(null);
	});
	$('#xnzw-add-btn-tianjia').click(function(){

		var add_dutyName=$('#add-dutyName').val();
		var add_dutyStartYear=$('#add-dutyStartYear').val();
		var add_dutyStartMonth=$('#add-dutyStartMonth').val();
		var add_dutyEndYear=$('#add-dutyEndYear').val();
		var add_dutyEndMonth=$('#add-dutyEndMonth').val();
		var add_dutyDescribe=$('#add-dutyDescribe').val();

		$.post('addXnzw.html',
			{
				'dutyName':add_dutyName,
				'dutyStartYear':add_dutyStartYear,
				'dutyStartMonth':add_dutyStartMonth,
				'dutyEndYear':add_dutyEndYear,
				'dutyEndMonth':add_dutyEndMonth,
				'dutyDescribe':add_dutyDescribe
			},
			function(data){
				addXnzw(add_dutyName,add_dutyStartYear,add_dutyStartMonth,add_dutyEndYear,add_dutyEndMonth,add_dutyDescribe,data);

				$('#xnzw-show').css('display','block');
				$('#xnzw-add').css('display','none');
				$('#add-dutyStartYear').val(null);
				$('#add-dutyStartMonth').val(null);
				$('#add-dutyEndYear').val(null);
				$('#add-dutyEndMonth').val(null);
				$('#add-dutyName').val(null);
				$('#add-dutyDescribe').val(null);
				isCreate('xnzwSide','isCreate');
				progress();
		});

	});

	$('#xnzw-edit-btn-cancel').click(function(){
		$('#xnzw-show').css('display','block');
		$('#xnzw-edit').css('display','none');
	});
	$('#xnzw-edit-btn-baocun').click(function(){

		var id=$('#xnzw-edit').find('input[type=hidden]')[0].dataset.xnzwid;
		var edit_dutyName=$('#edit-dutyName').val();
		var edit_dutyStartYear=$('#edit-dutyStartYear').val();
		var edit_dutyStartMonth=$('#edit-dutyStartMonth').val();
		var edit_dutyEndYear=$('#edit-dutyEndYear').val();
		var edit_dutyEndMonth=$('#edit-dutyEndMonth').val();
		var edit_dutyDescribe=$('#edit-dutyDescribe').val();

		$.post('editXnzw.html',
					{
						'id':id,
						'dutyName':edit_dutyName,
						'dutyStartYear':edit_dutyStartYear,
						'dutyStartMonth':edit_dutyStartMonth,
						'dutyEndYear':edit_dutyEndYear,
						'dutyEndMonth':edit_dutyEndMonth,
						'dutyDescribe':edit_dutyDescribe
					},function(data){
						var lists=$('#xnzw-show').find('div.xnzw-list');
						for(var i=0;i<lists.length;i++)
						{
							if(lists.eq(i).data('xnzwid')==id)
							{
								lists.eq(i).find('span.show-dutyName').html(edit_dutyName);
								lists.eq(i).find('span.show-dutyDescribe').html(edit_dutyDescribe);
								lists.eq(i).find('span.show-dutyTime').html(edit_dutyStartYear+'-'+edit_dutyStartMonth+'~'+edit_dutyEndYear+'-'+edit_dutyEndMonth);
							}
						}

						$('#xnzw-show').css('display','block');
						$('#xnzw-edit').css('display','none');
					});
	});

	$('.inline-xiugai2').on('click',editXnzw);
	$('.inline-shanchu2').on('click',deleteXnzw);
	function addXnzw(dutyName,dutyStartYear,dutyStartMonth,dutyEndYear,dutyEndMonth,dutyDescribe,dutyId){
		var show_box=$('div.xnzw-show-box');
		var list=$('<div class="xnzw-list clearfix" data-xnzwid='+dutyId+'></div>');

		var line1=$('<div class="line-50"></div>');
		var span1=$('<span></span>');
		var show_dutyName=$('<span class="show-dutyName isCreate">'+dutyName+'</span>');

		var line2=$('<div class="line-50"></div>');
		var span2=$('<span></span>');
		var show_dutyTime=$('<span class="show-dutyTime isCreate">'+dutyStartYear+'-'+dutyStartMonth+'~'+dutyEndYear+'-'+dutyEndMonth+'</span>');
		var xiugai=$('<span> 修改</span>');
		xiugai.click(editXnzw);
		var shanchu=$('<span> 删除</span>');
		shanchu.click(deleteXnzw);
		xiugai.addClass('inline-xiugai2');
		shanchu.addClass('inline-shanchu2');

		var line3=$('<div class="line-100"></div>');
		var span3=$('<span></span>');
		var show_dutyDescribe=$('<span class="show-dutyDescribe isCreate">'+dutyDescribe+'</span>');

		show_box.append(list);

		list.append(line1);
		span1.html('职务名称：');
		line1.append(span1);
		line1.append(show_dutyName);

		list.append(line2);
		span2.html('任职时间：');
		line2.append(span2);
		line2.append(show_dutyTime);
		line2.append(xiugai);
		line2.append(shanchu);

		list.append(line3);
		span3.html('职务描述：');
		line3.append(span3);
		line3.append(show_dutyDescribe);
	}
	function editXnzw(){
		location.href = "#xnzwSide";
		var id=$(this).parent().parent().data('xnzwid');
		$('#xnzw-edit').css('display','block');
		$('#xnzw-show').css('display','none');
		var dutyName=$(this).parent().parent().find('span.show-dutyName').html();
		var dutyDescribe=$(this).parent().parent().find('span.show-dutyDescribe').html();

		var time=$(this).parent().parent().find('span.show-dutyTime').html();
		var startTime=time.split('~')[0];
		var endTime=time.split('~')[1];

		var dutyStartYear=startTime.split('-')[0];
		var dutyStartMonth=startTime.split('-')[1];
		var dutyEndYear=endTime.split('-')[0];
		var dutyEndMonth=endTime.split('-')[1];

		$('#edit-dutyName').val(dutyName);
		$('#edit-dutyDescribe').val(dutyDescribe);
		$('#edit-dutyStartYear').val(dutyStartYear);
		$('#edit-dutyStartMonth').val(dutyStartMonth);
		$('#edit-dutyEndYear').val(dutyEndYear);
		$('#edit-dutyEndMonth').val(dutyEndMonth);

		$('#xnzw-edit').find('input[type=hidden]')[0].dataset.xnzwid=id;
	}
	function deleteXnzw(){

		var id=$(this).parent().parent().data('xnzwid');
		var xnzw=$(this);
		$.post('deleteXnzw.html',{'id':id},function(data){
			xnzw.parent().parent().remove();
			isCreate('xnzwSide','isCreate');
			progress();
		});
		
	}



	/*语言能力*/
	$('#yynl-tianjia').click(function(){
		if($('#yynl-edit').css('display')=='block')
		{
			alert('请先保存编辑过的信息');
		}
		else{
			$('#yynl-show').css('display','none');
			$('#yynl-add').css('display','block');
		}
		
	});
	$('#yynl-add-btn-cancel').click(function(){
		$('#yynl-show').css('display','block');
		$('#yynl-add').css('display','none');
		$('#add-lgName').val(null);
		$('#add-lgTS').val(null);
		$('#add-lgDX').val(null);

	});
	
	$('#yynl-add-btn-tianjia').click(function(){
		
		var add_lgName=$('#add-lgName').val();
		var add_lgTS=$('#add-lgTS').val();
		var add_lgDX=$('#add-lgDX').val();
		var lists=$('#yynl-show').find('div.yynl-list');
		var has=0;
		for(var i=0;i<lists.length;i++)
		{
			if(lists.eq(i).find('span.show-lgName').html()==add_lgName)
				has=1;
		}
		if(has==1)
		{
			alert('该语言信息已经存在，请不要重复录入');
		}
		else{
			$.post('addYynl.html',
				{
					'lgName':add_lgName,
					'lgTS':add_lgTS,
					'lgDX':add_lgDX
				},
				function(data){
					addYynl(add_lgName,add_lgTS,add_lgDX,data);
					$('#yynl-show').css('display','block');
					$('#yynl-add').css('display','none');

					$('#add-lgName').val(null);
					$('#add-lgTS').val(null);
					$('#add-lgDX').val(null);
					isCreate('yynlSide','isCreate');
					progress();
				}
			);	
		}
		
	});

	$('#yynl-edit-btn-cancel').click(function(){
		$('#yynl-show').css('display','block');
		$('#yynl-edit').css('display','none');
	});

	$('#yynl-edit-btn-baocun').click(function(){
		var id=$('#yynl-edit').find('input[type=hidden]')[0].dataset.yynlid;
		var edit_lgName=$('#edit-lgName').val();
		var edit_lgTS=$('#edit-lgTS').val();
		var edit_lgDX=$('#edit-lgDX').val();

		$.post('editYynl.html',
					{
						'id':id,
						'lgName':edit_lgName,
						'lgTS':edit_lgTS,
						'lgDX':edit_lgDX
					},function(data){
						var lists=$('#yynl-show').find('div.yynl-list');
						for(var i=0;i<lists.length;i++)
						{
							if(lists.eq(i).data('yynlid')==id)
							{
								lists.eq(i).find('span.show-lgName').html(edit_lgName);
								lists.eq(i).find('span.show-lgTS').html(edit_lgTS);
								lists.eq(i).find('span.show-lgDX').html(edit_lgDX);
							}
						}

						$('#yynl-show').css('display','block');
						$('#yynl-edit').css('display','none');
				});
	});

	$('.inline-xiugai3').on('click',editYynl);
	$('.inline-shanchu3').on('click',deleteYynl);
	function addYynl(lgName,lgTS,lgDX,lgId){
		var show_box=$('div.yynl-show-box');
		var list=$('<div class="yynl-list clearfix" data-yynlid='+lgId+'></div>');

		var line1=$('<div class="line-30"></div>');
		var span1=$('<span></span>');
		var show_lgName=$('<span class="show-lgName isCreate">'+lgName+'</span>');

		var line2=$('<div class="line-30"></div>');
		var span2=$('<span></span>');
		var show_lgTS=$('<span class="show-lgTS isCreate">'+lgTS+'</span>');

		var line3=$('<div class="line-30"></div>');
		var span3=$('<span></span>');
		var show_lgDX=$('<span class="show-lgDX isCreate">'+lgDX+'</span>');

		var line4=$('<div class="line-10"></div>');
		var xiugai=$('<span> 修改</span>');
		xiugai.click(editYynl);
		var shanchu=$('<span> 删除</span>');
		shanchu.click(deleteYynl);
		xiugai.addClass('inline-xiugai3');
		shanchu.addClass('inline-shanchu3');

		show_box.append(list);

		list.append(line1);
		span1.html('语言名称：');
		line1.append(span1);
		line1.append(show_lgName);

		list.append(line2);
		span2.html('听说能力：');
		line2.append(span2);
		line2.append(show_lgTS);

		list.append(line3);
		span3.html('读写能力：');
		line3.append(span3);
		line3.append(show_lgDX);

		list.append(line4);
		line4.append(xiugai);
		line4.append(shanchu);
	}
	function editYynl(){
		var id=$(this).parent().parent().data('yynlid');
		$('#yynl-edit').css('display','block');
		$('#yynl-show').css('display','none');
		var lgName=$(this).parent().parent().find('span.show-lgName').html();
		var lgTS=$(this).parent().parent().find('span.show-lgTS').html();
		var lgDX=$(this).parent().parent().find('span.show-lgDX').html();
		$('#edit-lgName').val(lgName);
		$('#edit-lgTS').val(lgTS);
		$('#edit-lgDX').val(lgDX);
		$('#yynl-edit').find('input[type=hidden]')[0].dataset.yynlid=id;
	}
	function deleteYynl(){
		var id=$(this).parent().parent().data('yynlid');
		var yynl=$(this);
		$.post('deleteYynl.html',{'id':id},function(data){
			yynl.parent().parent().remove();
			isCreate('yynlSide','isCreate');
			progress();
		});
	}



	/*固定侧边栏*/
	var nav=$('#middle-left');
	var right=$('#middle-right');
	$(window).scroll(function(){
		if($(window).scrollTop()>=100)
		{
			nav.addClass('fixednav');
			right.addClass('fixedright');
		}
		else
		{
			nav.removeClass('fixednav');
			right.removeClass('fixedright');
		}
	})


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
	progress();
	function progress(){
		var spans=$('#middle-left ul li').find('span');
		var all=spans.length;
		var isCreate=spans.filter('.create').length;
		var progress=$('.progress-bar');
		var pro_span=$('.pro-span');
		var value=(isCreate/all).toFixed(2)*100+'%';
		progress.css('width',value);
		pro_span.html(value);
	}

})