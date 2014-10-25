package com.maxfittings.stock.model;


import com.jfinal.plugin.activerecord.Model;

public class Stock extends Model<Stock> {

	private static final long serialVersionUID = 7234091803769301098L;
	
	public static final Stock dao = new Stock();

}
