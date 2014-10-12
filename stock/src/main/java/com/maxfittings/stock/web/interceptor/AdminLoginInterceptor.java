package com.maxfittings.stock.web.interceptor;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.maxfittings.stock.ProjectConstants;

public class AdminLoginInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {
		Controller c = ai.getController();
		String admin_user = (String) c.getRequest().getSession()
				.getAttribute(ProjectConstants.SESSION_ADMIN_USER);
		if (StringUtils.isBlank(admin_user)) {
			c.redirect(ProjectConstants.BACKEND_PREFIX + "/login");
			return;
		}
		ai.invoke();
	}

}
