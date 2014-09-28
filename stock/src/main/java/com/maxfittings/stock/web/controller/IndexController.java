package com.maxfittings.stock.web.controller;


import com.jfinal.core.Controller;
import com.maxfittings.stock.model.User;


public class IndexController extends Controller {

	public void index() {
		setAttr("userPage", User.dao.paginate(getParaToInt(0, 1), 10));
		renderJsp("/index.jsp");
	}
}
