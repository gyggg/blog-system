package me.blog.controller;

import me.blog.been.MessageBoard;
import me.blog.result.MessageResult;
import me.blog.been.User;
import me.blog.repository.BlogRepository;
import me.blog.repository.MessageBoardRepository;
import me.blog.repository.UserRepository;
import me.blog.util.MyTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by guyu on 2016/11/15.
 */
@RequestMapping(value = "/{blogId}")
@Controller
@SessionAttributes("current_user")
public class MessageBoardController {
    @Autowired
    BlogRepository blogRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    MessageBoardRepository messageBoardRepository;

    /*
    发送留言请求
     */
    @ResponseBody
    @RequestMapping(value = "/sendMessage.do")
    public String sendMessage(@PathVariable("blogId")int blogId, @RequestParam String content, ModelMap modelMap) {
        MessageBoard messageBoard = new MessageBoard();
        User user = MyTool.getCurrentUser(modelMap);
        if(user == null)
            return "error";
        messageBoard.setUserId(user.getId());
        messageBoard.setBlogId(blogId);
        messageBoard.setContent(content);
        messageBoard.setCreateTime(new Timestamp(System.currentTimeMillis()));
        messageBoardRepository.saveAndFlush(messageBoard);
        return "success";
    }

    /*
    获得博客留言请求
     */
    @ResponseBody
    @RequestMapping(value = "/getMessages.do")
    public List<MessageResult> getMessages(@PathVariable("blogId")int blogId,
                                           @RequestParam(value = "page", defaultValue = "0")int page,
                                           ModelMap modelMap) {
        List<MessageBoard> messageBoards = messageBoardRepository.findByBlogIdOrderByCreateTimeDesc(blogId);
        List<MessageResult> messageResults = new ArrayList<>();
        int pages = messageBoards.size() / 8;
        page = page < pages ? page : pages;
        int last = (page + 1) * 8 < messageBoards.size() ? (page + 1) * 8 : messageBoards.size();
        for(int i = 0; i < messageBoards.size(); i++) {
            MessageResult messageResult = new MessageResult();
            messageResult.setMessage(messageBoards.get(i));
            messageResult.setFloor(messageBoards.size() - i);
            messageResult.setUser(userRepository.findOne(messageBoards.get(i).getUserId()).clean());
            messageResults.add(messageResult);
        }
        try {
            messageResults =  messageResults.subList(page * 8, last);
        } catch (Exception e) {

        } finally {
            return messageResults;
        }
    }

    /*
    根据留言id获得留言内容的请求
     */
    @ResponseBody
    @RequestMapping(value = "/getSingleMessage.do")
    public String getSingleMessage(@RequestParam(value = "messageId")int messageId, ModelMap modelMap) {
        MessageBoard messageBoard = messageBoardRepository.findOne(messageId);
        return messageBoard.getContent();
    }
}
