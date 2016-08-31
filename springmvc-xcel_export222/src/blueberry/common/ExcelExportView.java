package blueberry.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelExportView extends AbstractExcelView{
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
	
		Map<String,String> valueMap = (Map<String,String>) model.get("valueMap");
		
		
		//create a wordsheet
		HSSFSheet sheet = workbook.createSheet("Blueberry Excel Report");
		
		HSSFRow header = sheet.createRow(0);
		header.createCell((short) 0).setCellValue("Month");
		header.createCell((short) 1).setCellValue("Revenue");
		
		int rowNum = 1;
		for (Map.Entry<String, String> entry : valueMap.entrySet()) {
			//create the row data
			HSSFRow row = sheet.createRow(rowNum++);
			row.createCell((short) 0).setCellValue(entry.getKey());
			row.createCell((short) 1).setCellValue(entry.getValue());
                }
		
		response.setHeader("Content-Disposition", "attachment; filename=\"kyungjoon.xls\"");
	}
}