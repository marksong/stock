package com.maxfittings.stock.model;


import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Model;

public class Stock extends Model<Stock> {

	private static final long serialVersionUID = 7234091803769301098L;
	
	public static final Stock dao = new Stock();
	
	public Stock findByProductCode(String productCode) {
		return StringUtils.isBlank(productCode) ? null:findFirst("select * from stock where product_code=?", productCode);
	}
}
