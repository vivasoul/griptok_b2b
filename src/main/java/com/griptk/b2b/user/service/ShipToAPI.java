package com.griptk.b2b.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@PostMapping("/shipto/add")
	public Map<String, Object> addShippingInfo(
			@RequestBody ShipToVO vo,
	        HttpServletResponse response) {
		
		int shipto_no = mapper.selectMaxShiptoNo(vo.getUser_no());
		vo.setShipto_no(shipto_no+1);
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
		
		ArrayList<ShipToVO> list = mapper.getShippingInfo(user_no);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", list);
		return resp;
	}
	
	@PostMapping("/shipto/info/{shipto_no}")
	public Map<String, Object> getSpecificShippingInfo(
			@RequestParam("user_no") int user_no,
			@PathVariable("shipto_no") int shipto_no,
	        HttpServletResponse response) {
		
		ShipToVO vo = new ShipToVO();
		vo.setUser_no(user_no);
		vo.setShipto_no(shipto_no);
		ShipToVO result= mapper.getSpecificShippingInfo(vo);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/shipto/delete/{shipto_no}")
	public Map<String, Object> deleteShippingInfo(
			@RequestParam("user_no") int user_no,
			@PathVariable("shipto_no") int shipto_no,
	        HttpServletResponse response) {
		
		ShipToVO vo = new ShipToVO();
		vo.setUser_no(user_no);
		vo.setShipto_no(shipto_no);
		int result= mapper.deleteShippingInfo(vo);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/shipto/delete/bulk")
	public Map<String, Object> deleteBulkShippingInfo(
			@RequestParam("user_no") int user_no,
			@RequestParam(value="shipto_no_arr[]") Integer[] shipto_no_arr,
	        HttpServletResponse response) {
		
		int result= 1;
		for(int shipto_no : shipto_no_arr) {
			ShipToVO vo = new ShipToVO();
			vo.setUser_no(user_no);
			vo.setShipto_no(shipto_no);
			result = mapper.deleteShippingInfo(vo);
		}
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	
	@PostMapping("/shipto/default/{shipto_no}")
	public Map<String, Object> changeDefaultShipping(
			@RequestParam("user_no") int user_no,
			@PathVariable("shipto_no") int shipto_no,
	        HttpServletResponse response) {
		
		ShipToVO vo = new ShipToVO();
		vo.setUser_no(user_no);
		vo.setShipto_no(shipto_no);
		int result = mapper.clearAllShipping(user_no);
		result = mapper.updateMainShipping(vo);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
}
