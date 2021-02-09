const generateUploadComponents = function(type){
	const p = document.createElement("p");
		const i = document.createElement("i");
		i.className = "fa fa-upload";
		const span = document.createElement("span");
		span.className = "upload-text";
		span.innerHTML = type === "file" ? "파일을 선택하세요." : "링크를 입력하세요";
		p.appendChild(i);
		p.appendChild(span);
	const img = document.createElement("img");
	return [p, img];
};

const createUpload = function(){
		const type = jQuery(this).find("input[type='file']")[0] ? "file" : "link";
		const components = generateUploadComponents(type);
		this.appendChild(components[0]);
		this.appendChild(components[1]);
};

const onUploadFileChange = function(e){
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
			$this.find("+p+img").prop("src", defaultSrc).show().on("load", function(){ URL.revokeObjectURL(this.src); });
		}else{
			$this.find("+p").show();
			$this.find("+p+img").prop("src", "").hide();				
		}
	}
};

const onUploadLinkChange =  function(e){
	const v = e.target.value;
	$this = jQuery(this);
	if(v){
		$this.find("+p").hide();
		$this.find("+p+img").prop("src", v).show();
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
};

jQuery(document).ready(function(){
	/* initialize uploader */
	jQuery(".gtk-file-upload ").each(createUpload);
	
	/* set handler */
	jQuery(".gtk-file-upload input[type=file]").on("change", onUploadFileChange);
	jQuery(".gtk-file-upload input[type=hidden]").on("change",onUploadLinkChange);	
});