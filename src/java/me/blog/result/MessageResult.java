package me.blog.result;

import me.blog.been.MessageBoard;
import me.blog.been.User;

/**
 * Created by guyu on 2016/11/16.
 */
public class MessageResult {
    User user;
    MessageBoard message;
    int floor;

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public MessageBoard getMessage() {
        return message;
    }

    public void setMessage(MessageBoard message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
