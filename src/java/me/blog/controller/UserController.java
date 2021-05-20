package me.blog.controller;

import me.blog.been.Blog;
import me.blog.been.BlogType;
import me.blog.been.User;
import me.blog.model.BlogTypeModel;
import me.blog.result.UserResult;
import me.blog.repository.BlogRepository;
import me.blog.repository.UserRepository;
import me.blog.util.MyTool;
import me.blog.util.StaticPrams;
import me.blog.util.StringEncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by guyu on 2016/10/18.
 */
@Controller
@SessionAttributes({"current_user","blog_types"})
public class UserController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    BlogRepository blogRepository;
    @Autowired
    BlogTypeModel blogTypeModel;

    int BLOG_PER_PAGE = 8;


    /*
    主页
     */
    @RequestMapping(value = "/")
    public String index(ModelMap modelMap) {
        //System.out.println("index");
        if(modelMap.get("current_user") != null) {
            User user = (User) modelMap.get("current_user");
            modelMap.addAttribute("user", user);
            return "redirect:/" + user.getEmail();
        }
        return "login";
    }

    /*
    页面内顶部登陆请求
     */
    @ResponseBody
    @RequestMapping(value = "/loginInPage.do", method = RequestMethod.POST)
    public String loginInPage(@ModelAttribute("user")User user,
                              @RequestParam(name = "nowUrl", required = false)String nowUrl,
                              ModelMap modelMap) {
        List<User> userList = userRepository.findByEmailAndPassword(user.getEmail(), user.getPassword());
        if(userList.isEmpty()) {
            return "登录失败";
        }
        else {
            user = userList.get(0);
            String cookieString = StringEncryptUtil.encrypt(user.getEmail() + user.getPassword() + System.currentTimeMillis(), null);
            user.setCookie(cookieString);
            userRepository.saveAndFlush(user);
            modelMap.addAttribute("current_user", userList.get(0));
            return null;
        }
    }

    /*
    个人博客首页
     */
    @RequestMapping(value = "/{email}")
    public String homepage(@PathVariable("email")String email, @RequestParam(required = false) Integer page, ModelMap modelMap) {
        List<User> users = userRepository.findByEmail(email);
        if(page == null)
            page = 1;
        if(users.isEmpty()) {
            return "redirect:/";
        }
        else {
            User user = users.get(0).clean();
            List<Blog> blogs = blogRepository.findByUserIdOrderByCreateTimeDesc(user.getId());
            List<BlogType> blogTypes = blogTypeModel.getUserParentBlogType(user.getId());
            modelMap.addAttribute("user", users.get(0));
            if(blogs != null && !blogs.isEmpty()) {
                modelMap.addAttribute("page_num", (blogs.size() - 1) / BLOG_PER_PAGE + 1);
                modelMap.addAttribute("now_page", page);
                modelMap.addAttribute("blog_types", blogTypes);
                int end = page * BLOG_PER_PAGE < blogs.size() ? page * BLOG_PER_PAGE : blogs.size();
                modelMap.addAttribute("blogs", blogs.subList((page - 1) * BLOG_PER_PAGE, end));
                modelMap.addAttribute("page_flag", StaticPrams.HOME_PAGE);
            }
            User currentUser = (User) modelMap.get("current_user");
            return "home/home";
        }
    }

    /*
    登录请求
     */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@ModelAttribute("user")User user, ModelMap modelMap) {
        List<User> userList = userRepository.findByEmailAndPassword(user.getEmail(), user.getPassword());
        if(userList.isEmpty()) {
            return "redirect:/";
        }
        else {
            user = userList.get(0);
//            String cookieString = StringEncryptUtil.encrypt(user.getEmail() + user.getPassword() + System.currentTimeMillis(), null);
//            user.setCookie(cookieString);
//            userRepository.saveAndFlush(user);
            modelMap.addAttribute("current_user", userList.get(0));
            return "redirect:/" + userList.get(0).getEmail();
        }
    }

    /*
    注册页面
     */
    @RequestMapping(value = "/registerPage", method = RequestMethod.GET)
    public String registerPage() {
        return "register";
    }

    /*
    注册请求
     */
    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String registerDo(@ModelAttribute("user")User user, ModelMap modelMap) {
        List<User> userList = userRepository.findByEmail(user.getEmail());
        if(userList.isEmpty()) {
            userRepository.saveAndFlush(user);
            user.clean();
            modelMap.addAttribute("current_user", user);
            return "redirect:/";
        }
        else  {
            return "redirect:/registerPage";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/registerInPage.do", method = RequestMethod.POST)
    public String registerInPage(@ModelAttribute("user")User user, ModelMap modelMap) {
        List<User> userList = userRepository.findByEmail(user.getEmail());
        if(userList.isEmpty()) {
            userRepository.saveAndFlush(user);
            user.clean();
            modelMap.addAttribute("current_user", user);
            return null;
        }
        else  {
            return "注册失败";
        }
    }

    /*
    登出请求
     */
    @RequestMapping(value = "/logout.do")
    public String logout(@RequestParam("nowUrl")String nowUrl, SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "redirect:" + nowUrl;
    }

    /*
    个人博客管理页面
     */
    @RequestMapping(value = "/personalPage")
    public String personalPage(ModelMap modelMap) {
        User user = MyTool.getCurrentUser(modelMap);
        if(user == null) {
            return "redirect:/";
        }
        else {
            List<Blog> blogs = blogRepository.findByUserIdOrderByCreateTimeDesc(user.getId());
            modelMap.addAttribute("page", "blog_manage");
            modelMap.addAttribute("blogs", blogs);
            return "blog_manage_page";
        }
    }

    /*
    个人信息页面
     */
    @RequestMapping(value = "/informationPage")
    public String informantionPage(ModelMap modelMap) {
        User user = MyTool.getCurrentUser(modelMap);
        if(user == null) {
            return "redirect:/";
        }
        else {
            modelMap.addAttribute("page", "personal_manage");
            return "personal_message_page";
        }
    }

    /*
    用户管理页面
     */
    @RequestMapping(value = "/userManagePage")
    public String userManagePage(ModelMap modelMap) {
        User user = MyTool.getCurrentUser(modelMap);
        if(user == null) {
            return "redirect:/";
        }
        else {
            modelMap.addAttribute("page", "user_manage");
            List<User> users = userRepository.findAll();
            modelMap.addAttribute("users", users);
            return "user_manage_page";
        }
    }

    /*
    更新用户信息请求
     */
    @ResponseBody
    @RequestMapping(value = "/updateUser.do")
    public UserResult updateUser(String nickname, String currentPassword, String newPassword, String confirmPassword, String userDescribe, String sex, int userId, ModelMap modelMap){
        User user = userRepository.findOne(userId);
        UserResult userResult = new UserResult();
        if(user == null)
            return null;
        else {
            if(newPassword != null && !newPassword.equals("")) {
                if(!user.getPassword().equals(currentPassword)){
                    userResult.setWrongId(userResult.getWrongId() | userResult.CURRENT_PASSWORD_WRONG);
                    return userResult;
                }
                else if(!newPassword.equals(confirmPassword)){
                    userResult.setWrongId(userResult.getWrongId() | userResult.PASSWORD_NOT_SAME);
                    return userResult;
                }
                else {
                    user.setPassword(newPassword);
                }
            }
            if(nickname == null) {
                userResult.setWrongId(userResult.NICK_NAME_EMPTY);
            }
            else {
                user.setNickname(nickname);
                user.setUserDescribe(userDescribe);
                user.setSex(sex);
                userRepository.saveAndFlush(user);
                userResult.setUser(user);
                modelMap.replace("current_user", user);
            }
        }
        return userResult;
    }

    /*
    管理员更改用户信息请求
     */
    @ResponseBody
    @RequestMapping(value = "/userManage.do")
    public UserResult userManage(int userId, String nickname, String email, String sex, int privilege, ModelMap modelMap) {
        UserResult userResult = new UserResult();
        User admin = (User) modelMap.get("current_user");
        User user = userRepository.findOne(userId);
        if(admin == null || admin.getPrivilege() != 1){
            userResult.setWrongId(userResult.NOT_ADMIN);
        }
        else if(nickname == "" || email == ""){
            userResult.setWrongId(userResult.NICK_NAME_EMPTY);
        }
        else if(user == null){
            userResult.setWrongId(userResult.CANNOT_FIND_USER);
        }
        else if(user.getId() == admin.getId()) {
            userResult.setWrongId(userResult.CANNOT_SET_MINE);
        }
        else {
            user.setNickname(nickname);
            user.setEmail(email);
            user.setSex(sex);
            user.setPrivilege(privilege);
            userRepository.saveAndFlush(user);
            userResult.setUser(user);
        }
        return userResult;
    }
}
