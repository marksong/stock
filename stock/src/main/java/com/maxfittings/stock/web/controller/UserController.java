package com.maxfittings.stock.web.controller;

import com.jfinal.core.Controller;
import com.maxfittings.stock.ProjectConstants;
import com.maxfittings.stock.model.User;

public class UserController extends Controller {
	public void index() {
		setAttr("userPage", User.dao.paginate(getParaToInt(0, 1), 10));
		setAttr(ProjectConstants.PAGE_URL, ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX);
		renderJsp(ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX + "/list.jsp");
	}
	
	public void create() {
		setAttr("pageType", "create");
		renderJsp(ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX + "/edit.jsp");
	}
	
	public void createSubmit() {
		getModel(User.class).save();
		redirect(ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX);
	}

	public void edit() {
		setAttr("pageType", "edit");
		setAttr("user", User.dao.findById(getParaToInt()));
		renderJsp(ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX + "/edit.jsp");
	}
	
	public void editSubmit() {
		getModel(User.class).update();
		redirect(ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX);
	}
	
	public void delete() {
		User.dao.deleteById(getParaToInt());
		redirect(ProjectConstants.BACKEND_PREFIX
				+ ProjectConstants.USER_PREFIX);
	}
}
