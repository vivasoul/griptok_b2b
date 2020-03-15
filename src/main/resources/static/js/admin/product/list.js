const getProductURL = function(product_id, dc_only){
	const query = location.search.replace(/[?]/,"");
	let url = null;
	if(dc_only === true){
		url = "/admin/dc-products/edit?product_id="+product_id;
	}else{
		url = "/admin/products/edit?product_id="+product_id;
	}
	return url;
};

const renderData = function(datas, is_dc){
	
	const $table = jQuery("#all-product-list tbody");
	$table.empty();
	
	const rows = [];
	for(let i=0;i<datas.length;i++){
		const data = datas[i];
		
		const tr = document.createElement("tr");
			//선택
			const td1 = document.createElement("td");
			td1.className = "gtk-td-center";
				const cbox = document.createElement("input");
				cbox.type = "checkbox";
				cbox.className = "gtk-product-cbox";
			td1.appendChild(cbox);
			//수정
			const td2 = document.createElement("td");
			td2.className = "gtk-td-center product-edit-btn";
				const anchor = document.createElement("a");
				anchor.href = getProductURL(data["product_id"], is_dc);
					const btn = document.createElement("button");
					btn.type = "button";
					btn.className = "gtk-btn gtk-btn-blue";
					btn.innerHTML = "수정";
				anchor.appendChild(btn);
			td2.appendChild(anchor);
			//상품번호
			const td3 = document.createElement("td");
			td3.className = "gtk-td-center";
			td3.innerHTML = data["product_id"];
			//상품명
			const td4 = document.createElement("td");
			td4.innerHTML = data["title"];
			//판매상태
			const td5 = document.createElement("td");
			td5.className = "gtk-td-center";
			td5.innerHTML = "판매중";
			//재고수량
			const td6 = document.createElement("td");
			td6.className = "gtk-td-right";
			td6.innerHTML = data["stock_cnt"];			
			//소비자가
			const td7 = document.createElement("td");
			td7.className = "gtk-td-right";
			td7.innerHTML = data["retail_price"];
			//판매가
			const td8 = document.createElement("td");
			td8.className = "gtk-td-right";
			td8.innerHTML = data["sales_price"];
			//상품 등록일
			const td9 = document.createElement("td");
			td9.className = "gtk-td-center";
			td9.innerHTML = data["reg_dt"];
			//최종 수정일
			const td10 = document.createElement("td");
			td10.className = "gtk-td-center";
			td10.innerHTML = data["upd_dt"];
	
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		tr.appendChild(td7);
		tr.appendChild(td8);
		tr.appendChild(td9);
		tr.appendChild(td10);
			
		rows.push(tr);	
	}
	$table.append(rows);
};

const loadList = function(render_id, page_no){
	const limit = jQuery("#v_row_per_page").val();
	
	jQuery.ajax({
	  url: "/products?page="+page_no+"&limit="+limit,
	  method: "GET",
	  dataType: "json"
	}).done(renderData).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});
};

const loadListDC = function(render_id, page_no){
	const limit = jQuery("#v_row_per_page").val();
	
	jQuery.ajax({
	  url: "/products/dc?page="+page_no+"&limit="+limit,
	  method: "GET",
	  dataType: "json"
	}).done(function(datas){
		renderData(datas, true);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});
};
