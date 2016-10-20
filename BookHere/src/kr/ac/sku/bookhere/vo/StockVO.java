package kr.ac.sku.bookhere.vo;

public class StockVO {
   int branchid;
   String isbn;
   String stock;
   
   public int getBranchid() {
      return branchid;
   }
   public void setBranchid(int branchid) {
      this.branchid = branchid;
   }
   public String getIsbn() {
      return isbn;
   }
   public void setIsbn(String isbn) {
      this.isbn = isbn;
   }
   public String getStock() {
      return stock;
   }
   public void setStock(String stock) {
      this.stock = stock;
   }
   @Override
   public String toString() {
      return "StockVO [branchid=" + branchid + ", isbn=" + isbn + ", stock=" + stock + "]";
   }
   
}