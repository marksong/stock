package com.maxfittings.stock.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class User extends Model<User> {
	
	private static final long serialVersionUID = 166910669591773340L;
	public static final User dao = new User();

	public Page<User> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `user` order by id asc");
	}
}
