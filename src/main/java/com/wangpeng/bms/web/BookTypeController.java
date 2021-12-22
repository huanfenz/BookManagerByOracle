package com.wangpeng.bms.web;

import com.wangpeng.bms.model.BookInfo;
import com.wangpeng.bms.model.BookType;
import com.wangpeng.bms.service.BookTypeService;
import com.wangpeng.bms.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/bookType")
public class BookTypeController {

    @Autowired
    BookTypeService bookTypeService;

    @RequestMapping(value = "/queryBookTypesByPage")
    @ResponseBody
    public Map<String, Object> queryBookTypesByPage(Integer page, Integer limit){
        // 获取数量
        Integer count = bookTypeService.getCount();

        // 获取数据
        List<BookType> bookTypes = bookTypeService.queryBookTypesByPage(page, limit);

        // 结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", bookTypes);
        return res;
    }

    @RequestMapping(value = {
            "/queryBookTypes",
            "/reader/queryBookTypes"
    })
    @ResponseBody
    public List<BookType> queryBookTypes(){
        return bookTypeService.queryBookTypes();
    }

    @RequestMapping(value = "/addBookType")
    @ResponseBody
    public Integer addBookType(String json){
        // 获取参数的对象
        BookType bookType = JsonUtil.parseObject(json, BookType.class);
        return bookTypeService.addBookType(bookType);
    }

    @RequestMapping(value = "/getCount")
    @ResponseBody
    public Integer getCount(){
        return bookTypeService.getCount();
    }

    @RequestMapping(value = "/deleteBookTypes")
    @ResponseBody
    public Integer deleteBookTypes(String json){
        // 获取参数的列表
        if(json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<BookType> bookTypes = JsonUtil.parseList(json, BookType.class);
        return bookTypeService.deleteBookTypes(bookTypes);
    }

    @RequestMapping(value = "/updateBookType")
    @ResponseBody
    public Integer updateBookType(String json){
        // 获取参数的对象
        BookType bookType = JsonUtil.parseObject(json, BookType.class);
        return bookTypeService.updateBookType(bookType);
    }

    @RequestMapping("/searchBookTypesByPage")
    @ResponseBody
    public Map<String,Object> searchBookTypesByPage(Integer page, Integer limit, String json){
        //获得搜索的参数
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        //获取查询个数
        int count = bookTypeService.getSearchCount(searchParam);
        //查询数据
        List<BookType> bookTypes = bookTypeService.searchBookTypesByPage(page, limit, searchParam);
        //结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", bookTypes);
        return res;
    }

}
