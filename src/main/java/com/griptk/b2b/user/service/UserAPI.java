package com.griptk.b2b.user.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.griptk.b2b.common.service.FileAPI;
import com.griptk.b2b.user.domain.ImageVO;
import com.griptk.b2b.user.domain.PasswdVO;
import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.domain.WithdrawalVO;
import com.griptk.b2b.user.mapper.UserMapper;
import com.griptk.b2b.util.mail.MailSender;
import com.griptk.b2b.util.password.PasswordGenerator;

@RestController
@MapperScan({"com.griptk.b2b.user.mapper.*"})
public class UserAPI {
	@Autowired 
	private FileAPI fileAPI;
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired 
	private PasswordGenerator passwordGenerator;
	
	// id_check
	@GetMapping(path="/sign_up/check/id/{user_id}")
	public int checkUserId(
			@PathVariable("user_id") String user_id) {
		
		return mapper.checkUserId(user_id);
	}
	
	// company_nm check
	@GetMapping("/sign_up/check/company_nm/{company_nm}")
	public int checkCompanyNm(
			@PathVariable("company_nm") String company_nm) {
		
		return mapper.checkCompanyNm(company_nm);
		
	}
	
	// biz_reg_number check	
	@GetMapping("/sign_up/check/biz_reg_number/{biz_reg_number}")
	public int checkBizRegNumber(
			@PathVariable("biz_reg_number") String biz_reg_number) {
		
		return mapper.checkBizRegNumber(biz_reg_number);
	}
	
	// sign_up
	@Transactional
	@PostMapping("/sign_up/sign_up")
	public void griptokSignUp(
			@RequestPart (value="real_file") MultipartFile real_file,
			@ModelAttribute UserVO vo,
			HttpSession session,
	        HttpServletResponse response) {
		
		int result = 1;
		
		try{
			ImageVO imgVO = fileAPI.uploadBizImage(real_file);
			
			vo.setBiz_img_no(imgVO.getImg_no());
			
			String new_temp_password = passwordEncoder.encode(vo.getPasswd());
			
			vo.setPasswd(new_temp_password);

			mapper.signUpUser(vo);
			mapper.insertLoginInfo(vo);

			session.setAttribute("registered", "registered");
			response.sendRedirect("/login");
		}catch(Exception e){
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = -1;
			try{
				session.setAttribute("registered", "failed");
				response.sendRedirect("/sign-up");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		
	}
	
	// find Id
	@PostMapping("/login/find/id")
	public String findId(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		return mapper.findId(vo);
		
	}
	
	
	// find Passwd
	@PostMapping("/login/find/passwd")
	public int findPasswd(
			@RequestBody UserVO vo,
	        HttpServletResponse response) {
		int result = 1;
		
		try {
			UserVO resultVo = mapper.findPasswd(vo);
			if(resultVo==null) {
				result =-2;
			}else {
				String recipient_email = resultVo.getTax_email();
//				String temp_pass = passwordGenerator.generate(12);
				sendTempPassword(recipient_email, resultVo.getUser_no(), resultVo.getPasswd());
//				String new_temp_password = passwordEncoder.encode(temp_pass);
//				resultVo.setPasswd(new_temp_password);
//				result = mapper.setPasswd(resultVo);
			}
		}catch(Exception e) {
			result =-1;
		}
		return result;
	}
	
	@PostMapping("/login/connect")
	public Map<String, Object> login(
			@RequestBody UserVO vo,
			HttpSession session) {
		
		String passwd = vo.getPasswd();
		String user_id = vo.getUser_id();
		
		UserVO loginInfo = mapper.getUserLoginInfo(user_id);
		Map<String, Object> resp = new HashMap<String, Object>();
		int result = 1;
		try{
			String encoded_password = loginInfo.getPasswd();
			if(!passwordEncoder.matches(passwd, encoded_password)) {
				result = 0;
			}else{
				session.setAttribute("user_no", loginInfo.getUser_no());
			}
			resp.put("aprv_status", loginInfo.getAprv_status());
		}catch(Exception e){
			result = 0;
		}finally{
			resp.put("result", result);
		}
		return resp;
	}
	
	@PostMapping("/passwd/check")
	public int passwordCheck(
			@RequestBody UserVO vo,
	        HttpSession session) {
		
		String passwd = vo.getPasswd();
		int user_no = (int) session.getAttribute("user_no");
		String encoded_password = mapper.getPassword(user_no);
		int result = 1;
		if(!passwordEncoder.matches(passwd, encoded_password)) {
			result = 0;
		}
		return result;
	}
	
	@PutMapping("/passwd/change")
	public int passwordChange(
			@RequestBody PasswdVO vo,
			HttpSession session
	        ) {
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		String encoded_password = mapper.getPassword(user_no);
		int result = 1;
		if(!passwordEncoder.matches(vo.getOld_passwd(), encoded_password)) {
			result = 0;
		}else{
			String new_temp_password = passwordEncoder.encode(vo.getNew_passwd());
			UserVO resultVo = new UserVO();
			resultVo.setPasswd(new_temp_password);
			resultVo.setUser_no(user_no);
			result = mapper.setPasswd(resultVo);
		}
		
		return result;
	}
	
	@PutMapping("/passwd/init")
	public int passwordInit(
			@RequestBody PasswdVO vo,
			HttpSession session
	        ) {
		
		int user_no = vo.getUser_no();
		vo.setUser_no(user_no);
		String encoded_password = mapper.getPassword(user_no);
		int result = 1;
		if(!vo.getInit_passwd().equals(encoded_password)) {
			result = 0;
		}else{
			String new_temp_password = passwordEncoder.encode(vo.getNew_passwd());
			UserVO resultVo = new UserVO();
			resultVo.setPasswd(new_temp_password);
			resultVo.setUser_no(user_no);
			result = mapper.setPasswd(resultVo);
		}
		
		return result;
	}
	
	// withdraw 
	@GetMapping("/withdraw/load")
	public String withdrawLoad(
			HttpSession session) {
		
		int user_no = (int) session.getAttribute("user_no");
		UserVO loginInfo = mapper.getUserInfo(user_no);
		
		return loginInfo.getUser_id();
	}
	
	// withdraw 
	@PostMapping("/withdraw/send")
	public int withdrawFromSite(
			@RequestBody WithdrawalVO vo) {
		
		int result = mapper.insertWithdrawal(vo);
		
		return mapper.updateStatus(vo);
	}
	
	// info_change
	@GetMapping("/info_change/load")
	public UserVO infoChangeLoad(
			HttpSession session) {
		
		int user_no = (int) session.getAttribute("user_no");
		
		UserVO loginInfo = mapper.getUserInfo(user_no);
		
		return loginInfo;
	}
	
	@PostMapping("/info_change/change")
	public void griptokInfoChange(
			@RequestPart (value="real_file") MultipartFile real_file,
			@ModelAttribute UserVO vo,
			HttpSession session,
			HttpServletResponse response) {

		
		int result = 1;
		
		try{
			
			int img_result = 1;
			if(!real_file.isEmpty()){
				ImageVO imgVo = fileAPI.uploadBizImage(real_file);
				imgVo.setUser_no(vo.getUser_no());
				img_result = mapper.updateImgInfo(imgVo);
			}
			
			int user_result = mapper.updateUser(vo);

			if(img_result==0){
				result=-1;
			}else if(user_result==0){
				result=-2;
			}
			session.setAttribute("info_changed", "info_changed");
			response.sendRedirect("/user_edit");
		}catch(Exception e){
			result = -1;
			try{
				session.setAttribute("info_changed", "failed");
				response.sendRedirect("/info");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		
	}
	
	
	private void sendTempPassword(String email, int user_no, String password) throws Exception{
		String title = "Griptok의 비밀번호 찾기 요청입니다.";
		String host = "http://localhost/login?";
		String detail = "init_no="+user_no+"&key="+password;
		
		StringBuilder sb = new StringBuilder();
		  sb.append("아래 링크버튼을 통해 비밀번호를 재설정해 주세요.<br/><a href='")
		  	.append(host)
		  	.append(detail)
		  	.append("'>비밀번호 재설정하러 가기</a>");
		mailSender.send(email, title, sb.toString());
	}
		
}
