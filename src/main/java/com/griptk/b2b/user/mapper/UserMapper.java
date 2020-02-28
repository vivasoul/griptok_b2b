package com.griptk.b2b.user.mapper;

import com.griptk.b2b.common.domain.ImageVO;
import com.griptk.b2b.user.domain.ShipToVO;
import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.domain.WithdrawalVO;

public interface UserMapper {
	
	
	int checkUserId(String user_id);
	
	int checkCompanyNm(String company_nm);
	
	int checkBizRegNumber(String biz_reg_number);
	
	UserVO getUserLoginInfo(String user_id);
	
	String getPassword(int user_no);
	
	int login(UserVO userVo);
	
	String findId(UserVO userVo);
	
	UserVO findPasswd(UserVO userVo);
	
	int setPasswd(UserVO userVo);
	
	int updateImgInfo(ImageVO imgVo);
	
	UserVO getUserInfo(int user_no);
	
	int signUpUser(UserVO userVo); 
	
	int updateUser(UserVO userVo);
	
	int insertLoginInfo(UserVO userVo);
	
	int insertWithdrawal(WithdrawalVO withdrawlVo);
	
	int updateStatus(WithdrawalVO withdrawlVo);
	
	int addMainShippingInfo(ShipToVO vo);

}


