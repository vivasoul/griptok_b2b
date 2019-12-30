package com.griptk.b2b.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.user.domain.ShipToVO;
import com.griptk.b2b.user.mapper.ShipToMapper;

@RestController
@RequestMapping("/shiptos")
public class ShipToAPI {
	@Autowired
	private ShipToMapper mapper;
	
	@PostMapping("")
	public int addShippingInfo(
			@RequestBody ShipToVO vo) {
		
		int shipto_no = mapper.selectMaxShiptoNo(vo.getUser_no());
		vo.setShipto_no(shipto_no+1);
		
		return mapper.addShippingInfo(vo);
	}
	
	@PutMapping("")
	public int shiptToChange(
			@RequestBody ShipToVO vo) {
		return mapper.changeShipTo(vo);
	}
	
	
	@GetMapping("")
	public List<ShipToVO> getShippingInfo(
			HttpSession session) {
		int user_no = (int) session.getAttribute("user_no");
		return mapper.getShippingInfo(user_no);
	}
	
	@GetMapping("/{shipto_no}")
	public ShipToVO getSpecificShippingInfo(
			@PathVariable("shipto_no") int shipto_no,
			HttpSession session) {
		
		int user_no = (int) session.getAttribute("user_no");
		ShipToVO vo = new ShipToVO();
		vo.setUser_no(user_no);
		vo.setShipto_no(shipto_no);
		return mapper.getSpecificShippingInfo(vo);
	}
	
	@DeleteMapping("")
	public int deleteBulkShippingInfo(
			HttpSession session,
			@RequestBody ShipToVO vo) {
		
		int user_no = (int) session.getAttribute("user_no");
		int result= 1;
		vo.setUser_no(user_no);
		for(int shipto_no : vo.getShipto_no_arr()) {
			vo.setShipto_no(shipto_no);
			result = mapper.deleteShippingInfo(vo);
		}
		
		return result;
	}
	
	@PutMapping("/default/{shipto_no}")
	public int changeDefaultShipping(
			@PathVariable("shipto_no") int shipto_no,
			HttpSession session) {
		
		int user_no = (int) session.getAttribute("user_no");
		
		ShipToVO vo = new ShipToVO();
		vo.setUser_no(user_no);
		vo.setShipto_no(shipto_no);
		int result = mapper.clearAllShipping(user_no);
		result = mapper.updateMainShipping(vo);
		return result;
	}
	
}
