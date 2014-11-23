package com.maxfittings.stock.model;

import java.io.Serializable;

public class CartItem implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int id;
	
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CartItem(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Override
	public boolean equals(Object item) {
		if (item == null)
			return false;
		if (!(item instanceof CartItem))
			return false;
		return this.getId() == ((CartItem)item).getId();
	}
	

}
