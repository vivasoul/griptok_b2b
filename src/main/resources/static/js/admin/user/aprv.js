const renderData = function(datas){
	const $table = jQuery("#user-list tbody");
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
				cbox.value = data["user_no"];
				cbox.className = "gtk-user-cbox";
			td1.appendChild(cbox);
			//아이디
			const td2 = document.createElement("td");
			td2.className = "gtk-td-center";
			td2.innerHTML = data["user_id"];
			//회사명
			const td3 = document.createElement("td");
			td3.innerHTML = data["company_nm"];
			//대표자명
			const td4 = document.createElement("td");
			td4.className = "gtk-td-center";
			td4.innerHTML = data["ceo_nm"];
			//주소
			const td5 = document.createElement("td");
			td5.innerHTML = data["biz_addr_1"];			
			//담당자명
			const td6 = document.createElement("td");
			td6.className = "gtk-td-center";
			td6.innerHTML = data["manager_nm"];
			//전화
			const td7 = document.createElement("td");
			td7.className = "gtk-td-center";
			td7.innerHTML = data["manager_tel"];
			//이메일
			const td8 = document.createElement("td");
			td8.className = "gtk-td-center";
			td8.innerHTML = data["manager_email"];
			//가입일자
			const td9 = document.createElement("td");
			td9.className = "gtk-td-center";
			td9.innerHTML = data["reg_dt"];
	
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		tr.appendChild(td7);
		tr.appendChild(td8);
		tr.appendChild(td9);
			
		rows.push(tr);	
	}
	$table.append(rows);	
};

const loadList = function(){
	jQuery.ajax({
		url: "/users/aprv",
		method: "GET",
		dataType:"json"
	}).done(renderData);
};

const aprvUsers = function(datas){
	const reqObj = {
			method: "PUT",
			contentType: "application/json"
	};
	
	if(datas instanceof Array){ 
		reqObj["url"] = "/users/aprv";
		reqObj["data"] = JSON.stringify(datas); 	
	}else{
		reqObj["url"] = "/users/aprv/all";
	}
	
	jQuery.ajax(reqObj).done(function(res){
		alert("성공적으로 승인되었습니다.");
		loadList();
		getMonitorCount();
	});	
};