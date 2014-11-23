package com.maxfittings.stock.common;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.maxfittings.stock.model.Cart;
import com.maxfittings.stock.model.CartItem;
public class CookieUtil {
	
	private static final String CART_TAG = "CART";
	
	public static Cart<CartItem> getCart(HttpServletRequest request) {
		String value = getCookieValue(request);
		Gson gson = new Gson();
		System.out.println("cookie value is -----"+value);
		return StringUtils.isBlank(value) ? new Cart<CartItem>():new Cart<CartItem>((List<CartItem>) gson.fromJson(value,  new TypeToken<List<CartItem>>(){}.getType()));
	}
	
	public static void mergeCookie(Cart<CartItem> cart, HttpServletResponse response){
		Gson gson = new Gson();
		setCookieValue(response, gson.toJson(cart.getAll()));
	}
	
	public static String getCookieValue(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		String value = "";
		if (cookies != null){
			for (Cookie cookie : cookies){
				if (cookie.getName().equals(CART_TAG)){
					value =  cookie.getValue();
					break;
				}
			}
		}
		return value;
	}
	
	private static void setCookieValue(HttpServletResponse response, String value){
		Cookie currentCookie = new Cookie(CART_TAG, value);
		response.addCookie(currentCookie);
	}
}
