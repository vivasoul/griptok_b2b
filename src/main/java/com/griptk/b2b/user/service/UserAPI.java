package com.griptk.b2b.user.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	public ImageVO uploadFile(
			MultipartFile mf) throws Exception {
		
		String uploadPath = "";
		
		String path = "D:\\"+"upload\\"; // 파일 업로드 경로
			
		String original = mf.getOriginalFilename(); // 업로드하는 파일 name
			
		System.out.println("!!!!!!!!!!"+original);	// file original name
		System.out.println("!!!!!!!!!!"+mf.getSize());// file size
			
		uploadPath = path+original; // 파일 업로드 경로 + 파일 이름
		
		File imag_file = new File(uploadPath);
		try {
			mf.transferTo(imag_file); // 파일을 위에 지정 경로로 업로드
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	        HttpServletResponse response) {

		
		System.out.println("Checking =============");
		
		System.out.println(vo.toString());
		
		Map<String, Object> resp = new HashMap();
		int result = 1;
		try{
			ImageVO imgVo = uploadFile(real_file);
			
			int img_result = mapper.insertImgInfo(imgVo);
			
			int img_no = mapper.getImgNo();
			
			vo.setBiz_img_no(img_no);
			
			int user_result = mapper.signUpUser(vo);
			
			int login_result = mapper.insertLoginInfo(vo);
			

			if(img_result==0){
				result=-1;
			}else if(user_result==0){
				result=-2;
			}else if(login_result==0){
				result=-3;
			}
			response.sendRedirect("/login");
		}catch(Exception e){
			try{
				response.sendRedirect("/register");
			}catch(Exception re){
				
			}
		}
		
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
