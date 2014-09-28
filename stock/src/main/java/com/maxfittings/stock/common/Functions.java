package com.maxfittings.stock.common;

import java.util.Locale;

import com.jfinal.i18n.I18N;

public class Functions {

	public static String i18N(String key) {
		return I18N.getText(key);
	}
	
	public static String i18N(String key, String defaultValue) {
		return I18N.getText(key, defaultValue);
	}
	
	public static String i18N(String key, String defaultValue, Locale locale) {
		return I18N.getText(key, defaultValue, locale);
	}
}
