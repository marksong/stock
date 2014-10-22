package com.maxfittings.stock.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.maxfittings.stock.ProjectConstants;
import com.maxfittings.stock.model.Category;
import com.maxfittings.stock.model.Product;
import com.maxfittings.stock.web.interceptor.AdminLoginInterceptor;

@Before(AdminLoginInterceptor.class)
public class ProductController extends Controller {

	private static final int PRODUCT_CODE_COLUMN = 2;
	private static final int MATERIAL_COLUMN = 3;
	private static final int TYPE_COLUMN = 4;
	private static final int NAME_ZH_COLUMN = 5;
	private static final int OUTER_DIAMETER_COLUMN = 10;
	private static final int WALL_THICKNESS_COLUMN = 12;
	private static final int PRODUCT_STANDARDS_COLUMN = 22;
	private static final int NAME_EN_COLUMN = 27;

	private static final Logger LOG = Logger.getLogger(ProductController.class);

	public void index() {
		renderJsp(ProjectConstants.PRODUCT_PREFIX + "/upload.jsp");
	}

	public void upload() {
		try {
			UploadFile uploadFile = getFile("uploadFile");
			if (uploadFile != null) {
				List<Category> productStandardsCategories = Category.dao
						.findByHierachyNum(1);
				List<Category> typeCategories = Category.dao
						.findByHierachyNum(2);
				List<Category> materialCategories = Category.dao
						.findByHierachyNum(3);
				List<Category> nameCategories = Category.dao
						.findByHierachyNum(4);
				List<Category> outerDiameterCategories = Category.dao
						.findByHierachyNum(5);
				List<Category> wallThicknessCategories = Category.dao
						.findByHierachyNum(6);
				Db.update("truncate table product");
				File file = uploadFile.getFile();
				HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(
						file));
				HSSFSheet sheet = workbook.getSheetAt(0);
				int rowNum = sheet.getLastRowNum();
				for (int i = 1; i < rowNum - 1; i++) {
					HSSFRow row = sheet.getRow(i);
					String productCode = getValue(row, PRODUCT_CODE_COLUMN);
					String productStandards = getValue(row,
							PRODUCT_STANDARDS_COLUMN);
					String type = getValue(row, TYPE_COLUMN);
					String material = getValue(row, MATERIAL_COLUMN);
					String nameZh = getValue(row, NAME_ZH_COLUMN);
					String outerDiameter = getValue(row, OUTER_DIAMETER_COLUMN);
					String wallThickness = getValue(row, WALL_THICKNESS_COLUMN);
					String nameEn = getValue(row, NAME_EN_COLUMN);

					String[] productStandardsFQ = getFQ(
							productStandardsCategories, StringUtils.substring(
									productStandards, 0,
									StringUtils.indexOf(productStandards, " ")));
					String[] typeFQ = getFQ(typeCategories, type);
					String[] materialFQ = null;
					if (StringUtils.equals(material, "*****")) {
						materialFQ = getFQ(materialCategories, "else");
					} else {
						materialFQ = getFQ(materialCategories, material, 5);

					}
					String[] nameFQ = getFQ(nameCategories,
							StringUtils.trim(nameZh));
					String[] outerDiameterFQ = getFQ(outerDiameterCategories,
							outerDiameter);
					String[] wallThicknessFQ = getFQ(wallThicknessCategories,
							wallThickness);

					Product p = new Product();
					p.set("product_code", productCode);
					p.set("product_standards", productStandards);
					p.set("type", type);
					p.set("material", material);
					p.set("name_zh", nameZh);
					p.set("outer_diameter", outerDiameter);
					p.set("wall_thickness", wallThickness);
					p.set("name_en", nameEn);
					p.set("product_code", productCode);
					p.set("product_standards_fq_zh", productStandardsFQ[0]);
					p.set("product_standards_fq_en", productStandardsFQ[1]);
					p.set("type_fq_zh", typeFQ[0]);
					p.set("type_fq_en", typeFQ[1]);
					p.set("material_fq_zh", materialFQ[0]);
					p.set("material_fq_en", materialFQ[1]);
					p.set("name_fq_zh", nameFQ[0]);
					p.set("name_fq_en", nameFQ[1]);
					p.set("outer_diameter_fq_zh", outerDiameterFQ[0]);
					p.set("outer_diameter_fq_en", outerDiameterFQ[1]);
					p.set("wall_thickness_fq_zh", wallThicknessFQ[0]);
					p.set("wall_thickness_fq_en", wallThicknessFQ[1]);
					p.save();
				}
			}
			redirect(ProjectConstants.PRODUCT_PREFIX + "?success=true");
		} catch (Exception e) {
			LOG.error("error occurs when uploading product file", e);
			redirect(ProjectConstants.PRODUCT_PREFIX + "?success=false");
		}
	}

	private String getValue(HSSFRow row, int column) {
		HSSFCell cell = row.getCell(column);
		if (cell != null) {
			String value = cell.getStringCellValue();
			return value;
		}
		return StringUtils.EMPTY;
	}

	private String[] getFQ(List<Category> categories, String value) {
		return getFQ(categories, value, StringUtils.length(value));
	}

	private String[] getFQ(List<Category> categories, String value, int length) {
		for (Category category : categories) {
			if (StringUtils.equals(StringUtils.substring(
					(String) category.get("name_zh"), 0, length), StringUtils
					.substring(value, 0, length))) {
				return new String[] { category.get("name_zh"),
						category.get("name_en") };
			}
		}
		return new String[] { StringUtils.EMPTY, StringUtils.EMPTY };
	}
}
