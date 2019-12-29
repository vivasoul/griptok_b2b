package com.griptk.b2b.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.shopping.domain.InterestedVO;
import com.griptk.b2b.shopping.mapper.InterestedMapper;

@RestController
@RequestMapping("/interesteds")
public class InterestedAPI {
	
	@Autowired
	private InterestedMapper mapper;

	@GetMapping("")
	public List<InterestedVO> getShippingInfo(
			HttpSession session) {
		int user_no = (int) session.getAttribute("user_no");
		return mapper.listInterested(user_no);
	}
	
	@PostMapping("")
	public int addToCartBulk(
			HttpSession session,
			@RequestParam(value="product_id_arr[]") Integer[] product_id_arr) {
		
		int result = 1;
		int user_no = (int) session.getAttribute("user_no");
		InterestedVO vo = new InterestedVO();
		vo.setUser_no(user_no);
		for(int product_id : product_id_arr) {
			vo.setProduct_id(product_id);
			result = mapper.addToCart(vo);
			result = mapper.deleteFromInterested(vo);
		}
		
		return result;
	}

	
	@DeleteMapping("")
	public int deleteBulkInterestedInfo(
			HttpSession session,
			@RequestParam(value="product_id_arr[]") Integer[] product_id_arr
	        ) {
		
		int user_no = (int) session.getAttribute("user_no");
		int result= 1;
		InterestedVO vo = new InterestedVO();
		vo.setUser_no(user_no);
		for(int product_id : product_id_arr) {
			vo.setProduct_id(product_id);
			result = mapper.deleteFromInterested(vo);
		}
		
		return result;
	}

}
