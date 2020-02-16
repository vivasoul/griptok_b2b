const generateUploadComponents = function(){
	const p = document.createElement("p");
		const i = document.createElement("i");
		i.className = "fa fa-upload";
		const span = document.createElement("span");
		span.className = "upload-text";
		span.innerHTML = " 파일을 드래그하세요.";
		p.appendChild(i);
		p.appendChild(span);
	const img = document.createElement("img");
	return [p, img];
}

jQuery(document).ready(function(){
	/* initialize uploader */
	jQuery(".gtk-file-upload ").each(function(){
		const components = generateUploadComponents();
		this.appendChild(components[0]);
		this.appendChild(components[1]);
	});
	
	/* set handler */
	jQuery(".gtk-file-upload input[type=file]").on("change", function(e){
		const f = e.target.files[0];
		$this = jQuery(this);
		if(f){
			const s = URL.createObjectURL(f);
			$this.find("+p").hide();
			$this.find("+p+img").prop("src", s).show();
		}else{
			const defaultSrc = $this.prop("defaultSrc");
			if(defaultSrc){
				$this.find("+p").hide();
				$this.find("+p+img").prop("src", defaultSrc).show();
			}else{
				$this.find("+p").show();
				$this.find("+p+img").prop("src", "").hide();				
			}
		}
	});
});