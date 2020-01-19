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
    public FilterRegistrationBean<UserFilter> registerUserFilter(MenuManager menuMng){
        FilterRegistrationBean<UserFilter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new UserFilter());
        bean.setOrder(1);
        //bean.addUrlPatterns("/*");
        Set<String> urlPatterns = menuMng.listURLSet();
        urlPatterns.remove("/login");
        urlPatterns.remove("/sign-up");
        urlPatterns.remove("/");        
        bean.setUrlPatterns(urlPatterns);
        return bean;
    }  
    
    @Bean
    public FilterRegistrationBean<TemplateFilter> registerTemplateFilter(MenuManager menuMng, CategoryManager categoryMng){
        FilterRegistrationBean<TemplateFilter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new TemplateFilter(menuMng, categoryMng));
        bean.setOrder(2);
        //bean.addUrlPatterns("/*");
        Set<String> urlPatterns = menuMng.listURLSet();
        urlPatterns.remove("/mypage");
        bean.setUrlPatterns(urlPatterns);
        return bean;
    }
}
