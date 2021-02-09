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
		
		$this.prop("__modal_prepared__", true);
	}	
	const ok_callback = (function(t, c){
		return function(){
			t.hide();
			c();
		}
	})($this, options["onOK"] || function(){});		
	
	$this.find(".modal-ok").on("click", ok_callback);
};

jQuery.fn.gMOpen = function(onOpen){
	const prepared = jQuery(this).prop("__modal_prepared__");
	const $this = this;
	if(prepared){
		if(onOpen instanceof Function){
			onOpen();
		}
		$this.show();
	}
};