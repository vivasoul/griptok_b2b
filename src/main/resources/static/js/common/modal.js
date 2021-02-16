jQuery.fn.gModal = function(options){
	options = options || {};
	const prepared = jQuery(this).prop("__modal_prepared__");
	const $this = this;
	if(!prepared){
		$this.on("click", function(e){
			if(this === e.target) {
				this.style.display = "none";
			}
		});
		
		const close_callback = (function(t){
			return function(){
				t.hide();
			}
		})($this);
		

		$this.find(".modal-close").on("click", close_callback);
		$this.prop("__modal_options__", options); 
		$this.prop("__modal_prepared__", true);
	}	
	const ok_callback = (function(t){
		return function(){
			t.hide();
			const o = t.prop("__modal_options__");
			const dummy = function(){};
			const bo = o["beforeOK"] || dummy;
			const oo = o["onOK"] || dummy;
			const ao = o["afterOK"] || dummy;
			bo();
			oo();
			ao();
		}
	})($this);		
	
	$this.find(".modal-ok").on("click", ok_callback);
};

jQuery.fn.gMOpen = function(options){
	options = options || {};
	const prepared = jQuery(this).prop("__modal_prepared__");
	const $this = this;
	if(prepared){
		const _o = $this.prop("__modal_options__");
		const bo = options["beforeOK"];
		const ao = options["afterOK"];
		
		_o["beforeOK"] = bo;
		_o["afterOK"] = ao;
		
		$this.show();
	}
};