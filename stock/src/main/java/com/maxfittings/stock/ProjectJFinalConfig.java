package com.maxfittings.stock;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.i18n.I18N;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.maxfittings.stock.model.User;
import com.maxfittings.stock.web.controller.IndexController;
import com.maxfittings.stock.web.controller.UserController;
import com.maxfittings.stock.web.interceptor.GlobalInterceptor;

public class ProjectJFinalConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		loadPropertyFile("application.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setDevMode(true);
		I18N.init("base", null, null);
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new GlobalInterceptor());
	}

	@Override
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
				getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		arp.addMapping("user", User.class);
	}

	@Override
	public void configRoute(Routes me) {
		me.add("/", IndexController.class);
		me.add(ProjectConstants.BACKEND_PREFIX + ProjectConstants.USER_PREFIX, UserController.class);
	}

}
