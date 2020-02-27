package com.griptk.b2b.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.common.domain.MonitorVO;
import com.griptk.b2b.common.mapper.AdminMapper;

@RestController
@RequestMapping("/admin")
public class AdminAPI {
	@Autowired
	private AdminMapper mapper;
	
	@GetMapping("/monitor")
	public MonitorVO getMonitorCount() {
		return mapper.getMonitorCount();
	}	
}
