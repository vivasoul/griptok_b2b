const currency_formatter = function(amount, unit) {
	let input = amount;
	const format_arr = [];

	while(input > 999){
		const rest = input % 1000;
		
		if(rest < 10) format_arr.push("00"+rest);
		else if(rest < 100) format_arr.push("0"+rest);
		else				format_arr.push(""+rest);
		
		input = (input - rest)/1000;
	}
	format_arr.push(""+input);
	
	return format_arr.reverse().join(",")+unit;
};

jQuery.fn.fire = function(eventName){
	
	this.each(function(){
		try{
			if ("createEvent" in document) {
			    var evt = document.createEvent("HTMLEvents");
			    evt.initEvent(eventName, false, true);
			    this.dispatchEvent(evt);
			}
			else
				this.fireEvent("on"+eventName);
		}catch(e){
			
		}
	});
	
	return this;
}

jQuery.fn.lazyVal = function(lazyVal) {
	if(lazyVal === undefined){
		const lazyVal = this.prop("lazyValue") || null;
		this.prop("lazyValue", null);
		return lazyVal;  
	}else {
		this.prop("lazyValue", lazyVal);
		return this;
	}
};

/* code.js */
const loadSelect = function(selector, url, cd_key, cd_nm_key, callback){
	cd_key = cd_key || "cd";
	cd_nm_key = cd_nm_key || "cd_nm";
	
	jQuery.ajax({
		url:url,
		method:"GET",
		dataType:"json"
	}).done(function(datas){
		const $dom = jQuery(selector);
		$dom.empty();
		const options = [];
		for(let i=0; i<datas.length; i++){
			const d = datas[i];
			const option = document.createElement("option");
			option.value = d[cd_key];
			option.innerHTML = d[cd_nm_key];
			options.push(option);
		}
		$dom.append(options);
		
		const lazyValue = $dom.lazyVal();
		if(lazyValue !== null) $dom.val(lazyValue);
		
		if(callback instanceof Function) callback();
	}).fail(function(e){
		/* error callback */
	}).always(function(e){
		/* always.. */
	});	
};


const update_pager = function($pager){
	const cur_page_no = $pager.prop(["cur-page-no"]);
	$pager.find(".gtk-pager-button").removeClass("active");
	$pager.find(".gtk-pager-button[page-no="+cur_page_no+"]").addClass("active");
	
	return cur_page_no;
};

const update_local_pager = function(pager){
	const $pager = jQuery(pager);
	const page_no = update_pager($pager);
	const callback = $pager.prop("pager-callback");
	const data = $pager.prop("pager-data");
	const ROW_PER_PAGE = $pager.prop("row-per-page");
	
	const part_data = [];
	
	const start = ROW_PER_PAGE*page_no;
	const end = ROW_PER_PAGE*(page_no+1) > data.length ? data.length : ROW_PER_PAGE*(page_no+1);
	for(let i=start;i<end;i++){
		part_data.push(data[i]);
	}
	
	callback(page_no, part_data);
};

const update_remote_pager = function(pager){
	const $pager = jQuery(pager);
	const cur_page_no = update_pager($pager);
	const callback = $pager.prop("pager-callback");
	
	callback(cur_page_no);
};

/* pager.js */
const pager_handler = {
	"prev": function(pager){
		const max_page_no = Number(pager["max-page-no"]);
		const cur_page_no = Number(pager["cur-page-no"]);
		let new_page_no = cur_page_no;
		if(cur_page_no > 0) pager["cur-page-no"] = (--new_page_no);
	},
	"number": function(pager, page_no, _update_pager){
		pager["cur-page-no"] = this.getAttribute("page-no");
	}, 
	"next": function(pager){
		const max_page_no = Number(pager["max-page-no"]);
		const cur_page_no = Number(pager["cur-page-no"]);
		let new_page_no = cur_page_no;
		if(cur_page_no < max_page_no) pager["cur-page-no"] = (++new_page_no);
	},	
};

/*
 * ts: a total row count of the data
 * ps: a paging size or a row count per page
 * mode: can be function or local data in array(if it's a function, the function(callback) receives page_no as parameter)
 * */
jQuery.fn.initPager = function(ts, ps, callback, data) {
	const MAX_PAGE = Math.ceil(ts/ps);
	const PAGER_CLS = "gtk-pager";
	const doms = [];
	
	const init = !this.prop("__pager_init__");
	
	if(init) {
		const is_local = !!data;
		
		if(this.hasClass(PAGER_CLS)) this.add(PAGER_CLS);
		this.prop("max-page-no", MAX_PAGE-1);
		this.prop("row-per-page", ps);
		this.prop("cur-page-no", 0);
		this[0]["pager-callback"] = callback;
		this.prop("pager-data", data);
		
		const prev_btn = document.createElement("a");
		prev_btn.className = "gtk-pager-prev";
			const prev_i = document.createElement("i");
			prev_i.className = "fa fa-chevron-left";
		prev_btn.appendChild(prev_i);
		if(is_local){
			prev_btn.onclick = function(e){ 
				const pager = this.parentNode;
				pager_handler["prev"](pager); 
				update_local_pager(pager);
			};
		}else{
			prev_btn.onclick = function(e){ 
				const pager = this.parentNode;
				pager_handler["prev"](pager); 
				update_remote_pager(pager);
			};			
		}
		
		const btns = document.createElement("span");
		btns.className = "gtk-pager-numbers";
		for(let i=0; i<MAX_PAGE; i++){
			const page_btn = document.createElement("a");
			if(i==0)	page_btn.className = "gtk-pager-button active";
			else		page_btn.className = "gtk-pager-button";
			
			page_btn.setAttribute("page-no", i);
			page_btn.innerHTML = i+1;
			if(is_local){
				page_btn.onclick = function(e){ 
					const pager = this.parentNode.parentNode;
					pager_handler["number"].call(this,pager); 
					update_local_pager(pager);
				};
			}else{
				page_btn.onclick = function(e){ 
					const pager = this.parentNode.parentNode;
					pager_handler["number"].call(this,pager); 
					update_remote_pager(pager);
				};			
			}	
			btns.appendChild(page_btn);
		}
		
		const next_btn = document.createElement("a");
		next_btn.className = "gtk-pager-next";
			const next_i = document.createElement("i");
			next_i.className = "fa fa-chevron-right";		
		next_btn.appendChild(next_i);
		if(is_local){
			next_btn.onclick = function(e){ 
				const pager = this.parentNode;
				pager_handler["next"](pager); 
				update_local_pager(pager);
			};
		}else{
			next_btn.onclick = function(e){ 
				const pager = this.parentNode;
				pager_handler["next"](pager); 
				update_remote_pager(pager);
			};			
		}		
		
		doms.push(prev_btn);
		doms.push(btns);
		doms.push(next_btn);
		
		this.append(doms);
		this.prop("__pager_init__", true);
	}
	
	return this;
};
		
		
jQuery.fn.updatePager = function(page_no){
	const init = this.prop("__pager_init__");
	if(init){
		const is_local = !!this.prop("pager-data");
		this.prop("cur-page-no", page_no);
		if(is_local){
			update_local_pager(this);
		}else{
			update_remote_pager(this);
		}
	}
};

jQuery.fn.reloadPager = function(ts, ps, callback, data){
	const init = this.prop("__pager_init__");
	if(init){
		this.prop("__pager_init__", false);
		this.empty();
		this.initPager(ts, ps, callback, data);	
	}
};