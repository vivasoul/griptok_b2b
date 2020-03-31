const loadData = function(){
	jQuery.ajax({
        url : "/info_change/load",
        type: "get",
        success : function(data){
        	jQuery("#user_id").val(data.user_id);
        	jQuery("#ceo_nm").val(data.ceo_nm);
        	jQuery("#company_nm").val(data.company_nm);
        	jQuery("#manager_nm").val(data.manager_nm);
        	jQuery("#manager_tel").val(data.manager_tel);
        	jQuery("#manager_email").val(data.manager_email);
        	jQuery("#biz_reg_number").val(data.biz_reg_number);
        	jQuery("#biz_category").val(data.biz_category);
        	jQuery("#file_nm").val(data.file_nm);
        	jQuery("#post_code").val(data.post_code);
        	jQuery("#address").val(data.biz_addr_1);
        	jQuery("#address_etc").val(data.biz_addr_2);
        	jQuery("#contact_tel").val(data.contact_tel);
        	jQuery("#tax_email").val(data.tax_email);
        	jQuery("#user_no").val(data.user_no);
        }
    });
};

const update = function(){
	
};