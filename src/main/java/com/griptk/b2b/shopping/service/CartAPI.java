package com.griptk.b2b.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.shopping.domain.CartedVO;
import com.griptk.b2b.shopping.mapper.CartMapper;

@RestController
@RequestMapping("/carteds")
public class CartAPI {
	@Autowired
	CartMapper cartMapper;
	
	@DeleteMapping("")
	public int delete(Model model,@RequestBody CartedVO vo) {
		
		//TO-DO : get user_no from session.
		int user_no = 13;
		vo.setUser_no(user_no);
		return cartMapper.deleteCarted(vo);
	}
	
	@PostMapping("")
	public int insert(Model model,@RequestBody CartedVO vo) {
		//TO-DO : get user_no from session.
		int user_no = 13;
		vo.setUser_no(user_no);
		return cartMapper.insertInterested(vo);
	}
}
