package com.griptk.b2b.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.user.domain.ImageVO;
import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.mapper.UserMapper;

@RestController
@MapperScan({"com.griptk.b2b.user.mapper.*"})
public class UserAPI {
	
	@Autowired
	private UserMapper mapper;
	
	// id_check
	@PostMapping(path="/sign_up/check/id", produces="application/json")
	public Map<String, Object> checkUserId(
			@RequestParam("user_id") String user_id,
	        HttpServletResponse response) {
		
		int result = mapper.checkUserId(user_id);
		
		Map<String, Object> resp = new HashMap();
		
		resp.put("result", result);
		
		return resp;
	}
	
	// company_nm check
	@PostMapping("/sign_up/check/company_nm")
	public Map<String, Object> checkCompanyNm(
			@RequestParam("company_nm") String company_nm,
	        HttpServletResponse response) {
		
		int result = mapper.checkCompanyNm(company_nm);
		
		Map<String, Object> resp = new HashMap();
		
		resp.put("result", result);
		
		return resp;
		
	}
	
	// biz_reg_number check	
	@PostMapping("/sign_up/check/biz_reg_number")
	public Map<String, Object> checkBizRegNumber(
			@RequestParam("biz_reg_number") String biz_reg_number,
	        HttpServletResponse response) {
		
		int result = mapper.checkBizRegNumber(biz_reg_number);
		
		Map<String, Object> resp = new HashMap();
		
		resp.put("result", result);
		
		return resp;
	}
	
	// upload_file
	@PostMapping("/sign_up/upload_file")
	public void uploadFile(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
	}
	
	// sign_up
	@PostMapping("/sign_up/sign_up")
	public Map<String, Object> griptokSignUp(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {

		System.out.println(vo.toString());
		// file upload and setup File info
		
		ImageVO imgVo = new ImageVO();
		imgVo.setFile_nm("gombong");
		imgVo.setFile_format("png");
		imgVo.setFile_path("somewhere");
		imgVo.setFile_size(1000);
		imgVo.setImg_width(100);
		imgVo.setImg_height(200);
		
		int result = 1;
		
		int img_result = mapper.insertImgInfo(imgVo);
		
		int img_no = mapper.getImgNo();
		
		vo.setBiz_img_no(img_no);
		
		int user_result = mapper.signUpUser(vo);
		
		int login_result = mapper.insertLoginInfo(vo);
		
		Map<String, Object> resp = new HashMap();
		
		if(img_result==0){
			result=-1;
		}else if(user_result==0){
			result=-2;
		}else if(login_result==0){
			result=-3;
		}
		
		resp.put("result", result);
		
		return resp;
	}
	
	// find Id
	@PostMapping("/login/find/id")
	public Map<String, Object> findId(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
		String result = mapper.findId(vo);
		
		System.out.println(result);
		
		Map<String, Object> resp = new HashMap();
		
		resp.put("result", result);
		
		return resp;
	}
	
	
	// find Passwd
	@PostMapping("/login/find/passwd")
	public Map<String, Object> findPasswd(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
		String result = mapper.findPasswd(vo);
		
		Map<String, Object> resp = new HashMap();
		
		resp.put("result", result);
		
		return resp;
	}
	
	// find Passwd
	@PostMapping("/login/connect")
	public Map<String, Object> login(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
		int result = mapper.login(vo);
		
		Map<String, Object> resp = new HashMap();
		
		resp.put("result", result);
		
		return resp;
	}
		
}
