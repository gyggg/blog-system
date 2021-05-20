package me.blog.model;

import me.blog.been.MessageBoard;
import me.blog.repository.MessageBoardRepository;
import me.blog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guyu on 2018/2/12.
 */
@Service
public class MessageBoardModel {
    @Autowired
    MessageBoardRepository messageBoardRepository;
    @Autowired
    UserRepository userRepository;

    public void injectUserToMessageBoard(MessageBoard messageBoard) {
        messageBoard.setUser(userRepository.findOne(messageBoard.getUserId()));
    }

    public void injectUserToMessageBoard(List<MessageBoard> messageBoards) {
        for(MessageBoard messageBoard : messageBoards)
            injectUserToMessageBoard(messageBoard);
    }
}
