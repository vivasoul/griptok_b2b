package com.griptk.b2b.user.mapper;

import java.util.List;

import com.griptk.b2b.user.domain.ShipToVO;

public interface ShipToMapper {
	
	
	int addShippingInfo(ShipToVO vo);
	
	List<ShipToVO> getShippingInfo(int user_no);
	
	ShipToVO getSpecificShippingInfo(ShipToVO vo);
	
	int changeShipTo(ShipToVO vo);
	
	int deleteShippingInfo(ShipToVO vo);

	int clearAllShipping(int user_no);
	
	int updateMainShipping(ShipToVO vo);
	
	int selectMaxShiptoNo(int user_no);
	
}
