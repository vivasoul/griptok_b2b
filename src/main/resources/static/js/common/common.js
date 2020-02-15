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
