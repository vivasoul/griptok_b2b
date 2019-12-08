package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.ProductVO;
import com.griptk.b2b.product.mapper.ProductMapper;

@RestController
@RequestMapping("/product")
public class ProductAPI {	
	@Autowired
	private ProductMapper mapper;
	
	@GetMapping("/new")
	public List<ProductVO> getNewProducts(){
		return mapper.listProductsByEvent("N");
	}
}
