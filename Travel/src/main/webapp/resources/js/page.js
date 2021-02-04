/**
 * 
 */

let isEnd = false;

$(function() {
	$(window).scroll(function() {
		let $window = $(this);
		let scrollTop = $window.scrollTop();
		let windowHeight = $window.height();
		let documentHeight = $(document).height();
		
		console.log("documentHeight: " + documentHeight + " | scrollTop: " + scrollTop +
			" | windowHeight: " + windowHeight);
		
		if(scrollTop + windowHeight + 30 > documentHeight) {
			fetchList();
		}
	})
	fetchList();
})

let fetchList = function() {
	if(isEnd == true) {
		return;
	}
	
	let startNo = $('#table')
}


$(window).scroll(function() {
	if($(window).scrollTop() >= $(document).height() - $(window).height()) {
		var lastScrollTop = 0;
		
		$(window).scroll(function() {
			var currentScrollTop = $(window).scrollTop();
			
			// 다운스크롤
			if(currentScrollTop - lastScrollTop > 0) {
				lastScrollTop = currentScrollTop;
			} else {	// 업스크롤
				lastScrollTop = currentScrollTop;
			}
		});
		
		// 게시글에 뿌려진 게시글의 마지막 번호 가져오기
		var lastid = $(".scrolling:last").attr("data-num");
		
		$.ajax({
			type: 'POST',
			url: '/go/ctg/list/scroll',
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			dataType: 'json',
			data: JSON.stringify({
				ctg_id: lastid
			}),
			success: function(data) {
				var str = "";
				
				if(data != "") {
					$(data).each(
						function() {
							console.log(this);
							str += "<tr class=" + "'listToChange'" + ">" +
								"<td class=" + "'scrolling'" + " data-num='" + this.ctg_id + "'>" +
									this.ctg_id +
								"</td>" + 
								"<td>" + this.ptd_
								
						}
					)
				}
			}
		})
	}
})






































