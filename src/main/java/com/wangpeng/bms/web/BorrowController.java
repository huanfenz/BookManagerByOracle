package com.wangpeng.bms.web;

import com.wangpeng.bms.exception.NotEnoughException;
import com.wangpeng.bms.exception.OperationFailureException;
import com.wangpeng.bms.model.BookInfo;
import com.wangpeng.bms.model.Borrow;
import com.wangpeng.bms.service.BookInfoService;
import com.wangpeng.bms.service.BorrowService;
import com.wangpeng.bms.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/borrow")
public class BorrowController {

    @Autowired
    BorrowService borrowService;
    @Autowired
    BookInfoService bookInfoService;

    @RequestMapping(value = "/queryBorrowsByPage")
    @ResponseBody
    public Map<String, Object> queryBorrowsByPage(Integer page, Integer limit){
        // 获取数量
        Integer count = borrowService.getCount();

        // 获取数据
        List<Borrow> borrows = borrowService.queryBorrowsByPage(page, limit);

        // 结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", borrows);
        return res;
    }

    @RequestMapping(value = "/addBorrow")
    @ResponseBody
    public Integer addBorrow(String json){
        // 获取参数的对象
        Borrow borrow = JsonUtil.parseObject(json, Borrow.class);
        return borrowService.addBorrow(borrow);
    }

    @RequestMapping(value = "/getCount")
    @ResponseBody
    public Integer getCount(){
        return borrowService.getCount();
    }

    @RequestMapping(value = "/deleteBorrows")
    @ResponseBody
    public Integer deleteBorrows(String json){
        // 获取参数的列表
        if(json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<Borrow> borrows = JsonUtil.parseList(json, Borrow.class);
        return borrowService.deleteBorrows(borrows);
    }

    @RequestMapping(value = "/updateBorrow")
    @ResponseBody
    public Integer updateBorrow(String json){
        // 获取参数的对象
        Borrow borrow = JsonUtil.parseObject(json, Borrow.class);
        return borrowService.updateBorrow(borrow);
    }

    @RequestMapping("/searchBorrowsByPage")
    @ResponseBody
    public Map<String,Object> searchBookInfosByPage(Integer page, Integer limit, String json){
        //获得搜索的参数
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        //获取查询个数
        int count = borrowService.getSearchCount(searchParam);
        //查询数据
        List<Borrow> borrows = borrowService.searchBorrowsByPage(page, limit, searchParam);
        //结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", borrows);
        return res;
    }

    @RequestMapping(value = "reader/queryBorrowsByPageByReader")
    @ResponseBody
    public Map<String, Object> queryBorrowsByPageByReader(Integer page, Integer limit, Integer userid){
        // 获取数量
        Integer count = borrowService.getCountByReader(userid);

        // 获取数据
        List<Borrow> borrows = borrowService.queryBorrowsByPageByReader(page, limit, userid);

        // 结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", borrows);
        return res;
    }

    @RequestMapping(value = "/reader/borrowBook")
    @ResponseBody
    @Transactional
    public Integer borrowBook(Integer userid, Integer bookid){

        try{
            // 查询该书的情况
            BookInfo theBook = bookInfoService.queryBookInfoById(bookid);

            if(theBook == null) {  // 图书不存在
                throw new NullPointerException("图书" + bookid + "不存在");
            } else if(theBook.getIsborrowed() == 1) {  // 已经被借
                throw new NotEnoughException("图书" + bookid + "库存不足（已经被借走）");
            }

            // 添加一条记录到borrow表
            Borrow borrow = new Borrow();
            borrow.setUserid(userid);
            borrow.setBookid(bookid);
            borrow.setBorrowtime(new Date(System.currentTimeMillis()));
            Integer res1 = borrowService.addBorrow2(borrow);
            if(res1 == 0) throw new OperationFailureException("图书" + bookid + "添加借阅记录失败");

            // 更新图书表的isBorrowed
            BookInfo bookInfo = new BookInfo();
            bookInfo.setBookid(bookid);
            bookInfo.setIsborrowed((byte) 1);
            Integer res2 = bookInfoService.updateBookInfo(bookInfo);
            if(res2 == 0) throw new OperationFailureException("图书" + bookid + "更新被借信息失败");

        } catch (Exception e) {
            System.out.println("发生异常，进行手动回滚");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            return 0;
        }

        return 1;
    }

    @RequestMapping(value = "/reader/returnBook")
    @ResponseBody
    @Transactional
    public Integer returnBook(Integer borrowid, Integer bookid){

        try {
            // 查询该书的情况
            BookInfo theBook = bookInfoService.queryBookInfoById(bookid);
            // 查询借书的情况
            Borrow theBorrow = borrowService.queryBorrowsById(borrowid);

            if(theBook == null) {  // 图书不存在
                throw new NullPointerException("图书" + bookid + "不存在");
            } else if(theBorrow == null) {   //结束记录不存在
                throw new NullPointerException("借书记录" + bookid + "不存在");
            } else if(theBook.getIsborrowed() == 0) {  // 已经还过书
                throw new NotEnoughException("图书" + bookid + "已经还过了");
            }

            // 更新Borrow表，更新结束时间
            Borrow borrow = new Borrow();
            borrow.setBorrowid(borrowid);
            borrow.setReturntime(new Date(System.currentTimeMillis()));
            Integer res1 = borrowService.updateBorrow2(borrow);
            if(res1 == 0) throw new OperationFailureException("图书" + bookid + "更新借阅记录失败");

            // 更新图书表的isBorrowed
            BookInfo bookInfo = new BookInfo();
            bookInfo.setBookid(bookid);
            bookInfo.setIsborrowed((byte) 0);
            Integer res2 = bookInfoService.updateBookInfo(bookInfo);
            if(res2 == 0) throw new OperationFailureException("图书" + bookid + "更新被借信息失败");

        } catch (Exception e) {
            System.out.println("发生异常，进行手动回滚");
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            return 0;
        }

        return 1;
    }

}
