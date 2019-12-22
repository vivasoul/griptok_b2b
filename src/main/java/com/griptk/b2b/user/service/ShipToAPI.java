package com.griptk.b2b.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.user.domain.ShipToVO;
import com.griptk.b2b.user.domain.UserVO;
import com.griptk.b2b.user.domain.WithdrawalVO;
import com.griptk.b2b.user.mapper.ShipToMapper;

@RestController
public class ShipToAPI {
	@Autowired
	private ShipToMapper mapper;
	
	@PostMapping("/Shipping/add")
	public Map<String, Object> addShippingInfo(
			@RequestBody ShipToVO vo,
	        HttpServletResponse response) {
		
		int result = mapper.addShippingInfo(vo);
		
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/shipto/change")
	public Map<String, Object> shiptToChange(
			@RequestBody ShipToVO vo,
	        HttpServletResponse response) {
		
		int result = mapper.changeShipTo(vo);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	
	@PostMapping("/shipto/info")
	public Map<String, Object> getShippingInfo(
			@RequestParam("user_no") int user_no,
	        HttpServletResponse response) {
		System.out.println("DDDDD");
		System.out.println(user_no);
		
		ArrayList<ShipToVO> list = mapper.getShippingInfo(user_no);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", list);
		return resp;
	}
	
}
