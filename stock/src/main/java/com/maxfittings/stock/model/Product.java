package com.maxfittings.stock.model;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class Product extends Model<Product> {

	private static final long serialVersionUID = 8382696506584783334L;
	
	public static final Product dao = new Product();
	
	public Number count(String sql, Object... paras) {
		return Db.queryNumber(sql, paras);
	}
	public Page<Product> paginate(String sql, int pageNumber, int pageSize, Object... paras) {
		return paginate(pageNumber, pageSize, "select p.*,s.quantity remain", sql, paras);
	}
}
