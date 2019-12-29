package com.griptk.b2b.shopping.mapper;

import java.util.List;

import com.griptk.b2b.shopping.domain.InterestedVO;

public interface InterestedMapper {
	
	int addToCart(InterestedVO vo);
	
	int deleteFromInterested(InterestedVO vo);
	
	List<InterestedVO> listInterested(int user_no);

}
