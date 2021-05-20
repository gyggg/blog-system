package me.blog.result;

import me.blog.been.User;

/**
 * Created by guyu on 2016/11/28.
 */
public class UserResult {
    private User user;
    private int wrongId = 0;

    final public int CURRENT_PASSWORD_WRONG = 0x0001;
    final public int PASSWORD_NOT_SAME = 0x0002;
    final public int NICK_NAME_EMPTY = 0x0004;
    final public int NOT_ADMIN = 0x0008;
    final public int CANNOT_FIND_USER = 0x0010;
    final public int CANNOT_SET_MINE = 0x0020;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getWrongId() {
        return wrongId;
    }

    public void setWrongId(int wrongId) {
        this.wrongId = wrongId;
    }
}
