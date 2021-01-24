package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.product.domain.OptionVO;

public interface OptionMapper {
	int insertOption(OptionVO vo);
	int deleteOption(OptionVO vo);
	int updateOption(OptionVO vo);
	
	List<OptionVO> getOptions(int product_id);
}
