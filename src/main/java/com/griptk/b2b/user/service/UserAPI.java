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
	@GetMapping("/sign_up/check/{biz_reg_number}")
	public int checkBizRegNumber(
			@PathVariable("biz_reg_number") String biz_reg_number) {
		
		return mapper.checkBizRegNumber(biz_reg_number);
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
	@Transactional
	@PostMapping("/sign_up/sign_up")
	public void griptokSignUp(
			@RequestPart (value="real_file") MultipartFile real_file,
			@ModelAttribute UserVO vo,
			HttpSession session,
	        HttpServletResponse response) {
		
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
		try{
			String encoded_password = loginInfo.getPasswd();
			int result = 1;
			if(!passwordEncoder.matches(passwd, encoded_password)) {
				result = 0;
			}else{
				session.setAttribute("user_no", loginInfo.getUser_no());
			}
			resp.put("aprv_status", loginInfo.getAprv_status());
			return resp;
		}catch(Exception e){
			resp.put("result", 0);
			return resp;
		}
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
		
//		Map<String, Object> resp = new HashMap<String, Object>();
//		resp.put("user_id", loginInfo.getUser_id());
//		resp.put("company_nm", loginInfo.getCompany_nm());
//		resp.put("ceo_nm", loginInfo.getCeo_nm());
//		resp.put("manager_nm", loginInfo.getManager_nm());
//		resp.put("manager_tel", loginInfo.getManager_tel());
//		resp.put("manager_email", loginInfo.getManager_email());
//		resp.put("biz_reg_number", loginInfo.getBiz_reg_number());
//		resp.put("biz_category", loginInfo.getBiz_category());
//		resp.put("file_nm", loginInfo.getFile_nm());
//		resp.put("biz_addr_1", loginInfo.getBiz_addr_1());
//		resp.put("biz_addr_2", loginInfo.getBiz_addr_2());
//		resp.put("post_code", loginInfo.getPost_code());
//		resp.put("contact_tel", loginInfo.getContact_tel());
//		resp.put("tax_email", loginInfo.getTax_email());
//		
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
	
	
	private void sendTempPassword(String email, String password) throws Exception{
		String title = "Griptok의 임시 비밀번호가 발급되었습니다.";
		StringBuilder sb = new StringBuilder();
		  sb.append("아래 임시 비밀번호를 확인해주세요 :<br/><input type='text' value='")
		  	.append(password)
		  	.append("'/>");
		mailSender.send(email, title, sb.toString());
	}
		
}
