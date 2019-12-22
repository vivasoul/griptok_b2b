package com.griptk.b2b.user.mapper;

import com.griptk.b2b.user.domain.ShipToVO;

public interface ShipToMapper {
	
	
	int addShippingInfo(ShipToVO vo);
	
	int changeShipTo(ShipToVO vo);

}
