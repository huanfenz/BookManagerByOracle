package com.wangpeng.bms.web;

import com.wangpeng.bms.model.BookType;
import com.wangpeng.bms.model.User;
import com.wangpeng.bms.service.UserService;
import com.wangpeng.bms.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public Integer login(String username, String password, String authority, HttpServletRequest req){
        // res：0 账号或密码错误，1 登录成功
        byte isAdmin = (byte) (authority.equals("manager") ? 1 : 0);
        User user = userService.login(username, password, isAdmin);
        if(user == null) return 0;
        // 存session
        req.getSession().setAttribute("userObj", user);
        return 1;
    }

    @RequestMapping(value = "/register")
    @ResponseBody
    public Integer register(String username, String password){
        // res：0 用户名重复，1 注册成功
        return userService.register(username, password);
    }

    @RequestMapping(value = {
            "/getUser",
            "/reader/getUser"
    })
    @ResponseBody
    public User getUser(HttpServletRequest req) {
        return (User) req.getSession().getAttribute("userObj");
    }

    @RequestMapping(value = {
            "/exitLogin",
            "/reader/exitLogin"
    })
    @ResponseBody
    public void exitLogin(HttpServletRequest req){
        // 清除session
        req.getSession().removeAttribute("userObj");
    }

    @RequestMapping(value = {
            "/alterPassword",
            "reader/alterPassword"
    })
    @ResponseBody
    public Integer alterPassword(String oldPassword, String newPassword,HttpServletRequest req){
        //获取当前账号信息
        User userObj =  (User) req.getSession().getAttribute("userObj");

        //检查旧密码是否正确
        User user = userService.login(userObj.getUsername(), oldPassword, userObj.getIsadmin());
        if(user == null) {  //旧密码不正确
            return 0;
        } else {    //旧密码正确，设置新密码
            userService.setPassword(userObj.getUserid(), newPassword);
            return 1;
        }

    }

    @RequestMapping(value = "/queryUsersByPage")
    @ResponseBody
    public Map<String, Object> queryUsersByPage(Integer page, Integer limit){
        // 获取数量
        Integer count = userService.getCount();

        // 获取数据
        List<User> users = userService.queryUsersByPage(page, limit);

        // 结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", users);
        return res;
    }

    @RequestMapping(value = "/queryUsers")
    @ResponseBody
    public List<User> queryUsers(){
        return userService.queryUsers();
    }

    @RequestMapping(value = "/addUser")
    @ResponseBody
    public Integer addUser(String json){
        // 获取参数的对象
        User user = JsonUtil.parseObject(json, User.class);
        return userService.addUser(user);
    }

    @RequestMapping(value = "/getCount")
    @ResponseBody
    public Integer getCount(){
        return userService.getCount();
    }

    @RequestMapping(value = "/deleteUsers")
    @ResponseBody
    public Integer deleteUsers(String json){
        // 获取参数的列表
        if(json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<User> users = JsonUtil.parseList(json, User.class);

        return userService.deleteUsers(users);
    }

    @RequestMapping(value = "/updateUser")
    @ResponseBody
    public Integer updateUser(String json){
        // 获取参数的对象
        User user = JsonUtil.parseObject(json, User.class);
        return userService.updateUser(user);
    }

    @RequestMapping("/searchUsersByPage")
    @ResponseBody
    public Map<String,Object> searchBookTypesByPage(Integer page, Integer limit, String json){
        //获得搜索的参数
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        //获取查询个数
        int count = userService.getSearchCount(searchParam);
        //查询数据
        List<User> users = userService.searchUsersByPage(page, limit, searchParam);
        //结果map
        Map<String,Object> res = new HashMap<String,Object>();
        res.put("code", 0);
        res.put("msg", "");
        res.put("count", count);
        res.put("data", users);
        return res;
    }

}
