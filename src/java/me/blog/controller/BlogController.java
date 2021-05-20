package me.blog.controller;

import me.blog.been.Blog;
import me.blog.been.MessageBoard;
import me.blog.model.BlogTypeModel;
import me.blog.model.MessageBoardModel;
import me.blog.result.ImageResult;
import me.blog.been.User;
import me.blog.repository.BlogRepository;
import me.blog.repository.MessageBoardRepository;
import me.blog.repository.UserRepository;
import me.blog.util.MyTool;
import me.blog.util.UploadImageTool;
import org.apache.commons.logging.impl.Log4JLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by guyu on 2016/10/18.
 */
@RequestMapping(value = "/{email}")
@Controller
@SessionAttributes("current_user")
public class BlogController {
    @Autowired
    BlogRepository blogRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    MessageBoardRepository messageBoardRepository;
    @Autowired
    MessageBoardModel messageBoardModel;
    @Autowired
    BlogTypeModel blogTypeModel;

    private Log4JLogger logger = new Log4JLogger("blog-controller");

    final public static int MESSAGEBOARD_PER_PAGE = 8;

    /*
    创建博客页面
     */
    @RequestMapping(value = "/createBlog", method = RequestMethod.GET)
    public String createBlog(@PathVariable("email")String email, ModelMap modelMap) {
        User user = (User) modelMap.get("current_user");
        if(user == null || !user.getEmail().equals(email))
            return "redirect:/";
        modelMap.addAttribute("user", user);
        return "create_blog";
    }

    /*
    博客页面
     */
    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String showBlog( @RequestParam("id")int id,
                            @PathVariable("email")String email,
                            @RequestParam(value = "now_page", defaultValue = "1")int now_page,
                            @RequestParam(value = "submitMessage", defaultValue = "0")int submitMessage,
                            ModelMap modelMap) {
        Blog blog = blogRepository.findOne(id);
        User user = null;
        List<MessageBoard> messageBoards = messageBoardRepository.findByBlogIdOrderByCreateTimeDesc(id);
        messageBoardModel.injectUserToMessageBoard(messageBoards);
        modelMap.addAttribute("submitMessage", submitMessage);
        modelMap.addAttribute("page_num", messageBoards.size() / MESSAGEBOARD_PER_PAGE + 1);
        modelMap.addAttribute("message_size", messageBoards.size());
        modelMap.addAttribute("message_list", messageBoards);
        modelMap.addAttribute("now_page", now_page);
        modelMap.addAttribute("email", email);
        try {
             user = userRepository.findByEmail(email).get(0);
        } catch (Exception e) {
            return "redirect:/";
        }
        modelMap.addAttribute("user", user);
        if(blog == null) {
            return "redirect:/error/404";
        }
        blog.setViews(blog.getViews() + 1);
        blogRepository.saveAndFlush(blog);
        modelMap.addAttribute("blog", blog);
        return "/home/blog_page";
    }

    /*
    获得博客内容请求
     */
    @ResponseBody
    @RequestMapping(value = "getBlogContent.do")
    public String getBlogContent(@RequestParam("id")int id) {
        Blog blog = blogRepository.findOne(id);
        return blog.getContent();
    }

    @ResponseBody
    @RequestMapping(value = "getPreviewContent.do")
    public String getPreviewContent(@RequestParam("id")int id) {
        Blog blog = blogRepository.findOne(id);
        return MyTool.getPreviewMD(blog.getContent());
    }

    /*
    创建博客请求
     */
    @ResponseBody
    @RequestMapping(value = "/createBlog.do", method = RequestMethod.POST)
    public Blog createBlog(String title, int typeId, String content, ModelMap modelMap) {
        System.out.println(title + "\r\n" + typeId + "\r\n" + content);
        User user = (User) modelMap.get("current_user");
        if(user == null) {
            return null;
        }
        Blog blog = new Blog();
        blog.setCreateTime(new Timestamp(System.currentTimeMillis()));
        blog.setUserId(user.getId());
        blog.setTitle(title);
        blog.setTypeId(typeId);
        blog.setContent(content);
        blog.setCoverImage(MyTool.getImageFromMD(content));
        blog = blogRepository.saveAndFlush(blog);
        return blog;
    }

    /*
    编辑博客请求
     */
    @ResponseBody
    @RequestMapping(value = "/editBlog.do", method = RequestMethod.POST)
    public Blog editBlog(String title, int typeId, String content, int id, ModelMap modelMap) {
        User user = (User) modelMap.get("current_user");
        if(user == null) {
            return null;
        }
        Blog blog = blogRepository.findOne(id);
        if(blog == null || blog.getUserId() != user.getId())
            return null;
        else {
            blog.setTitle(title);
            blog.setTypeId(typeId);
            blog.setContent(content);
            blog = blogRepository.saveAndFlush(blog);
            modelMap.addAttribute("user", user);
            return blog;
        }
    }

    /*
    编辑博客页面
     */
    @RequestMapping(value = "/editBlog")
    public String editBlog(@PathVariable("email") String email,
                         @RequestParam("id")int id, ModelMap modelMap) {
        User user = (User) modelMap.get("current_user");
        if(user == null || !user.getEmail().equals(email)){
            return "redirect:index";
        }
        else {
            Blog blog = blogRepository.findOne(id);
            if(blog.getUserId() != user.getId()) {
                return "";
            }
            modelMap.addAttribute("blog", blog);
            modelMap.addAttribute("user", user);
            return "create_blog";
        }
    }

    /*
    上传图片请求
     */
    @ResponseBody
    @RequestMapping(value = "/uploadImage.do", method = RequestMethod.POST)
    public ImageResult uploadImage(@RequestParam(name = "editormd-image-file") MultipartFile multipartFile){
        ImageResult imageResult = null;
        String name = System.currentTimeMillis() + "." + multipartFile.getOriginalFilename().replaceFirst("^.+\\.", "");
        try {
            File file = new File(MyTool.getWebapp() + "/upload_files/" + name);
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(multipartFile.getBytes(), 0, multipartFile.getBytes().length);
            fos.flush();
            fos.close();
            UploadImageTool.upload(file, name);
            file.delete();
            imageResult = new ImageResult(1, "成功", "http://ofp720vrr.bkt.clouddn.com/" + name);
        } catch (Exception e){
            imageResult = new ImageResult(0, "上传失败", "");
        } finally {
            return imageResult;
        }
    }

}
