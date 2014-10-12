package com.maxfittings.stock.model;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Category extends Model<Category> {

	private static final long serialVersionUID = 6445512961925725036L;

	public static final Category dao = new Category();

	public Page<Category> paginate(int pageNumber, int pageSize,
			Integer hierarchyNum) {
		StringBuilder whereCondition = new StringBuilder("where 1=1");
		List<Object> paras = new ArrayList<Object>(0);
		if (hierarchyNum != null) {
			paras.add(hierarchyNum);
			whereCondition.append(" and hierarchy_num=?");
		}
		String sqlExceptSelect = String
				.format("from `category` %s order by hierarchy_num asc, sort_order asc",
						whereCondition);
		return paginate(pageNumber, pageSize, "select *", sqlExceptSelect,
				paras.toArray());
	}
}
