package org.nimhans.NIMHANSproject;


import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.Response.Status;


@Provider
public class ValidateFilter implements ContainerRequestFilter{

	@Context
    HttpServletRequest request;
	HttpServletResponse response;
	FilterChain chain;

	
	@Override
	public void filter(ContainerRequestContext requestContext) throws IOException {
		// TODO Auto-generated method stub
		ResponseBuilder responseBuilder = null;

		try {
				Response response = null;

				HttpSession session = request.getSession();
				String uname = (String) session.getAttribute("uname");
				if(uname == null)  {
					System.out.println("please login first");  
					responseBuilder = Response.serverError();
					response = responseBuilder.status(Status.BAD_REQUEST).entity("Please login to continue.").build();
					requestContext.abortWith(response);
				 }
				else {
					System.out.println("Hello" + uname);
					//chain.doFilter(request, (ServletResponse) response);
				}

		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
