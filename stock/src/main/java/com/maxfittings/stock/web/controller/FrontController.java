package com.maxfittings.stock.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Random;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.maxfittings.stock.common.CommonUtils;
import com.maxfittings.stock.common.CookieUtil;
import com.maxfittings.stock.common.MailUtil;
import com.maxfittings.stock.model.Cart;
import com.maxfittings.stock.model.CartItem;
import com.maxfittings.stock.model.Category;
import com.maxfittings.stock.model.Product;
import com.maxfittings.stock.model.Stock;

public class FrontController extends Controller {

	private static final Map<Integer, String> CATEGORY_MAP = new HashMap<Integer, String>();

	static {
		CATEGORY_MAP.put(1, "product_standards_fq_");
		CATEGORY_MAP.put(2, "type_fq_");
		CATEGORY_MAP.put(3, "material_fq_");
		CATEGORY_MAP.put(4, "name_fq_");
		CATEGORY_MAP.put(5, "outer_diameter_fq_");
		CATEGORY_MAP.put(6, "wall_thickness_fq_");
		CATEGORY_MAP.put(7, "wall_thickness_fq_");
	}

	public void index() {
		// 构造树需要的数据结构
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "000001");
		map.put("text", "行政部");
		map.put("children", true);
		ret.add(map);
		renderJsp("/front/index.jsp");
	}
	
	public void cart(){
		renderJsp("/front/cart.jsp");
	}

	// 加载子节点
	public void loadChildrenNodes() {
		String language = CommonUtils.getLanguage(getRequest());
		// 取出所有上级条件
		String idsStr = getPara("ids");
		System.out.println("well----------------" + idsStr);
		List<Integer> idsList = new ArrayList<Integer>();
		List<Category> cates = new ArrayList<Category>();
		int maxLevel = 0;
		if (idsStr != null) {
			for (String idStr : idsStr.split(",")) {
				if (!idStr.isEmpty())
					idsList.add(Integer.valueOf(idStr));
			}
		}
		for (Integer id : idsList) {
			Category c = Category.dao.findById(id);
			cates.add(c);
			int level = c.getInt("hierarchy_num");
			if (level > maxLevel) {
				maxLevel = level;
			}
		}
		// 查询语句创建
		StringBuffer sb = new StringBuffer("select count(id) from product where 1 = 1 ");
		List<String> paras = new ArrayList<String>();
		for (Category c : cates) {
			String column_name = CATEGORY_MAP.get(c.getInt("hierarchy_num")) + language;
			String column_value = c.getStr("name_" + language);
			sb.append("and " + column_name + "=? ");
			paras.add(column_value);
		}
		// 所有下级条件
		List<Category> nextCates = Category.dao.findByHierachyNum(getParaToInt("level") == null ? (maxLevel + 1) : getParaToInt("level"));
		// 根据下层查询结果改变下层条件
		ListIterator<Category> iterator = nextCates.listIterator();
		while (iterator.hasNext()) {
			Category cate = iterator.next();
			String column_name = CATEGORY_MAP.get(cate.getInt("hierarchy_num")) + language;
			String sql = sb.toString() + "and " + column_name + "= '" + cate.getStr("name_" + language) + "' ";
			System.out.println(sql);
			int number = Product.dao.count(sql, paras.toArray(new String[0])).intValue();
			if (number == 0) {
				iterator.remove();
			}
		}
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		Random ran = new Random();
		for (Category cate : nextCates) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", ran.nextInt());
			map.put("text", cate.getStr("name_" + language));
			if (getParaToInt("condition") == 1) {
				map.put("children", cate.getInt("hierarchy_num") < 3);
			} else {
				map.put("children", cate.getInt("hierarchy_num") < 6);
			}
			// 自定义的属性
			map.put("data", cate.getLong("id"));
			ret.add(map);
		}
		renderJson(ret);
	}

	public void load456Level() {
		String language = CommonUtils.getLanguage(getRequest());
		// 树状条件
		String idsStr = getPara("ids");
		List<Integer> idsList = new ArrayList<Integer>();
		List<Category> treeCates = new ArrayList<Category>();
		if (idsStr != null) {
			for (String idStr : idsStr.split(",")) {
				if (!idStr.isEmpty())
					idsList.add(Integer.valueOf(idStr));
			}
		}
		for (Integer id : idsList) {
			Category c = Category.dao.findById(id);
			treeCates.add(c);
		}
		// 横向条件
		String idsCond = getPara("idsCond");
		List<Integer> idsCondList = new ArrayList<Integer>();
		if (idsStr != null) {
			for (String idStr : idsCond.split(",")) {
				if (!idStr.isEmpty())
					idsCondList.add(Integer.valueOf(idStr));
			}
		}
		// 四五六条件
		Category level4Cate = null;
		Category level5Cate = null;
		Category level6Cate = null;
		for (Integer id : idsCondList) {
			Category c = Category.dao.findById(id);
			if (c.getInt("hierarchy_num") == 4) {
				level4Cate = c;
			}
			if (c.getInt("hierarchy_num") == 5) {
				level5Cate = c;
			}
			if (c.getInt("hierarchy_num") == 6) {
				level6Cate = c;
			}
		}
		// 查询语句创建
		StringBuffer sb = new StringBuffer("select count(id) from product where 1 = 1 ");
		List<String> paras = new ArrayList<String>();
		for (Category c : treeCates) {
			String column_name = CATEGORY_MAP.get(c.getInt("hierarchy_num")) + language;
			String column_value = c.getStr("name_" + language);
			sb.append("and " + column_name + "=? ");
			paras.add(column_value);
		}
		// 四五六条件集合
		List<Category> level4Cates = new ArrayList<Category>();
		List<Category> level5Cates = new ArrayList<Category>();
		List<Category> level6Cates = new ArrayList<Category>();
		if(level4Cate != null){
			String column_name4 = CATEGORY_MAP.get(level4Cate.getInt("hierarchy_num")) + language;
			sb.append("and " + column_name4 + "= '" + level4Cate.getStr("name_" + language) + "' ");			
		}
		if(level5Cate != null){
			String column_name5 = CATEGORY_MAP.get(level5Cate.getInt("hierarchy_num")) + language;
			sb.append("and " + column_name5 + "= '" + level5Cate.getStr("name_" + language) + "' ");		
		}
		if(level6Cate != null){
			String column_name6 = CATEGORY_MAP.get(level6Cate.getInt("hierarchy_num")) + language;
			sb.append("and " + column_name6 + "= '" + level6Cate.getStr("name_" + language) + "' ");		
		}
		if(level4Cate == null){
			// 条件4
			level4Cates = Category.dao.findByHierachyNum(4);
			ListIterator<Category> iterator4 = level4Cates.listIterator();
			while (iterator4.hasNext()) {
				Category cate = iterator4.next();
				String column_name = CATEGORY_MAP.get(cate.getInt("hierarchy_num")) + language;
				String sql = sb.toString() + "and " + column_name + "= '" + cate.getStr("name_" + language) + "' ";
				int number = Product.dao.count(sql, paras.toArray(new String[0])).intValue();
				System.out.println("sql--4--total-"+ number +"--:" + sql);
				if (number == 0) {
					iterator4.remove();
				}
			}			
		}
		if(level5Cate == null){
			// 条件5
			level5Cates = Category.dao.findByHierachyNum(5);
			ListIterator<Category> iterator5 = level5Cates.listIterator();
			while (iterator5.hasNext()) {
				Category cate5 = iterator5.next();
				String column_name5 = CATEGORY_MAP.get(cate5.getInt("hierarchy_num")) + language;
				String sql5 = sb.toString() + "and " + column_name5 + "= '" + cate5.getStr("name_" + language) + "' ";
				int number5 = Product.dao.count(sql5, paras.toArray(new String[0])).intValue();
				System.out.println("sql--5--total-"+ number5 +"--:" + sql5);
				if (number5 == 0) {
					iterator5.remove();
				}
			}			
		}
		if(level6Cate == null){
			// 条件6
			level6Cates = Category.dao.findByHierachyNum(6);
			ListIterator<Category> iterator6 = level6Cates.listIterator();
			while (iterator6.hasNext()) {
				Category cate6 = iterator6.next();
				String column_name6 = CATEGORY_MAP.get(cate6.getInt("hierarchy_num")) + language;
				String sql6 = sb.toString() + "and " + column_name6 + "= '" + cate6.getStr("name_" + language) + "' ";
				int number6 = Product.dao.count(sql6, paras.toArray(new String[0])).intValue();
				System.out.println("sql--6--total-"+ number6 +"--:" + sql6);
				if (number6 == 0) {
					iterator6.remove();
				}
			}			
		}
		// 四五六条件数据组装
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> ret4 = new ArrayList<Map<String, Object>>();
		for (Category cate : level4Cates) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", cate.getLong("id"));
			map.put("text", cate.getStr("name_en"));
			map.put("title", cate.getStr("name_" + language));
			// 自定义的属性
			map.put("level", cate.getInt("hierarchy_num"));
			ret4.add(map);
		}
		List<Map<String, Object>> ret5 = new ArrayList<Map<String, Object>>();
		for (Category cate : level5Cates) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", cate.getLong("id"));
			map.put("text", cate.getStr("name_" + language));
			// 自定义的属性
			map.put("level", cate.getInt("hierarchy_num"));
			ret5.add(map);
		}
		List<Map<String, Object>> ret6 = new ArrayList<Map<String, Object>>();
		for (Category cate : level6Cates) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", cate.getLong("id"));
			map.put("text", cate.getStr("name_" + language));
			// 自定义的属性
			map.put("level", cate.getInt("hierarchy_num"));
			ret6.add(map);
		}
		resultMap.put("level4", ret4);
		resultMap.put("level5", ret5);
		resultMap.put("level6", ret6);
		resultMap.put("level4empty", level4Cate == null);
		resultMap.put("level5empty", level5Cate == null);
		resultMap.put("level6empty", level6Cate == null);
		renderJson(resultMap);
	}

	// 取得产品列表数据
	public void loadProducts() {
		String language = CommonUtils.getLanguage(getRequest());
		// 构建id数组
		String idsStr = getPara("ids");
		List<Integer> idsList = new ArrayList<Integer>();
		if (idsStr != null) {
			for (String idStr : idsStr.split(",")) {
				if (!idStr.isEmpty())
					idsList.add(Integer.valueOf(idStr));
			}
		}
		// 查询语句创建
		List<String> paras = new ArrayList<String>();
		StringBuffer sb = new StringBuffer("from product where 1 = 1 ");
		for (Integer id : idsList) {
			Category c = Category.dao.findById(id);
			String column_name = CATEGORY_MAP.get(c.getInt("hierarchy_num")) + language;
			String column_value = c.getStr("name_" + language);
			sb.append("and " + column_name + "=? ");
			paras.add(column_value);
		}
		sb.append("order by id asc ");
		Page<Product> page = Product.dao.paginate(sb.toString(), getParaToInt("pageno", 1), getParaToInt("pageSize", 5), paras.toArray(new String[0]));
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("language", language);
		rmap.put("page", page);
		renderJson(rmap);
	}
	
	public void addItem(){
		Cart<CartItem> cart = CookieUtil.getCart(getRequest());
		int id = getParaToInt("id");
		Product prd = Product.dao.findById(id);
		cart.addItem(new CartItem(prd.getLong("id").intValue(), prd.getStr("name")));
		CookieUtil.mergeCookie(cart, getResponse());
		renderJson(1);
	}
	
	public void removeItem(){
		Cart<CartItem> cart = CookieUtil.getCart(getRequest());
		int id = getParaToInt("id");
		cart.removeItem(id);
		CookieUtil.mergeCookie(cart, getResponse());
		renderJson(1);
	}
	
	public void clearItems(){
		Cart<CartItem> cart = CookieUtil.getCart(getRequest());
		cart.clear();
		CookieUtil.mergeCookie(cart, getResponse());
		renderJson(1);
	}
	public void getCart(){
		renderJson(CookieUtil.getCookieValue(getRequest()));
	}
	
	public void viewCart(){
		String language = CommonUtils.getLanguage(getRequest());
		List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
		Cart<CartItem> cart = CookieUtil.getCart(getRequest());
		for(CartItem item: cart.getAll()){
			Product prd = Product.dao.findById(item.getId()) ;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("stock", Stock.dao.findByProductCode(prd.getStr("product_code")).getInt("quantity"));
			map.put("name_"+language, prd.getStr("name_"+language));
			map.put("id", prd.getLong("id").intValue());
			items.add(map);
		}
		renderJson(items);
	}
	
	public void sendMail(){
		MailUtil.sendMail("题目", (List<Map<String, Long>>) new Gson().fromJson(getPara("json"), new TypeToken<List<Map<String, Long>>>(){}.getType()));
		renderJson(1);
	}
	
}
