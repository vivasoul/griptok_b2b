package com.griptk.b2b.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.griptk.b2b.shopping.domain.CartedVO;

public interface CartMapper {

	List<CartedVO> listCarted(int user_no);
	
	int deleteCarted(@Param("user_no") int user_no, @Param("list") List<CartedVO> list);

	int addToCart(List<CartedVO> list);
}
