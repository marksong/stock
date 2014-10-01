package com.maxfittings.stock.web.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.config.Interceptors;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Const;
import com.jfinal.core.Controller;

public class GlobalInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {
		Controller c = ai.getController();
		String tmp = c.getCookie(Const.I18N_LOCALE);
		String i18n = c.getRequest().getLocale().toString();
		if (!i18n.equals(tmp)) {
			ai.getController().setCookie(Const.I18N_LOCALE, i18n,
					Const.DEFAULT_I18N_MAX_AGE_OF_COOKIE);
		}
		ai.invoke();
	}

}
