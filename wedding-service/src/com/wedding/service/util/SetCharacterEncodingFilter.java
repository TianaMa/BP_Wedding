package com.wedding.service.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;



public class SetCharacterEncodingFilter implements Filter{
    private FilterConfig config;
    private String encoding;

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset="+encoding);
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig configuration) throws ServletException {
		// TODO Auto-generated method stub
		this.config=configuration;
		encoding=config.getInitParameter("encoding");
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
