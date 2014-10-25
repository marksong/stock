package com.maxfittings.stock.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Const;
import com.jfinal.core.Controller;
import com.maxfittings.stock.ProjectConstants;
import com.maxfittings.stock.common.CommonUtils;

public class GlobalInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {
		Controller c = ai.getController();
		HttpServletRequest request = c.getRequest();
		
		//set language
		String i18n = c.getCookie(Const.I18N_LOCALE);
		if (StringUtils.isBlank(i18n)) {
			i18n = ProjectConstants.DEFAULT_LANGUAGE;
		}
		ai.getController().setCookie(Const.I18N_LOCALE, i18n,
				Const.DEFAULT_I18N_MAX_AGE_OF_COOKIE);

		ai.invoke();
		
		//set request query string for pagination
		c.setAttr(ProjectConstants.QUERY_STRING, request.getQueryString());
		c.setAttr(ProjectConstants.LANGUAGE, CommonUtils.getLanguage(request));
	}

}
