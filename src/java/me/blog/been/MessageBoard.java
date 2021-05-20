package me.blog.been;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by guyu on 2016/11/14.
 */
@Entity
//@Table(name = "message_board", schema = "my_blog", catalog = "")
public class MessageBoard {
    private int id;
    private Integer blogId;
    private Integer userId;
    private String content;
    private Timestamp createTime;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "blog_id", nullable = true)
    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    @Basic
    @Column(name = "user_id", nullable = true)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "content", nullable = true, length = 255)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "create_time", nullable = true)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MessageBoard that = (MessageBoard) o;

        if (id != that.id) return false;
        if (blogId != null ? !blogId.equals(that.blogId) : that.blogId != null) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (blogId != null ? blogId.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }

    private User user;

    @Transient
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
        if(this.user != null)
            this.user.clean();
    }
}
