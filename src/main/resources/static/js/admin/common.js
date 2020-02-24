const refreshConfig = function(config_type){
	jQuery.ajax({
		  url: "/configs/refresh?config_type="+config_type,
		  method: "GET",
		  dataType: "json"
	}).done(function(datas){
		
	}).fail(function(e){
		console.log(e);
	}).always(function(){

	});
};