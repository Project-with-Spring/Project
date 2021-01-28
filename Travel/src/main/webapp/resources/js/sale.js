$(function() {
		var phoneCheck = false;
	$('#resetPhone').click(function() {
		$(this).hide();
		$('#phoneNumber').val("");
		$('#balance').val("");
		phoneCheck = false;
	})
	
	
	$('#phoneNumber').keyup(function() {
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		phoneCheck = false;
		if($(this).val().length >7){
			
			if($(this).val().indexOf("-")==-1){
				alert('오류 - 전화번호를 확인해주세요.');
				$(this).val("");
				$(this).focas();
				phoneCheck = false;
			} else if($(this).val().length > 15) {
				alert('오류 - 전화번호를 확인해주세요.');
				$(this).val("");
				$(this).focas();
				phoneCheck = false;
			} else {
				phoneCheck = true;
			}
		}
	});
	
	$('#phoneNumber').blur(function() {
		var phoneNumber = $(this).val();
		
		if(phoneCheck){
			$.ajax({
				url : "pointCheck",
				type : "post",
				traditional : "true",
				data : {
					phoneNumber:phoneNumber
				},
				success : function(data){
					if(data==""){
						alert("포인트 적립 이력이 없습니다.")
						$('#balance').val("아이디 없음");
					}else {
						alert(phoneNumber+"님 \n잔여 포인트 : " +data);
						$('#balance').val(data);
					}
					$('#resetPhone').show();
				}
				
			})
		} else if($(this).val()==""){
			alert('전화번호가 입력되지 않았습니다.');
			$(this).focas();
		} else {
			alert('오류 - 전화번호를 확인해주세요.');
			$(this).val("");
			$(this).focas();
		}
	})
	$('#sale_btn').click(function() {
		alert('결제 되었습니다.');
		// 판매자 정보
		var stf_id = 11;
		// 포인트 적립 정보
		var pot_id = $('#phoneNumber').val();
		var pot_point = $('#balance').val();
		
		// 넘길 배열 생성
		var pdt_idList = [];
		var pdt_nameList = [];
		var pdt_countList = [];
		var pdt_priceList = [];
		// 생성한 배열에 값 추가
		$("input[name='pdt_id']").each(function(i){
			pdt_idList.push($("input[name='pdt_id']").eq(i).val()); // 상품코드
			pdt_nameList.push($("input[name='pdt_name']").eq(i).val()); // 상품명
			pdt_countList.push($("input[name='pdt_count']").eq(i).val()); //  주문수량
			pdt_priceList.push(deleteComma($("input[name='pdt_price']").eq(i).val())); // 해당상품 총액
		});
		
		// ajax 데이터 실어서 보내기
		$.ajax({
			url : "payment",
			type : "post",
			traditional : "true",
			data :	{
				pdt_idList:pdt_idList,
				pdt_nameList:pdt_nameList,
				pdt_countList:pdt_countList,
				pdt_priceList:pdt_priceList,
				pot_id:pot_id,
				pot_point:pot_point,
				stf_id:stf_id
			},
			success:function(data){
			location.href='sale';
			}
			
		})
////		 배열에 들어간 정보 확인용
//		for(var i =0; i < pdt_idList.length; i++){
//		alert("<배열에 적용된 정보>\n상품 코드(pdt_idList) : " + pdt_idList[i]
//		+"\n상품 명(pdt_nameList) : " + pdt_nameList[i]
//		+"\n주문 개수(pdt_countList) : " + pdt_countList[i]
//		+"\n상품 총 금액(pdt_priceList) : " + pdt_priceList[i]
//		);
//		}
	});
	
	// 카테고리 클릭시 해당 카테고리에 포함되는 메뉴 불러오기.
	$('ul.manu_title li').click(function() {
		var onTab = $(this).attr('data-tab');
		$('ul.manu_title li').removeClass('on');
		$('.pdt').removeClass('on');
		$(this).addClass('on');
		$('#' + onTab).addClass('on');
	});
	// 메뉴 클릭시 주문 리스트에 추가
	$('ul.manu_sel li').click(function() {
		var pdt_id = $(this).data("hidden");
		var pdt_name = $(this).data("options").name;
		var pdt_cost = $(this).data("options").cost;
		var order_price = pdt_cost/1;
		var changeId = 0;
		var totalCount = 1;
		var check = false;
		
		// 주문리스트에 해당 메뉴 있는가? 판별
		$("input[name='pdt_id']").each(function(i) {
			if(pdt_id==$("input[name='pdt_id']").eq(i).val()){
				check = true;
				changeId = i;
			};
			// 주문 총액 계산기
			order_price += deleteComma($("input[name='pdt_price']").eq(i).val())/1;
			totalCount += $("input[name='pdt_count']").eq(i).val()/1;
		})
		
		// 이미 클릭된 적 있다면?
		if(check){
			var count = $("input[name='pdt_count']").eq(changeId).val(); // 지금 수량 몇개인지 불러와서
			count ++; // 하나추가
			$("input[name='pdt_count']").eq(changeId).val(count); // 적용
			$("input[name='pdt_price']").eq(changeId).val(plusComma(count*pdt_cost)); // 수량이바꼇으니 상품총액도 수정
		} else {
			// 클릭된적 없다면 주문 리스트에 추가 
		$('#order_list').append("<tr><td><input type='hidden' name='pdt_id' value='"+pdt_id+
		"'><input type='hidden' name='pdt_name' value='"+pdt_name+"'<div>"+pdt_name+"</div></td>"
		+"<td><input type='number' id='"+pdt_name+"'name='pdt_count' value='1' onchange='changeCount(this);' ></td>"
		+"<td><input type='text' name='pdt_cost' value='"+plusComma(pdt_cost)+"' readonly='true'></td>"
		+"<td><input type='text' name='pdt_discount' value='0'></td>"
		+"<td><input type='text' name='pdt_price' value='"+plusComma(pdt_cost)+"' readonly='true'></td>"
		+"<td><a href='#' class='btn btn-danger btn-xs btnDelete'>"
		+"<span class='glyphicon glyphicon-remove'></span></a></td><tr>");
			
		}   // 계산했던 주문 총액 적용
		var totalItems = $("input[name='pdt_price']").length;
			$('#total_items').val(totalItems);
			$('#total_qty').val(totalCount);
			$('#sub_total').val(plusComma(order_price));
			$('#TLT_AMOUNTS').html(plusComma(order_price)+" 원"); 
	});
	
});

// 주문 리스트의 수량변경 스크립트
function changeCount(count){
	var name = document.getElementById(count.getAttribute('id')).getAttribute('id');
	var i = 0 ;
	while(!(document.getElementsByName("pdt_name")[i].value == name)){  // 어떤품목을 변경했는지 배열에서 찾는코드임
		i++;
	}
	var cost = deleteComma(document.getElementsByName("pdt_cost")[i].value); //찾은 배열에서 개당가격 가져오기
	var sumValue = cost*count.value; // 상품 총액 계산기
	document.getElementsByName("pdt_price")[i].value = plusComma(sumValue); //상품 총액 변경
	var totalItems = document.getElementsByName("pdt_price").length;
	var totalCost = 0;
	var price = 0;
	for (var j = 0 ; j < document.getElementsByName("pdt_price").length ; j++ ){
		price += deleteComma(document.getElementsByName("pdt_price")[j].value)/1;  // 주문총액 계산기
		totalCost += document.getElementsByName("pdt_count")[j].value/1;
		
	}
	document.getElementById("total_items").value = totalItems;
	document.getElementById("total_qty").value = totalCost;
	document.getElementById("sub_total").value = price;
	document.getElementById("TLT_AMOUNTS").innerHTML = plusComma(price) +" 원"; // 주문 총액 적용
}

	// 정규판별식이용해서 3자리 수마다 콤마(,) 삽입
function plusComma(won) {
	return won.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

}
	// 정규판별식이용해서 콤마(,) 제거
function deleteComma(won) {
	return won.replace(/,/g,"");
}

