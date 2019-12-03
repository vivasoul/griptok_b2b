package com.griptk.b2b.user.service;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.mapper.UserMapper;

@RestController
@MapperScan({"com.griptok.b2b.user.mapper.*"})
public class UserAPI {
	
	@Autowired
	private UserMapper mapper;
	
	// id_check
	@PostMapping(path="/sign_up/check/id", produces="application/json")
	public void user_id_check(
			@RequestParam("user_id") String user_id,
	        HttpServletResponse response) {
		
		int result = mapper.checkUserId(user_id);
		
		
	}
	
	// company_nm check
	@PostMapping("/sign_up/check/company_nm")
	public void company_nm_check(
			@RequestParam("company_nm") String company_nm,
	        HttpServletResponse response) {
		
		UserVO vo = new UserVO();
		
	}
	
	// biz_reg_number check	
	@PostMapping("/sign_up/check/biz_reg_number")
	public void biz_reg_number_check(
			@RequestParam("biz_reg_number") String biz_reg_number,
	        HttpServletResponse response) {
		
		UserVO vo = new UserVO();
		
	}
	
	// upload_file
	@PostMapping("/sign_up/upload_file")
	public void upload_file(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
	}
	
	
	// email 
	
	
	
	
	@GetMapping(value= "/ajax.seo")
	public void AjaxView(  
	        @RequestParam("id") String id,
	        HttpServletResponse response)  {
		
//		
//	    String personJson;
//
//	    UserVO person = dao.getPerson(id);
//	    if(person != null){
//	        personJson = "{\"id\":\""+person.getId()
//	                    +"\",\"name\":\""+person.getName()
//	                    +"\",\"password\":\""+person.getPassword()
//	                    +"\",\"email\":\""+person.getEmail()+"\"}";
//	    }
//	    else{
//	        personJson = "null";
//	    }
//	    try {
//	        response.getWriter().print(personJson);
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    }   
	}

}
