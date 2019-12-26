package com.griptk.b2b.util.filter;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.griptk.b2b.util.manager.CategoryManager;
import com.griptk.b2b.util.manager.MenuManager;

@Configuration
public class UtilFilterBean {
	
    @Bean
    @Autowired
    public FilterRegistrationBean<TemplateFilter> registerTemplateFilter(MenuManager menuMng, CategoryManager categoryMng){
        FilterRegistrationBean<TemplateFilter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new TemplateFilter(menuMng, categoryMng));
        //bean.addUrlPatterns("/*");
        Set<String> urlPatterns = menuMng.listURLSet();
        urlPatterns.remove("/mypage");
        bean.setUrlPatterns(urlPatterns);
        return bean;
    } 
}
