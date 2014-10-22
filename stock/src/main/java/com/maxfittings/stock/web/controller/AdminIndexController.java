package com.maxfittings.stock.web.controller;

import com.jfinal.core.Controller;
import com.maxfittings.stock.ProjectConstants;
import com.maxfittings.stock.model.Admin;

public class AdminIndexController extends Controller {

	public void index() {
		renderJsp(ProjectConstants.BACKEND_PREFIX + "/index.jsp");
	}

	public void login() {
		renderJsp(ProjectConstants.BACKEND_PREFIX + "/login.jsp");
	}

	public void loginSubmit() {
		if (Admin.dao.login(getPara("username"), getPara("password"))) {
			redirect(ProjectConstants.PRODUCT_PREFIX);
			getRequest().getSession().setAttribute(
					ProjectConstants.SESSION_ADMIN_USER, getPara("username"));
		} else {
			redirect(ProjectConstants.BACKEND_PREFIX + "/login");
		}
	}
}
