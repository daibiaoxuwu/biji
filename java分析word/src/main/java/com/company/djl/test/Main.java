package com.company.djl.test;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args){
        try {
            File input = new File("D:\\prog10\\Documents\\WeChat Files\\daibiaoxuwu\\FileStorage\\File\\2019-06\\data\\data\\news.tsinghua.edu.cn\\publish\\thunews\\9658\\index.html");
            Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");

//            Document doc = Jsoup.connect("https://www.tsinghua.edu.cn/publish/thunews/9658/").get();
            doc.select("*[style*=display:none]").remove();
            System.out.println(Jsoup.clean((doc.body().text()) ,Whitelist.basic()));
            System.out.println(Jsoup.clean((doc.select("title").text()) ,Whitelist.basic()));
            for(Element element : doc.select("a")){
                System.out.println(element.attr("href"));
            }
            System.out.println("---");
            String[] strs =  doc.select(".content").text().split(" ");
            for(String str : strs){
                System.out.println(str);
            }

//            System.out.println(Jsoup.clean((doc.select(".content").text()) ,Whitelist.basic()));
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
