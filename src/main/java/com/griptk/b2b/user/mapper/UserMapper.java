package com.griptk.b2b.user.mapper;

import com.griptk.b2b.user.domain.ImageVO;
import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.domain.WithdrawalVO;

public interface UserMapper {
	
	
	int checkUserId(String user_id);
	
	int checkCompanyNm(String company_nm);
	
	int checkBizRegNumber(String biz_reg_number);
	
	String getPassword(String user_id);
	
	int login(UserVO userVo);
	
	String findId(UserVO userVo);
	
	UserVO findPasswd(UserVO userVo);
	
	int setPasswd(UserVO userVo);
	
	int insertImgInfo(ImageVO imgVo);
	
	int getImgNo();
	
	UserVO getUserInfo(int user_no);
	
	int signUpUser(UserVO userVo);
	
	int insertLoginInfo(UserVO userVo);
	
	int insertWithdrawal(WithdrawalVO withdrawlVo);

}


