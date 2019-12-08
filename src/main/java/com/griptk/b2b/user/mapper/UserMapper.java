package com.griptk.b2b.user.mapper;

import com.griptk.b2b.user.domain.ImageVO;
import com.griptk.b2b.user.domain.UserVO;

public interface UserMapper {
	
	
	int checkUserId(String user_id);
	
	int checkCompanyNm(String company_nm);
	
	int checkBizRegNumber(String biz_reg_number);
	
	int login(UserVO userVo);
	
	String findId(UserVO userVo);
	
	UserVO findPasswd(UserVO userVo);
	
	int insertImgInfo(ImageVO imgVo);
	
	int getImgNo();
	
	int signUpUser(UserVO userVo);
	
	int insertLoginInfo(UserVO userVo);

}


