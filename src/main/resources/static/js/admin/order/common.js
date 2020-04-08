const renderData = function(datas){
	const $table = jQuery("#order-list tbody");
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
				cbox.value = data["order_no"];
				cbox.className = "gtk-order-cbox";
			td1.appendChild(cbox);
			//주문번호
			const td2 = document.createElement("td");
			td2.className = "gtk-td-center";
			td2.innerHTML = data["order_no"];		
			//주문일자
			const td3 = document.createElement("td");
			td3.className = "gtk-td-center";
			td3.innerHTML = data["order_dt"];
			//주문명
			const td4 = document.createElement("td");
			td4.innerHTML = data["order_title"];
			//주문가격
			const td5 = document.createElement("td");
			td5.className = "gtk-td-center";
			td5.innerHTML = currency_formatter(data["tot_order_cost"]," 원");
			//업체명
			const td6 = document.createElement("td");
			td6.innerHTML = data["company_nm"];			
			//담당자명
			const td7 = document.createElement("td");
			td7.className = "gtk-td-center";
			td7.innerHTML = data["manager_nm"];
			//전화
			const td8 = document.createElement("td");
			td8.className = "gtk-td-center";
			td8.innerHTML = data["manager_tel"];
			//이메일
			const td9 = document.createElement("td");
			td9.className = "gtk-td-center";
			td9.innerHTML = data["manager_email"];
			//상태
			const td10 = document.createElement("td");
			td10.className = "gtk-td-center";
			td10.innerHTML = data["order_status_nm"];	
			
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

const loadList = function(page_no, status){
	jQuery.ajax({
		url: "/management/orders?page_no="+page_no+"&status="+status,
		method: "GET",
		dataType:"json"
	}).done(renderData);
};