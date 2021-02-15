$(function() {
		var phoneCheck = false; // 전화번호 정규표현식 변수
		
	$(document).keydown(function(key) {
		if(key.which == 117){
			location.href='sale';
			key.preventDefault();
		} else if(key.which == 118){
			// 판매자 정보
		var stf_id = $('#stf_id').data('hidden');
		if(stf_id == ""){
			alert('판매자 로그인 해주세요.');
			return false;
		}
		// 결제수단
		var pay_method = "저장";
		// 요청 사항
		var ord_memo =$('#ord_memo').val();
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
		if($('#total_items').val() == 0){
			alert('메뉴가 선택되지 않았습니다.');
			return false;
		}
		alert('저장 되었습니다.');
		// ajax 데이터 실어서 보내기
		$.ajax({
			url : "saveOrder",
			type : "post",
			traditional : "true",
			data :	{
				pdt_idList:pdt_idList,
				pdt_nameList:pdt_nameList,
				pdt_countList:pdt_countList,
				pdt_priceList:pdt_priceList,
				stf_id:stf_id,
				pay_method:pay_method,
				ord_memo:ord_memo
			},
			success:function(data){
			location.href='sale';
			}
			
		})
			key.preventDefault();
		} else if (key.which == 119){
			// 판매자 정보
		var stf_id = $('#stf_id').data('hidden');
		if(stf_id == ""){
			alert('판매자 로그인 해주세요.');
			return false;
		}// 포인트 적립 정보
		var pot_id = $('#phoneNumber').val();
		var pot_point = $('#balance').val();
		var sale_point = $('#tlt_dist').val();
		// 결제수단
		var pay_method = $('#pay_method').val();
		// 요청 사항
		var ord_memo =$('#ord_memo').val();
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
		var dt_pdt_id = [];
		var dt_count = [];
		var dt_price = [];
		var dt_name = [];
		$("input[name='dt_pdt_id']").each(function(i){
			dt_pdt_id.push($("input[name='dt_pdt_id']").eq(i).val());
			dt_count.push($("input[name='dt_count']").eq(i).val());
			dt_price.push(deleteComma($("input[name='dt_price']").eq(i).val()));
			dt_name.push($("input[name='dt_pdt_id']").eq(i).closest('tr').text());
		})
		if($('#total_items').val() == 0){
			alert('메뉴가 선택되지 않았습니다.');
			return false;
		}
		alert('결제 되었습니다.');
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
				stf_id:stf_id,
				sale_point:sale_point,
				pay_method:pay_method,
				ord_memo:ord_memo,
				dt_pdt_id:dt_pdt_id,
				dt_count:dt_count,
				dt_price:dt_price,
				dt_name:dt_name
			},
			success:function(data){
			location.href='sale';
			}
			
		})
		key.preventDefault();
		}
	})
		
		// 포인트적립 초기화
	$('#resetPhone').click(function() {
		$(this).hide();
		$('#phoneNumber').val("");
		$('#balance').val("");
		$('#phoneNumber').attr("readonly",false);
		phoneCheck = false;
		$('#tlt_dist').attr("readonly",true);
		$('#tlt_dist').val(0);
		$('#tlt_tax').val(deleteComma($('#sub_total').val())/20);
		$('#TLT_AMOUNTS').html($('#sub_total').val()+" 원"); 
		$('#maxPoint').hide();
		
	})
	
		// 폰번호 정규표현식
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
	
	// ajax 포인트 조회
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
						$('#phoneNumber').attr("readonly",true);
						if(data>=1000) {
						$('#tlt_dist').attr("readonly",false);
						$('#maxPoint').show();
						}
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
	
		// 포인트 최대사용 버튼(편의성)
	$('#maxPoint').click(function() {
		var total_price = deleteComma($('#sub_total').val());
		var point = $('#balance').val().replace(/[0-9]{2}$/,"00");
		
		if(parseInt(total_price) < point ) {
			point = total_price;
		}

		$('#tlt_dist').val(point);
		$('#tlt_tax').val((total_price - point)/20);
		$('#TLT_AMOUNTS').html(plusComma(total_price - point)+" 원"); 
	})
	// 결제 버튼
	$('#sale_btn').click(function() {
		// 판매자 정보
		var stf_id = $('#stf_id').data('hidden');
		if(stf_id == ""){
			alert('판매자 로그인 해주세요.');
			return false;
		}// 포인트 적립 정보
		var pot_id = $('#phoneNumber').val();
		var pot_point = $('#balance').val();
		var sale_point = $('#tlt_dist').val();
		// 결제수단
		var pay_method = $('#pay_method').val();
		// 요청 사항
		var ord_memo =$('#ord_memo').val();
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
		var dt_pdt_id = [];
		var dt_count = [];
		var dt_price = [];
		var dt_name = [];
		$("input[name='dt_pdt_id']").each(function(i){
			dt_pdt_id.push($("input[name='dt_pdt_id']").eq(i).val());
			dt_count.push($("input[name='dt_count']").eq(i).val());
			dt_price.push(deleteComma($("input[name='dt_price']").eq(i).val()));
			dt_name.push($("input[name='dt_pdt_id']").eq(i).closest('tr').text());
		})
		if($('#total_items').val() == 0){
			alert('메뉴가 선택되지 않았습니다.');
			return false;
		}
		alert('결제 되었습니다.');
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
				stf_id:stf_id,
				sale_point:sale_point,
				pay_method:pay_method,
				ord_memo:ord_memo,
				dt_pdt_id:dt_pdt_id,
				dt_count:dt_count,
				dt_price:dt_price,
				dt_name:dt_name
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
	
	// 저장 버튼
	$('#save_btn').click(function() {
		// 판매자 정보
		var stf_id = $('#stf_id').data('hidden');
		if(stf_id == ""){
			alert('판매자 로그인 해주세요.');
			return false;
		}
		// 결제수단
		var pay_method = "저장";
		// 요청 사항
		var ord_memo =$('#ord_memo').val();
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
		if($('#total_items').val() == 0){
			alert('메뉴가 선택되지 않았습니다.');
			return false;
		}
		alert('저장 되었습니다.');
		// ajax 데이터 실어서 보내기
		$.ajax({
			url : "saveOrder",
			type : "post",
			traditional : "true",
			data :	{
				pdt_idList:pdt_idList,
				pdt_nameList:pdt_nameList,
				pdt_countList:pdt_countList,
				pdt_priceList:pdt_priceList,
				stf_id:stf_id,
				pay_method:pay_method,
				ord_memo:ord_memo
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
	// 메뉴 삭제
	$(document.body).delegate('#delete_order','click',function() {
		var phone = $("input[name='paid_amt']").val();
		if(phone != ""){
			alert('회원번호를 초기화 해주세요.');
			return false;
		}
		
		if($(this).closest('tr').data('select')=="on"){
		$('#manu_detail').hide();
		$('#save_order').show();
		}
		$(this).closest('tr').remove();
		var pdt_id = $(this).closest('tr').find("input[name='pdt_id']").val();
		var dt_price = 0;
		$("input[name='dt_pdt_id']").each(function(i) {
			if(pdt_id == $(this).val()){
				$(this).closest('tr').remove();
				var plus_dt_price = parseInt(deleteComma($(this).closest('tr').find("input[name='dt_price']").val()));
				dt_price += plus_dt_price;
//				alert("상품 가격 : " + plus_dt_price + "\n총 상품가격 :" + dt_price);
			}
		})
		
		var minusPrice = deleteComma($(this).closest('tr').find("input[name='pdt_price']").val());
		var minusCount = parseInt($(this).closest('tr').find("input[name='pdt_count']").val());
		var total_sale = deleteComma($('#sub_total').val());
		var total_items = $('#total_items').val();
		var totalCount = parseInt($('#total_qty').val());
		total_sale -= minusPrice;
		total_sale -= dt_price;
		total_items --;
		$('#total_items').val(total_items);
		$('#total_qty').val(totalCount-minusCount);
		$('#sub_total').val(plusComma(total_sale));
		$('#tlt_tax').val(total_sale/20);
		$('#TLT_AMOUNTS').html(plusComma(total_sale)+" 원"); 
	})
	
	// 디테일 메뉴 삭제
	$(document.body).delegate('#delete_orderDetail','click',function() {
		var phone = $("input[name='paid_amt']").val();
		if(phone != ""){
			alert('회원번호를 초기화 해주세요.');
			return false;
		}
		
		if($(this).closest('tr').data('select')=="on"){
		$('#manu_detail').hide();
		$('#save_order').show();
		}
		$(this).closest('tr').remove();
		
		var minusPrice = deleteComma($(this).closest('tr').find("input[name='dt_price']").val());
		var total_sale = deleteComma($('#sub_total').val());
		total_sale -= minusPrice
		total_items --;
		$('#sub_total').val(plusComma(total_sale));
		$('#tlt_tax').val(total_sale/20);
		$('#TLT_AMOUNTS').html(plusComma(total_sale)+" 원"); 
	})
	
	// 저장 주문 선택
	var selectsaveorder ="";
	$('#save_order_list tr').click(function() {
		if($(this).closest('tr').data('select')=="on"){
			selectsaveorder ="";
			$('#save_order_list tr').data('select','');
			$('#save_order_list tr').css('background-color',"");
		}else {
			selectsaveorder = $(this).closest('tr');
			$('#save_order_list tr').data('select','');
			$('#save_order_list tr').css('background-color',"");
			$(this).closest('tr').data('select',"on");
			$(this).closest('tr').css('background-color','lightyellow');
		}
	})
	// 저장 주문 선택 후 불러오기
	$('#getSaveOrder').click(function() {
		var ord_id = selectsaveorder.find('#delete_saveorder').data('hidden');
		$.ajax({
			url : "getSaveOrder",
			type : "post",
			traditional : "true",
			dataType :"json",
			data :	{
				ord_id:ord_id
			},
			success:function(data){
//				var ordBean = data.ordBean;
				var odtBeanList = data.odtBean;
				var total_sale =0;
				var totalItems = 0;
				var totalCount = 0;
				$('#order_list').html("");
				$.each(odtBeanList, function(i) {
					var pdt_name = odtBeanList[i].pdt_name;
					var odt_count = parseInt(odtBeanList[i].odt_count);
					var pdt_cost = parseInt(odtBeanList[i].pdt_cost);
					var pdt_sub = pdt_cost * odt_count;
					$('#order_list').append("<tr><td><input type='hidden' name='pdt_id' value='"+odtBeanList[i].pdt_id+
					"'><input type='hidden' name='pdt_name' value='"+pdt_name+"'><div>"+pdt_name+"</div></td>"
					+"<td><input type='text' name='pdt_cost' value='"+plusComma(pdt_cost)+"' readonly='true'></td>"
					+"<td><input type='number' name='pdt_discount' value='0' oninput='productDiscount(this);' min='0' max='100' step='5'></td>"
					+"<td><input type='number' id='"+pdt_name+"' name='pdt_count' value='"+odt_count+"' oninput='changeCount(this);' ></td>"
					+"<td><input type='text' name='pdt_price' value='"+plusComma(pdt_sub)+"' readonly='true'></td>"
					+"<td><a id='delete_order' href='#' class='btn btn-danger btn-xs btnDelete'>"
					+"<span class='glyphicon glyphicon-remove'></span></a></td></tr>");
					total_sale += pdt_sub;
					totalItems ++;
					totalCount += odt_count;
				})
				
				
				$('#total_items').val(totalItems);
				$('#total_qty').val(totalCount);
				$('#sub_total').val(plusComma(total_sale));
				$('#tlt_tax').val(total_sale/20);
				$('#TLT_AMOUNTS').html(plusComma(total_sale)+" 원"); 
				
				
			}
		})
	})
	// 추가 요청 메뉴 선택!
	var selectmenu = "";
	// orderlist -> detail menu
	$(document.body).delegate('#order_list tr div','click',function() {
		if($(this).closest('tr').data('select')=="on"){
		selectmenu ="";
		$('#order_list tr').data('select','');
		$('#order_list tr').css('background-color',"");
		$('#manu_detail').hide();
		$('#save_order').show();
		}else {
		selectmenu = $(this).closest('tr');
		$('#order_list tr').data('select','');
		$('#order_list tr').css('background-color',"");
		$(this).closest('tr').data('select',"on");
		$(this).closest('tr').css('background-color','lightyellow');
		$('#save_order').hide();
		$('#manu_detail').show();
		}
	});
	// 추가요청 메뉴 조작!
	$('#manu_detail button').click(function() {
		var pdt_id = selectmenu.find("input[name='pdt_id']").val();
		var detailmenu = $(this).val();
		var cost = $(this).data("hidden");
		var count = 1;
		if(detailmenu == "" ){
			return false;
		}
		var check = "#"+detailmenu+pdt_id;
//		
		if($(check).length>0){
			count = $(check+"count").val();
			count ++;$(check+"count").val(count);
		}else {
		selectmenu.after("<tr><td><input type ='hidden' id='"+detailmenu+pdt_id+"' name='dt_pdt_id' value='"+pdt_id+"'</td><td colspan='2'><div>"+$(this).text()+"</div></td>"
		+"<td><input type='number' id='"+detailmenu+pdt_id+"count' name='dt_count' value='1' readonly='true'></td>"
		+"<td><input type='text' id='"+detailmenu+pdt_id+"price' name='dt_price' value='"+plusComma(cost)+"' readonly='true'></td>"
		+"<td><a id='delete_orderDetail' href='#' class='btn btn-danger btn-xs btnDelete'>"
		+"<span class='glyphicon glyphicon-remove'></span></a></td></tr>");
			
		}
			var total_sale = parseInt(deleteComma($('#sub_total').val()));
			$(check+"price").val(plusComma(count*cost));
			total_sale += cost;
			var point = $('#tlt_dist').val();
			$('#tlt_tax').val((total_sale-point)/20);
			$('#sub_total').val(plusComma(total_sale));
			$('#TLT_AMOUNTS').html(plusComma(total_sale-point)+" 원"); 
	})
	
	// 추가요청 해제
	// detail menu -> save_order
	$('#return_save').click(function() {
		selectmenu ="";
		$('#order_list tr').css('background-color',"");
		$('#manu_detail').hide();
		$('#save_order').show();
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
		"'><input type='hidden' name='pdt_name' value='"+pdt_name+"'><div>"+pdt_name+"</div></td>"
		+"<td><input type='text' name='pdt_cost' value='"+plusComma(pdt_cost)+"' readonly='true'></td>"
		+"<td><input type='number' name='pdt_discount' value='0' oninput='productDiscount(this);' min='0' max='100' step='5'></td>"
		+"<td><input type='number' id='"+pdt_name+"' name='pdt_count' value='1' oninput='changeCount(this);' min='1'></td>"
		+"<td><input type='text' name='pdt_price' value='"+plusComma(pdt_cost)+"' readonly='true'></td>"
		+"<td><a id='delete_order' href='#' class='btn btn-danger btn-xs btnDelete'>"
		+"<span class='glyphicon glyphicon-remove'></span></a></td></tr>");
			
		}   // 계산했던 주문 총액 적용
		$("input[name='detail_price']").each(function(i){
			order_price += parseInt(deleteComma($("input[name='detail_price']").eq(i).val()));
		})
			// 추가메뉴 주문계산
		var dt_price = 0;
		$("input[name='dt_price']").each(function(i) {
			var plus_dt_price = parseInt(deleteComma($(this).val()));
			dt_price += plus_dt_price 
		})
		var totalItems = $("input[name='pdt_price']").length;
		order_price += dt_price;
		var point = parseInt($("#tlt_dist").val());
		
			$('#total_items').val(totalItems);
			$('#total_qty').val(totalCount);
			$('#sub_total').val(plusComma(order_price));
			order_price -= point;
			$('#tlt_tax').val(order_price/20);
			$('#TLT_AMOUNTS').html(plusComma(order_price)+" 원"); 
	});

		// 주문리스트 검색 기능
		$('#txt_search').keyup(function() {
			var search = $(this).val();
			$('#order_list tr').hide();
			var view = $("#order_list > tr > td > div:contains('"+search+"')");
			$(view).closest('tr').show();
		})
		
		
		// 저장 주문 삭제 기능
		$('#save_order_list tr td a').click(function() {
			var ord_id = $(this).data('hidden');
			$.ajax({
				url : "deleteOrder",
				type : "post",
				traditional : "true",
				context: this,
				data : {
					ord_id:ord_id
				},
				success :function() {
					alert(ord_id+"번 주문\n정상적으로 삭제 되었습니다.");
					$(this).closest('tr').remove();
					
				}
			})
	})
	
	
});
// 상품 할인 적용 스크립트
function productDiscount(discount){
	var name = document.getElementById(discount.getAttribute('id')).getAttribute('id');
	var i = 0 ;
	while(!(document.getElementsByName("pdt_name")[i].value == name)){  // 어떤품목을 변경했는지 배열에서 찾는코드임
		i++;
	}
	var cost = parseInt(deleteComma(document.getElementsByName("pdt_cost")[i].value));
	var count = parseInt(deleteComma(document.getElementsByName("pdt_count")[i].value));
	cost = Math.floor(cost * (1-discount.value/10)/10)*10; 
	var sumValue = cost*count; // 상품 총액 계산기
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
	document.getElementById("sub_total").value = plusComma(price);
	document.getElementById("tlt_tax").value = price/20;
	document.getElementById("TLT_AMOUNTS").innerHTML = plusComma(price) +" 원"; // 주문 총액 적용
}

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
	var dt_price = 0;
	for (var j = 0 ; j < document.getElementsByName("dt_price").length ; j++){
		dt_price += parseInt(deleteComma(document.getElementsByName("dt_price")[j].value));
	}
	price += dt_price;
	
	var point = document.getElementById("tlt_dist").value/1;
	
	document.getElementById("total_items").value = totalItems;
	document.getElementById("total_qty").value = totalCost;
	document.getElementById("sub_total").value = plusComma(price);
	if(point > price) {
		document.getElementById("tlt_dist").value = price;
		point = price;
	}
	price -= point ;
	document.getElementById("tlt_tax").value = price/20;
	document.getElementById("TLT_AMOUNTS").innerHTML = plusComma(price) +" 원"; // 주문 총액 적용
}

	// 정규표현식이용해서 3자리 수마다 콤마(,) 삽입
function plusComma(won) {
	return won.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

}
	// 정규표현식이용해서 콤마(,) 제거
function deleteComma(won) {
	return won.replace(/,/g,"");
}
	// 포인트 사용제어
function pointSale(point) { // 포인트 사용량 적을때 동작
	var total_point = document.getElementById("balance").value.replace(/[0-9]{2}$/,"00");
	var total_price = deleteComma(document.getElementById("sub_total").value); // 상품총액
	var regex = /^[0]$|^[1-9][0-9]+[0]{2}$/; // 0 또는 1000이상 100단위 판별 정규표현식
	
	if(regex.exec(point.value)){
		if(parseInt(point.value) > parseInt(total_price)){
			point.value = total_price;
		}
	} else if (point.value == 900){
		point.value =0;
	} else if (point.value < 1000){
		point.value = 1000;
	} else {
		point.value = point.value.replace(/[0-9][1-9]$/,"00");
	}
		if(parseInt(point.value) > parseInt(total_point)) {
			point.value = total_point;
		}
	
	document.getElementById("tlt_tax").value = (total_price-point.value)/20;
	document.getElementById("TLT_AMOUNTS").innerHTML = plusComma(total_price-point.value) +" 원"; //상품총액-포인트=주문총액 적용
}


