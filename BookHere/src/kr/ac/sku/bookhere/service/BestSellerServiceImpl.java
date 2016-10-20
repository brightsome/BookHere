package kr.ac.sku.bookhere.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import kr.ac.sku.bookhere.vo.BestSellerVO;

@Service("bestSellerService")
public class BestSellerServiceImpl implements BestSellerService {

   @Override
   public List<BestSellerVO> kyobo() {
      List<BestSellerVO> kyobolist = new ArrayList<BestSellerVO>();

      String url = "http://www.kyob"
            + "obook.co.kr/bestseller/bestSellerMain.laf?orderClick=c61&gclid=Cj0KEQjw6O-9BRDjhYXH2bOb8Z4BEiQAWRdukySi4678rQaUL5zV-hdhjQOsbsshzuHdsErMwHLQsoAaAhRn8P8HAQ";

      Document doc;
      try {
         doc = Jsoup.connect(url).timeout(7000).get();
         Elements eRank = doc.select("div.cover a strong.rank");
         Elements eImg = doc.select("div.cover a img");
         Elements eTitle = doc.select("div.title a strong");
         Elements eInfo = doc.select("div.author");
         Elements ebarcode = doc.select("div.detail div.title a");

         List<String> rankList = new ArrayList<String>();
         List<String> imgList = new ArrayList<String>();
         List<String> titleList = new ArrayList<String>();
         List<String> infoList = new ArrayList<String>();
         List<String> barcodeList = new ArrayList<String>();

         for (Element e : eRank) {
            String rank = e.text();
            rankList.add(rank);
         }
         for (Element e : eImg) {
            String img = e.attr("src");
            imgList.add(img);
         }
         for (Element e : eTitle) {
            String title = e.text();
            titleList.add(title);
         }
         for (Element e : eInfo) {
            String info = e.text();
            infoList.add(info);
         }
         for (Element e : ebarcode) {
            String href = e.attr("href");
            String barcode = href.substring(82);
            barcodeList.add(barcode);
         }

         for (int i = 0; i < rankList.size(); i++) {
            BestSellerVO vo = new BestSellerVO();
            vo.setRank(rankList.get(i));
            vo.setImg(imgList.get(i));
            vo.setTitle(titleList.get(i));
            vo.setInfo(infoList.get(i));
            vo.setBarcode(barcodeList.get(i));
            kyobolist.add(vo);
         }

      } catch (IOException e1) {
         e1.printStackTrace();
      }

      return kyobolist;
   }

   @Override
   public List<BestSellerVO> bandi() {
      List<BestSellerVO> bandilist = new ArrayList<BestSellerVO>();
      String url = "http://www.bandinlunis.com/front/display/listBest.do;";

      Document doc;
      try {
         doc = Jsoup.connect(url).timeout(7000).get();
         Elements eRank = doc.select("div.prod_thumb span.ranking span.rank_num");
         Elements eImg = doc.select("div.prod_thumb_img a img");
         Elements eTitle = doc.select("dl.prod_info dt a");
         Elements eInfo = doc.select("dd.txt_block");
//         Elements eBarcode = doc.select("div.prod_list_type input.checkbox");

         List<String> rankList = new ArrayList<String>();
         List<String> imgList = new ArrayList<String>();
         List<String> titleList = new ArrayList<String>();
         List<String> infoList = new ArrayList<String>();
//         List<String> barcodeList = new ArrayList<String>();

         for (Element e : eRank) {
            String rank = e.text();
            rankList.add(rank);
         }
         for (Element e : eImg) {
            String img = e.attr("src");
            imgList.add(img);
         }
         for (Element e : eTitle) {
            String title = e.text();
            titleList.add(title);
         }
         for (Element e : eInfo) {
            String info = e.text();
            infoList.add(info);
         }
//         for (Element e : eBarcode) {
//            String prodId = e.attr("value");
//            url = "http://www.bandinlunis.com/front/product/detailProduct.do?prodId=" + prodId;
//            doc = Jsoup.connect(url).get();
//            String selector = "div.group_inside li.alt";
//            Elements search = doc.select(selector);
//            String isbn = search.first().text();
//            isbn = isbn.replaceAll("\\p{Z}", "");
//            String[] values = isbn.split(":");
//            for (int i = 0; i < values.length; i++) {
//               if (i == 1) {
//                  barcodeList.add(values[i]);
//               }
//            }
//         }

         for (int i = 0; i < rankList.size(); i++) {
            BestSellerVO vo = new BestSellerVO();
            vo.setRank(rankList.get(i));
            vo.setImg(imgList.get(i));
            vo.setTitle(titleList.get(i));
            vo.setInfo(infoList.get(i));
//            vo.setBarcode(barcodeList.get(i));
            bandilist.add(vo);
         }

      } catch (IOException e1) {
         e1.printStackTrace();
      }

      return bandilist;
   }

   @Override
   public List<BestSellerVO> ypbooks() {
      List<BestSellerVO> yplist = new ArrayList<BestSellerVO>();
      String url = "https://www.ypbooks.co.kr/book_arrange.yp?targetpage=book_week_best&pagetype=5;";

      Document doc;
      try {
         doc = Jsoup.connect(url).timeout(7000).get();
         Elements eRank1 = doc.select("dl.bookViewTOP img.png24");
         Elements eImg1 = doc.select("dl.bookViewTOP img.thumb");
         Elements eTitle1 = doc.select("dl.bookViewTOP dd.nbookTit a");
         Elements eInfo1 = doc.select("dl.bookViewTOP dd.nbookName");
         Elements eBarcode1 = doc.select("dl.bookViewTOP dt a");

         Elements eRank2 = doc.select("div.bookNewOther img.png24");
         Elements eImg2 = doc.select("div.bookNewOther img.thumb");
         Elements eTitle2 = doc.select("div.bookNewOther dd.nbookTit02 a");
         Elements eInfo2 = doc.select("div.bookNewOther dd.nbookName");
         Elements eBarcode2 = doc.select("div.bookNewOther dt a");

         Elements eRank5 = doc.select("dl.listView img.png24");
         Elements eImg5 = doc.select("dl.listView img.thumb");
         Elements eTitle5 = doc.select("dl.listView dd.nbookTit a");
         Elements eInfo5 = doc.select("dl.listView dd.nbookName");
         Elements eBarcode5 = doc.select("dl.listView dt a");

         List<String> rankList = new ArrayList<String>();
         List<String> imgList = new ArrayList<String>();
         List<String> titleList = new ArrayList<String>();
         List<String> infoList = new ArrayList<String>();
         List<String> barcodeList = new ArrayList<String>();

         // 1위
         for (Element e : eRank1) {
            String rankstr = e.attr("alt");
            String rank = rankstr.replaceAll("[^0-9]", "");
            rankList.add(rank);
         }
         for (Element e : eImg1) {
            String img = e.attr("src");
            imgList.add(img);
         }
         for (Element e : eTitle1) {
            String title = e.text();
            titleList.add(title);
         }
         for (Element e : eInfo1) {
            String info = e.text();
            infoList.add(info);
         }
         for (Element e : eBarcode1) {
            String barcode = e.attr("href");
            String[] values = barcode.split("'");
            for (int i = 0; i < values.length; i++) {
               if (i == 1) {
                  barcodeList.add(values[i]);
               }
            }
         }

         // 2위, 3위, 4위
         for (Element e : eRank2) {
            String rankstr = e.attr("src");
            String rank = rankstr.replaceAll("[^0-9]", "");
            rankList.add(rank);
         }

         for (Element e : eImg2) {
            String img = e.attr("src");
            imgList.add(img);
         }

         for (Element e : eTitle2) {
            String title = e.text();
            titleList.add(title);
         }

         for (Element e : eInfo2) {
            String info = e.text();
            infoList.add(info);
         }
         for (Element e : eBarcode2) {
            String barcode = e.attr("href");
            String[] values = barcode.split("'");
            for (int i = 0; i < values.length; i++) {
               if (i == 1) {
                  barcodeList.add(values[i]);
               }
            }
         }

         // 5위 ~
         for (Element e : eRank5) {
            String rankstr = e.attr("alt");
            String rank = rankstr.replaceAll("[^0-9]", "");
            rankList.add(rank);
         }
         for (Element e : eImg5) {
            String img = e.attr("src");
            imgList.add(img);
         }
         for (Element e : eTitle5) {
            String title = e.text();
            titleList.add(title);
         }
         for (Element e : eInfo5) {
            String info = e.text();
            infoList.add(info);
         }
         for (Element e : eBarcode5) {
            String barcode = e.attr("href");
            String[] values = barcode.split("'");
            for (int i = 0; i < values.length; i++) {
               if (i == 1) {
                  barcodeList.add(values[i]);
               }
            }
         }

         for (int i = 0; i < rankList.size(); i++) {
            BestSellerVO vo = new BestSellerVO();
            vo.setRank(rankList.get(i));
            vo.setImg(imgList.get(i));
            vo.setTitle(titleList.get(i));
            vo.setInfo(infoList.get(i));
            vo.setBarcode(barcodeList.get(i));
            yplist.add(vo);
         }

      } catch (IOException e1) {
         e1.printStackTrace();
      }
      return yplist;
   }

}