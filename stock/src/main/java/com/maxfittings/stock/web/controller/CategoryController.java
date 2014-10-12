package com.maxfittings.stock.web.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.maxfittings.stock.ProjectConstants;
import com.maxfittings.stock.model.Category;
import com.maxfittings.stock.web.interceptor.AdminLoginInterceptor;

@Before(AdminLoginInterceptor.class)
public class CategoryController extends Controller {
	public void index() {
		Integer hierarchyNum = getParaToInt("hierarchy_num");
		setAttr("page", Category.dao.paginate(getParaToInt(0, 1), 10, hierarchyNum));
		setAttr(ProjectConstants.PAGE_URL, ProjectConstants.CATEGORY_PREFIX);
		renderJsp(ProjectConstants.CATEGORY_PREFIX + "/list.jsp");
	}
	
	public void create() {
		setAttr("pageType", "create");
		renderJsp(ProjectConstants.CATEGORY_PREFIX + "/edit.jsp");
	}
	
	public void createSubmit() {
		getModel(Category.class).save();
		redirect(ProjectConstants.CATEGORY_PREFIX);
	}

	public void edit() {
		setAttr("pageType", "edit");
		setAttr("user", Category.dao.findById(getParaToInt()));
		renderJsp(ProjectConstants.CATEGORY_PREFIX + "/edit.jsp");
	}
	
	public void editSubmit() {
		getModel(Category.class).update();
		redirect(ProjectConstants.CATEGORY_PREFIX);
	}
	
	public void delete() {
		Category.dao.deleteById(getParaToInt());
		redirect(ProjectConstants.CATEGORY_PREFIX);
	}
}
