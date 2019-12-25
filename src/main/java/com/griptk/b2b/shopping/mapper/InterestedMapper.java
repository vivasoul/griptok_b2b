package com.griptk.b2b.shopping.mapper;

import java.util.ArrayList;

import com.griptk.b2b.shopping.domain.InterestedVO;

public interface InterestedMapper {
	
	int addToCart(InterestedVO vo);
	
	int deleteFromInterested(InterestedVO vo);
	
	ArrayList<InterestedVO> getInterestedInfo(int user_no);

}
