package kr.ac.sku.bookhere.excel;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.sku.bookhere.dao.StockDAO;
import kr.ac.sku.bookhere.vo.StockVO;

/**
 * 엑셀파일을 파싱하는 클래스
 */
public class ExcelManager {

   private static ExcelManager excelMng;

   public ExcelManager() {
      // TODO Auto-generated constructor stub
   }

   public static ExcelManager getInstance() {
      if (excelMng == null)
         excelMng = new ExcelManager();
      return excelMng;
   }

   /**
    * 엑셀파일 파싱후 HashMap리스트를 반환
    */
   @Autowired
   StockDAO stockDAO;
   
   public List<StockVO> getListExcel(File file, String id) throws Exception {
      List<StockVO> list = new ArrayList<StockVO>();
      XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(file));
      /*// 엑셀파일의 시트 존재 유무 확인
      if (workbook.getNumberOfSheets() < 1)
         return null;*/
      // 첫번째 시트를 읽음
      XSSFSheet sheet = workbook.getSheetAt(0);
      for (int i = 0; i <= sheet.getLastRowNum(); i++) {
         list.add(readCellData(sheet.getRow(i),id));
         System.out.println(list.get(i).toString());
      }
      return list;
   }

   private StockVO readCellData(XSSFRow row, String id) {
	      //HashMap<String, String> hMap = new HashMap<String, String>();
	      StockVO vo = new StockVO();
//	      vo.setId(id);
	      vo.setIsbn(getStringCellData(row.getCell(0)));
	      vo.setStock(getStringCellData(row.getCell(1)));
	      return vo;
	   }
 

   private String getStringCellData(XSSFCell cell) {
      DecimalFormat df = new DecimalFormat();
      FormulaEvaluator evaluator = new XSSFWorkbook().getCreationHelper().createFormulaEvaluator();

      if (cell != null) {
         String data = null;
         switch (cell.getCellType()) {
         case XSSFCell.CELL_TYPE_BOOLEAN:
            boolean bdata = cell.getBooleanCellValue();
            data = String.valueOf(bdata);
            break;
         case XSSFCell.CELL_TYPE_NUMERIC:
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
               SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
               data = formatter.format(cell.getDateCellValue());
            } else {
               double ddata = cell.getNumericCellValue();
               data = df.format(ddata);
            }
            break;
         case XSSFCell.CELL_TYPE_STRING:
            data = cell.toString();
            break;
         case XSSFCell.CELL_TYPE_BLANK:
         case XSSFCell.CELL_TYPE_ERROR:
         case XSSFCell.CELL_TYPE_FORMULA:
            if (!(cell.toString() == "")) {
               if (evaluator.evaluateFormulaCell(cell) == XSSFCell.CELL_TYPE_NUMERIC) {
                  double fddata = cell.getNumericCellValue();
                  data = df.format(fddata);
               } else if (evaluator.evaluateFormulaCell(cell) == XSSFCell.CELL_TYPE_STRING) {
                  data = cell.getStringCellValue();
               } else if (evaluator.evaluateFormulaCell(cell) == XSSFCell.CELL_TYPE_BOOLEAN) {
                  boolean fbdata = cell.getBooleanCellValue();
                  data = String.valueOf(fbdata);
               }
               break;
            }
         default:
            data = cell.toString();
            System.out.println(data);
         }
         return data;
      } else {
         return null;
      }
   }
}