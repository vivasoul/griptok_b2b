package com.griptk.b2b.shopping.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.shopping.domain.InterestedVO;
import com.griptk.b2b.shopping.mapper.InterestedMapper;
import com.griptk.b2b.user.domain.ShipToVO;
import com.griptk.b2b.user.mapper.ShipToMapper;

@RestController
public class InterestedAPI {
	
	@Autowired
	private InterestedMapper mapper;

	@PostMapping("/interested/info")
	public Map<String, Object> getShippingInfo(
			@RequestParam("user_no") int user_no,
	        HttpServletResponse response) {
		
		ArrayList<InterestedVO> list = mapper.getInterestedInfo(user_no);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", list);
		return resp;
	}
	
	@PostMapping("/interested/add/bulk")
	public Map<String, Object> addToCartBulk(
			@RequestParam("user_no") int user_no,
			@RequestParam(value="product_id_arr[]") Integer[] product_id_arr,
	        HttpServletResponse response) {
		
		int result = 1;
		InterestedVO vo = new InterestedVO();
		vo.setUser_no(user_no);
		for(int product_id : product_id_arr) {
			vo.setProduct_id(product_id);
			result = mapper.addToCart(vo);
			result = mapper.deleteFromInterested(vo);
		}
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/interested/add/{product_id}")
	public Map<String, Object> addToCart(
			@RequestParam("user_no") int user_no,
			@PathVariable("product_id") int product_id,
	        HttpServletResponse response) {
		
		InterestedVO vo = new InterestedVO();
		vo.setUser_no(user_no);
		vo.setProduct_id(product_id);
		int result = mapper.addToCart(vo);
		result = mapper.deleteFromInterested(vo);
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/interested/delete/{product_id}")
	public Map<String, Object> deleteShippingInfo(
			@RequestParam("user_no") int user_no,
			@PathVariable("product_id") int product_id,
	        HttpServletResponse response) {
		
		InterestedVO vo = new InterestedVO();
		vo.setUser_no(user_no);
		vo.setProduct_id(product_id);;
		int result= mapper.deleteFromInterested(vo);
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}
	
	@PostMapping("/interested/delete/bulk")
	public Map<String, Object> deleteBulkInterestedInfo(
			@RequestParam("user_no") int user_no,
			@RequestParam(value="product_id_arr[]") Integer[] product_id_arr,
	        HttpServletResponse response) {
		
		int result= 1;
		InterestedVO vo = new InterestedVO();
		vo.setUser_no(user_no);
		for(int product_id : product_id_arr) {
			vo.setProduct_id(product_id);
			result = mapper.deleteFromInterested(vo);
		}
		
		Map<String, Object> resp = new HashMap<String, Object>();
		resp.put("result", result);
		return resp;
	}

}
