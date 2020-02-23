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
