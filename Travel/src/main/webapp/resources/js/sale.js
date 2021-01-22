$(function() {
	$('ul.manu_title li').click(function() {
		var onTab = $(this).attr('data-tab');
		$('ul.manu_title li').removeClass('on');
		$('.pdt').removeClass('on');
		$(this).addClass('on');
		$('#' + onTab).addClass('on');
	})
	
	
});