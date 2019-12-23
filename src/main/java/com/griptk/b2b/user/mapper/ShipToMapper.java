package com.griptk.b2b.user.mapper;

import java.util.ArrayList;

import com.griptk.b2b.user.domain.ShipToVO;

public interface ShipToMapper {
	
	
	int addShippingInfo(ShipToVO vo);
	
	ArrayList<ShipToVO> getShippingInfo(int user_no);
	
	int changeShipTo(ShipToVO vo);

}
