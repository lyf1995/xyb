$(function(){
	$('#stu').click(function(){
		$(this).attr('class','on');
		$('#tea').attr('class','off');
		$('#com').attr('class','off');
		$('input[type=hidden]').val(0);
		
	});
	$('#com').click(function(){
		$(this).attr('class','on');
		$('#tea').attr('class','off');
		$('#stu').attr('class','off');
		$('input[type=hidden]').val(2);
	});
	$('#tea').click(function(){
		$(this).attr('class','on');
		$('#stu').attr('class','off');
		$('#com').attr('class','off');
		$('input[type=hidden]').val(3);
	});
	
});