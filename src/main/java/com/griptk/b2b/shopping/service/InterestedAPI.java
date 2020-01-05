package com.griptk.b2b.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.griptk.b2b.shopping.domain.InterestedVO;
import com.griptk.b2b.shopping.mapper.InterestedMapper;

@RestController
@RequestMapping("/interesteds")
@SessionAttributes({"user_no"})
public class InterestedAPI {
	
	@Autowired
	private InterestedMapper mapper;

	@GetMapping("")
	public List<InterestedVO> listInterested(@ModelAttribute("user_no") int user_no) {
		return mapper.listInterested(user_no);
	}
	
	/*
	 * PAYLOAD EXAMPLE
	 * [{"product_id": 1},{"product_id": 2}, ..]
	 * */	
	@PostMapping("")
	public int addToInterested(
			@ModelAttribute("user_no") int user_no,
			@RequestBody List<InterestedVO> list) {
		
		for(InterestedVO inter : list) {
			inter.setUser_no(user_no);
		}
		return mapper.insertInterested(list);
	}
	
	/*
	 * PAYLOAD EXAMPLE
	 * [{"product_id": 1},{"product_id": 2}, ..]
	 * */	
	@DeleteMapping("")
	public int deleteBulkInterestedInfo(
			@ModelAttribute("user_no") int user_no,
			@RequestBody List<InterestedVO> list
	        ) {
		return mapper.deleteFromInterested(user_no, list);
	}
	
	@ModelAttribute("user_no")
	private int getUserNo() {
		return 27;
	}
}
