package com.maxfittings.stock.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

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
import com.maxfittings.stock.model.Stock;
import com.maxfittings.stock.web.interceptor.AdminLoginInterceptor;

@Before(AdminLoginInterceptor.class)
public class StockController extends Controller {

	private static final int PRODUCT_CODE_COLUMN = 0;
	private static final int QUANTITY_COLUMN = 1;

	private static final Logger LOG = Logger.getLogger(StockController.class);

	public void index() {
		renderJsp(ProjectConstants.STOCK_PREFIX + "/upload.jsp");
	}

	public void upload() {
		try {
			UploadFile uploadFile = getFile("uploadFile");
			if (uploadFile != null) {
				File file = uploadFile.getFile();
				HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(
						file));
				uploadWorkbook(workbook);
			}
			redirect(ProjectConstants.STOCK_PREFIX + "?success=true");
		} catch (Exception e) {
			LOG.error("error occurs when uploading product file", e);
			redirect(ProjectConstants.STOCK_PREFIX + "?success=false");
		}
	}

	private void uploadWorkbook(HSSFWorkbook workbook) throws IOException,
			FileNotFoundException {
		Db.update("truncate table stock");

		int sheetNum = workbook.getNumberOfSheets();
		for (int sn = 0; sn < sheetNum; sn++) {
			HSSFSheet sheet = workbook.getSheetAt(sn);
			uploadSheet(sheet);
		}

	}

	private void uploadSheet(HSSFSheet sheet) {
		int rowNum = sheet.getLastRowNum();
		for (int i = 1; i < rowNum; i++) {
			HSSFRow row = sheet.getRow(i);
			String productCode = getValue(row, PRODUCT_CODE_COLUMN);
			String quantity = getValue(row, QUANTITY_COLUMN);

			Stock s = new Stock();
			s.set("product_code", productCode);
			s.set("quantity", quantity);
			s.save();
		}
	}

	private String getValue(HSSFRow row, int column) {
		HSSFCell cell = row.getCell(column);
		String value = StringUtils.EMPTY;
		if (cell != null) {
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_NUMERIC:
				value = String.valueOf(cell.getNumericCellValue());
				break;
			case HSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue();
				break;
			}
		}
		return value;
	}
}
