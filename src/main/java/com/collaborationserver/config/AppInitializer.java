package com.collaborationserver.config;

import javax.servlet.Filter;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.collaborationserver.config.CORSFilter;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer 
{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
	 @Override
	    protected Filter[] getServletFilters() {
	    	Filter [] singleton = { new CORSFilter() };
	    	return singleton;
		}

}