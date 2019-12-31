package com.griptk.b2b.shopping.mapper;

import java.util.List;

import com.griptk.b2b.shopping.domain.CartedVO;

public interface CartMapper {

	List<CartedVO> listCarted(int user_no);
	
	int deleteCarted(CartedVO vo);

	int insertInterested(CartedVO vo);
}
