package com.griptk.b2b.shopping.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.griptk.b2b.shopping.domain.CartedVO;
import com.griptk.b2b.shopping.mapper.CartMapper;

@RestController
@RequestMapping("/carteds")
@SessionAttributes({"user_no"})
public class CartAPI {
	@Autowired
	CartMapper cartMapper;
	
	/*
	 * PAYLOAD EXAMPLE
	 * [{"product_id": 1},{"product_id": 2}, ..]
	 * */
	@DeleteMapping("")
	public int delete(@ModelAttribute("user_no") int user_no ,@RequestBody List<CartedVO> list) {
		return cartMapper.deleteCarted(user_no, list);
	}

	/*
	 * PAYLOAD EXAMPLE
	 * [{"product_id": 1, "carted_cnt": 4},{"product_id": 2, "carted_cnt": 3}, ..]
	 * */
	@PostMapping("")
	public int insert(@ModelAttribute("user_no") int user_no ,@RequestBody List<CartedVO> list) {
		for(CartedVO c: list) {
			c.setUser_no(user_no);	
		}
		return cartMapper.addToCart(list);
	}
	
	/*
	 * PAYLOAD EXAMPLE
	 * [{"product_id": 1, "carted_cnt": 4},{"product_id": 2, "carted_cnt": 3}, ..]
	 * */
	@PostMapping("/fromInterested")
	public int insertFromInterested(@ModelAttribute("user_no") int user_no ,@RequestBody List<CartedVO> list) {
		System.out.println("Asdasdf" + user_no);
		for(CartedVO c: list) {
			c.setUser_no(user_no);	
		}
		return cartMapper.addToCartFromInterested(list);
	}
	
}
