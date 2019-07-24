package com.company.djl.test;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import java.io.IOException;

public class Main {
    public static void main(String[] args){
        try {
            Document doc = Jsoup.connect("https://baike.baidu.com/item/%E7%99%BD%E9%9D%A2%E9%B8%AE/23559203?fr=aladdin").get();
            System.out.println((doc.body().text()));
//            Elements newsHeadlines = doc.select("#mp-itn b a");
//            for (Element headline : newsHeadlines) {
//                System.out.println(headline.attr("title"));
//                System.out.println(headline.absUrl("href"));
//            }
        } catch (IOException e) {
            System.out.println(e);
        }


    }


}
