package com.maxfittings.stock.web.tag;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.jfinal.core.Const;
import com.jfinal.i18n.I18N;
import com.maxfittings.stock.common.CommonUtils;

public class Message extends BodyTagSupport {

	private static final long serialVersionUID = -3993221923259937970L;

	private String key;

	@Override
	public int doStartTag() throws JspException {
		String language = CommonUtils.getCookie(
				(HttpServletRequest) pageContext.getRequest(),
				Const.I18N_LOCALE);
		try {
			pageContext
					.getOut()
					.append(I18N.getText(key,
							new Locale.Builder().setLanguage(language).build()))
					.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
