package com.maxfittings.stock.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart<T extends CartItem> {
	
	private List<T> items = new ArrayList<T>();
	
	public List<T> getAll(){
		return items;
	}
	
	public void addItem(T item){
		if(!items.contains(item)){
			items.add(item);
		}
	}
	
	public void removeItem(int id){
		Iterator<T> ite = items.iterator();
		while(ite.hasNext()){
			T t = ite.next();
			if(id == t.getId()){
				ite.remove();
			}
		}
	}
	
	public void clear(){
		items.clear();
	}

	public Cart(){
		super();
	}
	
	public Cart(List<T> items) {
		this.items = items;
	}
	
}
