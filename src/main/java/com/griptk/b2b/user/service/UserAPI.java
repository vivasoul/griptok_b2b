package com.griptk.b2b.user.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.griptk.b2b.user.domain.ImageVO;
import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.domain.WithdrawalVO;
import com.griptk.b2b.user.mapper.UserMapper;
import com.griptk.b2b.util.mail.MailSender;
import com.griptk.b2b.util.password.PasswordGenerator;

@RestController
@MapperScan({"com.griptk.b2b.user.mapper.*"})
public class UserAPI {
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired 
	private PasswordGenerator passwordGenerator;
	
	// id_check
	@PostMapping(path="/sign_up/check/id", produces="application/json")
	public Map<String, Object> checkUserId(
			@RequestParam("user_id") String user_id,
	        HttpServletResponse response) {
		
		int result = mapper.checkUserId(user_id);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		
		resp.put("result", result);
		
		return resp;
	}
	
	// company_nm check
	@PostMapping("/sign_up/check/company_nm")
	public Map<String, Object> checkCompanyNm(
			@RequestParam("company_nm") String company_nm,
	        HttpServletResponse response) {
		
		int result = mapper.checkCompanyNm(company_nm);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		
		resp.put("result", result);
		
		return resp;
		
	}
	
	// biz_reg_number check	
	@PostMapping("/sign_up/check/biz_reg_number")
	public Map<String, Object> checkBizRegNumber(
			@RequestParam("biz_reg_number") String biz_reg_number,
	        HttpServletResponse response) {
		
		int result = mapper.checkBizRegNumber(biz_reg_number);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		
		resp.put("result", result);
		
		return resp;
	}
	
	public ImageVO uploadFile(
			MultipartFile mf) throws Exception {
		
		String uploadPath = "";
		
		// mapper
		String path = "D:\\"+"upload\\"; // 파일 업로드 경로
			
		String original = mf.getOriginalFilename(); // 업로드하는 파일 name
			
		uploadPath = path+original; // 파일 업로드 경로 + 파일 이름
		
		File imag_file = new File(uploadPath);
		
		if(imag_file.exists()){
			imag_file.delete();
		}
		
		
		mf.transferTo(imag_file); // 파일을 위에 지정 경로로 업로드
		
		BufferedImage bimg = ImageIO.read(imag_file);
		int width          = bimg.getWidth();
		int height         = bimg.getHeight();
		
		String extension = "";

		int i = original.lastIndexOf('.');
		if (i >= 0) {
		    extension = original.substring(i+1);
		}
		
		ImageVO imgVo = new ImageVO();
		imgVo.setFile_nm(original);
		imgVo.setFile_format(extension);
		imgVo.setFile_path(uploadPath);
		imgVo.setFile_size(imag_file.length());
		imgVo.setImg_width(width);
		imgVo.setImg_height(height);
		
		return imgVo;
		
	}
	
	// sign_up
	@PostMapping("/sign_up/sign_up")
	public void griptokSignUp(
			@RequestPart (value="real_file") MultipartFile real_file,
			@ModelAttribute UserVO vo,
			HttpServletRequest request,
	        HttpServletResponse response) {

		
		System.out.println(vo.toString());
		
		int result = 1;
		
		try{
			
			ImageVO imgVo = uploadFile(real_file);
			
			int img_result = mapper.insertImgInfo(imgVo);
			
			int img_no = mapper.getImgNo();
			
			vo.setBiz_img_no(img_no);
			
			String new_temp_password = passwordEncoder.encode(vo.getPasswd());
			
			vo.setPasswd(new_temp_password);
			
			int user_result = mapper.signUpUser(vo);
			
			int login_result = mapper.insertLoginInfo(vo);
			

			if(img_result==0){
				result=-1;
			}else if(user_result==0){
				result=-2;
			}else if(login_result==0){
				result=-2;
			}
			request.getSession().setAttribute("registered", "registered");
			response.sendRedirect("/login");
		}catch(Exception e){
			result = -1;
			try{
				request.getSession().setAttribute("registered", "failed");
				response.sendRedirect("/sign-up");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		
	}
	
	// find Id
	@PostMapping("/login/find/id")
	public Map<String, Object> findId(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
		String result = mapper.findId(vo);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		
		resp.put("result", result);
		
		return resp;
	}
	
	
	// find Passwd
	@PostMapping("/login/find/passwd")
	public Map<String, Object> findPasswd(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		Map<String, Object> resp = new HashMap<String, Object>();
		int result = 1;
		
		try {
			UserVO resultVo = mapper.findPasswd(vo);
			if(resultVo==null) {
				result =-2;
			}else {
				String recipient_email = resultVo.getTax_email();
				String temp_pass = passwordGenerator.generate(12);
				sendTempPassword(recipient_email, temp_pass);
				String new_temp_password = passwordEncoder.encode(temp_pass);
				resultVo.setPasswd(new_temp_password);
				result = mapper.setPasswd(resultVo);
			}
		}catch(Exception e) {
			result =-1;
		}
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/login/connect")
	public Map<String, Object> login(
			@RequestBody UserVO vo,
			HttpServletRequest request,
	        HttpServletResponse response) {
		
		String passwd = vo.getPasswd();
		String user_id = vo.getUser_id();
		
		UserVO loginInfo = mapper.getUserLoginInfo(user_id);
		Map<String, Object> resp = new HashMap<String, Object>();
		try{
			String encoded_password = loginInfo.getPasswd();
			int result = 1;
			if(!passwordEncoder.matches(passwd, encoded_password)) {
				result = 0;
			}else{
				request.getSession().setAttribute("user_no", loginInfo.getUser_no());
			}
			resp.put("aprv_status", loginInfo.getAprv_status());
			resp.put("result", result);
			return resp;
		}catch(Exception e){
			resp.put("result", 0);
			return resp;
		}
	}
	
	@PostMapping("/passwd/check")
	public Map<String, Object> passwordCheck(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		
		String passwd = vo.getPasswd();
		int user_no = vo.getUser_no();
		String encoded_password = mapper.getPassword(user_no);
		int result = 1;
		if(!passwordEncoder.matches(passwd, encoded_password)) {
			result = 0;
		}
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/passwd/change")
	public Map<String, Object> passwordChange(
			@RequestParam("old_passwd") String old_passwd,
			@RequestParam("new_passwd") String new_passwd,
			@RequestParam("user_no") int user_no,
	        HttpServletResponse response) {
		
		String encoded_password = mapper.getPassword(user_no);
		int result = 1;
		if(!passwordEncoder.matches(old_passwd, encoded_password)) {
			result = 0;
		}else{
			String new_temp_password = passwordEncoder.encode(new_passwd);
			UserVO resultVo = new UserVO();
			resultVo.setPasswd(new_temp_password);
			resultVo.setUser_no(user_no);
			result = mapper.setPasswd(resultVo);
		}
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	// withdraw 
	@PostMapping("/withdraw/load")
	public Map<String, Object> withdrawLoad(
			@RequestParam("user_no") int user_no,
	        HttpServletResponse response) {
		
		UserVO loginInfo = mapper.getUserInfo(user_no);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("user_id", loginInfo.getUser_id());
		return resp;
	}
	
	// withdraw 
	@PostMapping("/withdraw/send")
	public Map<String, Object> withdrawFromSite(
			@RequestBody WithdrawalVO vo,
	        HttpServletResponse response) {
		
		int result = mapper.insertWithdrawal(vo);
		
		result = mapper.updateStatus(vo);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	// withdraw 
	@PostMapping("/info_change/load")
	public Map<String, Object> infoChangeLoad(
			@RequestParam("user_no") int user_no,
	        HttpServletResponse response) {
		
		UserVO loginInfo = mapper.getUserInfo(user_no);
		
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("user_id", loginInfo.getUser_id());
		resp.put("company_nm", loginInfo.getCompany_nm());
		resp.put("ceo_nm", loginInfo.getCeo_nm());
		resp.put("manager_nm", loginInfo.getManager_nm());
		resp.put("manager_tel", loginInfo.getManager_tel());
		resp.put("manager_email", loginInfo.getManager_email());
		resp.put("biz_reg_number", loginInfo.getBiz_reg_number());
		resp.put("biz_category", loginInfo.getBiz_category());
		resp.put("file_nm", loginInfo.getFile_nm());
		resp.put("biz_addr_1", loginInfo.getBiz_addr_1());
		resp.put("biz_addr_2", loginInfo.getBiz_addr_2());
		resp.put("post_code", loginInfo.getPost_code());
		resp.put("contact_tel", loginInfo.getContact_tel());
		resp.put("tax_email", loginInfo.getTax_email());
		
		return resp;
	}
	
	@PostMapping("/info_change/change")
	public void griptokInfoChange(
			@RequestPart (value="real_file") MultipartFile real_file,
			@ModelAttribute UserVO vo,
			HttpServletRequest request,
	        HttpServletResponse response) {

		
		System.out.println(vo.toString());
		
		System.out.println("checking");
		System.out.println(real_file.isEmpty());
		
		int result = 1;
		
		try{
			
			int img_result = 1;
			if(!real_file.isEmpty()){
				ImageVO imgVo = uploadFile(real_file);
				imgVo.setUser_no(vo.getUser_no());
				img_result = mapper.updateImgInfo(imgVo);
			}
			
			int user_result = mapper.updateUser(vo);

			if(img_result==0){
				result=-1;
			}else if(user_result==0){
				result=-2;
			}
			request.getSession().setAttribute("info_changed", "info_changed");
			response.sendRedirect("/info");
		}catch(Exception e){
			result = -1;
			try{
				request.getSession().setAttribute("info_changed", "failed");
				response.sendRedirect("/info");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		
	}
	
	
	private void sendTempPassword(String email, String password) throws Exception{
		String title = "Griptok의 임시 비밀번호가 발급되었습니다.";
		StringBuilder sb = new StringBuilder();
		  sb.append("아래 임시 비밀번호를 확인해주세요 :<br/><input type='text' value='")
		  	.append(password)
		  	.append("'/>");
		mailSender.send(email, title, sb.toString());
	}
		
}
