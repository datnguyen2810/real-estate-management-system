package com.javaweb.config;

import com.javaweb.utils.ReadFileUtils;
import com.opensymphony.module.sitemesh.filter.PageFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.DispatcherType;

// Embedded Tomcat khong doc web.xml nen filter/servlet phai dang ky bang Java.
// Cach nay chay duoc ca tren embedded Tomcat lan Tomcat ngoai.
@Configuration
public class WebContainerConfig {

    @Bean
    public FilterRegistrationBean<PageFilter> sitemeshFilter() {
        FilterRegistrationBean<PageFilter> registration = new FilterRegistrationBean<>(new PageFilter());
        registration.setName("sitemesh");
        registration.addUrlPatterns("/*");
        registration.setDispatcherTypes(DispatcherType.REQUEST, DispatcherType.FORWARD);
        return registration;
    }

    @Bean
    public ServletRegistrationBean<ReadFileUtils> displayImageServlet() {
        ServletRegistrationBean<ReadFileUtils> registration = new ServletRegistrationBean<>(new ReadFileUtils(), "/repository/*");
        registration.setName("DisplayImage");
        return registration;
    }
}
