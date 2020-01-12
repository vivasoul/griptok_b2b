package com.griptk.b2b.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.griptk.b2b.shopping.domain.InterestedVO;

public interface InterestedMapper {
	
	int insertInterested(List<InterestedVO> list);
	int deleteFromInterested(@Param("user_no") int user_no, @Param("list") List<InterestedVO> list);
	List<InterestedVO> listInterested(int user_no);

}
