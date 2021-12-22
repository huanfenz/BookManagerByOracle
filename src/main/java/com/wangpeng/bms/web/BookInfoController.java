package com.wangpeng.bms.web;

import com.wangpeng.bms.model.BookInfo;
import com.wangpeng.bms.service.BookInfoService;
import com.wangpeng.bms.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/bookInfo")
public class BookInfoController {

    @Autowired
    BookInfoService bookInfoService;

    @RequestMapping(value = "/queryBookInfosByPage")
    @ResponseBody
    public Map<String, Object> queryBookInfosByPage(Integer page, Integer limit){
        // 获取数量
        Integer count = bookInfoService.getCount();

        // 获取数据
        List<BookInfo> bookInfos = bookInfoService.queryBookInfosByPage(page, limit);

        // 结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", bookInfos);
        return res;
    }

    @RequestMapping(value = "/queryBookInfos")
    @ResponseBody
    public List<BookInfo> queryBookInfos(){
        return bookInfoService.queryBookInfos();
    }

    @RequestMapping(value = "/addBookInfo")
    @ResponseBody
    public Integer addBookInfo(String json){
        // 获取参数的对象
        BookInfo bookInfo = JsonUtil.parseObject(json, BookInfo.class);
        return bookInfoService.addBookInfo(bookInfo);
    }

    @RequestMapping(value = "/getCount")
    @ResponseBody
    public Integer getCount(){
        return bookInfoService.getCount();
    }

    @RequestMapping(value = "/deleteBookInfos")
    @ResponseBody
    public Integer deleteBookInfos(String json){
        // 获取参数的列表
        if(json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<BookInfo> bookInfos = JsonUtil.parseList(json, BookInfo.class);
        return bookInfoService.deleteBookInfos(bookInfos);
    }

    @RequestMapping(value = "/updateBookInfo")
    @ResponseBody
    public Integer updateBookInfo(String json){
        // 获取参数的对象
        BookInfo bookInfo = JsonUtil.parseObject(json, BookInfo.class);
        return bookInfoService.updateBookInfo(bookInfo);
    }

    @RequestMapping("/searchBookInfosByPage")
    @ResponseBody
    public Map<String,Object> searchBookInfosByPage(Integer page, Integer limit, String json){
        //获得搜索的参数
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        //获取查询个数
        int count = bookInfoService.getSearchCount(searchParam);
        //查询数据
        List<BookInfo> bookInfos = bookInfoService.searchBookInfosByPage(page, limit, searchParam);
        //结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", bookInfos);
        return res;
    }

    @RequestMapping(value = "/reader/getSearchCount")
    @ResponseBody
    public Integer getSearchCountByReader(String bookname){
        // 字符串处理，去掉两边空格
        bookname = bookname.trim();
        if(bookname.equals("") || bookname.equals("null")) {
            return bookInfoService.getCount();
        } else {
            Map<String, Object> map = new HashMap<>();
            map.put("bookname", bookname);
            return bookInfoService.getSearchCount(map);
        }
    }

    @RequestMapping("/reader/searchBookInfosByPage")
    @ResponseBody
    public Map<String,Object> searchBookInfosByPageByReader(Integer page, Integer limit, String bookname){
        // 字符串处理，去掉两边空格
        bookname = bookname.trim();
        Map<String,Object> res;
        if (bookname.equals("") || bookname.equals("null")) {  //无参，就是获取全部
            res = queryBookInfosByPage(page, limit);
        } else {    // 有参，搜索图书
            String searchJson = "{\"bookname\":\"" + bookname + "\",\"bookauthor\":\"\",\"booktypeid\":\"\"}";
            res = searchBookInfosByPage(page, limit, searchJson);
        }
        return res;
    }

    @RequestMapping(value = "/reader/getCountByType")
    @ResponseBody
    public Integer getCountByType(Integer booktypeid){
        if(booktypeid == null) return 0;
        Map<String, Object> map = new HashMap<>();
        map.put("booktypeid", booktypeid);
        return bookInfoService.getCountByType(map);
    }

    @RequestMapping("/reader/queryBookInfosByPageByType")
    @ResponseBody
    public Map<String,Object> queryBookInfosByPageByType(Integer page, Integer limit, Integer booktypeid){
        if(booktypeid == null) return null;
        // 放参数
        Map<String, Object> map = new HashMap<>();
        map.put("booktypeid", booktypeid);
        //获取查询个数
        int count = bookInfoService.getCountByType(map);
        //查询数据
        List<BookInfo> bookInfos = bookInfoService.queryBookInfosByPageByType(page, limit, map);
        //结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", bookInfos);
        return res;
    }

}
