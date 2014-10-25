package com.maxfittings.stock.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Const;

public class CommonUtils {
	public static String getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null)
			for (Cookie cookie : cookies)
				if (cookie.getName().equals(name))
					return cookie.getValue();
		return null;
	}
	
	public static String getLanguage(HttpServletRequest request) {
		return getCookie(request, Const.I18N_LOCALE);
	}
}
