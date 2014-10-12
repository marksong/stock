package com.maxfittings.stock.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Admin extends Model<Admin> {

	private static final long serialVersionUID = 1824695505581079222L;

	public static final Admin dao = new Admin();

	public boolean login(String username, String password) {
		int count = Db.queryLong(
				"select count(1) from admin where username=? and password=?",
				username, password).intValue();
		return count > 0;
	}
}
