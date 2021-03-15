package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.BannerVO;
import com.griptk.b2b.product.mapper.BannerMapper;

@RestController
@RequestMapping("/banners")
public class BannerAPI {
	@Autowired
	private BannerMapper mapper;
	
	@PostMapping
	public void saveBanners(@RequestBody List<BannerVO> payload) {
		if(payload != null && !payload.isEmpty()) {
			mapper.save(payload);	
		}
		//System.out.println(payload);
	}
	
	@GetMapping
	public List<BannerVO> getBanners() {
		return mapper.list();
	}	
}
