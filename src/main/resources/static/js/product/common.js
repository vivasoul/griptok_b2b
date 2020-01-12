const moveToCart = function(product_id, carted_cnt) {
	jQuery.ajax({
		  url: "/carteds",
		  method: "POST",
		  contentType: "application/json",
		  data: JSON.stringify([
			  {"product_id":product_id, "carted_cnt": carted_cnt}
		  ])
		}).done(function(e){
			alert("해당 상품을 장바구니에 추가하였습니다.");
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});	
};

const moveToInterested = function(product_id) {
	jQuery.ajax({
		  url: "/interesteds",
		  method: "POST",
		  contentType: "application/json",
		  data: JSON.stringify([
			  {"product_id":product_id}
		  ])
		}).done(function(e){
			alert("해당 상품을 관심상품에 추가하였습니다.");
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});	
};