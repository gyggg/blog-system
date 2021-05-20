package me.blog.been;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by guyu on 2016/11/28.
 */
@Entity
public class User {
    private int id;
    private String nickname;
    private String email;
    private String password;
    private String cookie;
    private String verify;
    private String headImage;
    private String sex;
    private String userDescribe;
    private String work;
    private Integer privilege;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "nickname", nullable = false, length = 255)
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 255)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "cookie", nullable = true, length = 255)
    public String getCookie() {
        return cookie;
    }

    public void setCookie(String cookie) {
        this.cookie = cookie;
    }

    @Basic
    @Column(name = "verify", nullable = true, length = 255)
    public String getVerify() {
        return verify;
    }

    public void setVerify(String verify) {
        this.verify = verify;
    }

    @Basic
    @Column(name = "head_image", nullable = true, length = 255)
    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    @Basic
    @Column(name = "sex", nullable = true, length = 255)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "user_describe", nullable = true, length = 255)
    public String getUserDescribe() {
        return userDescribe;
    }

    public void setUserDescribe(String userDescribe) {
        this.userDescribe = userDescribe;
    }

    @Basic
    @Column(name = "work", nullable = true, length = 255)
    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    @Basic
    @Column(name = "privilege", nullable = true)
    public Integer getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Integer privilege) {
        this.privilege = privilege;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (nickname != null ? !nickname.equals(user.nickname) : user.nickname != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (cookie != null ? !cookie.equals(user.cookie) : user.cookie != null) return false;
        if (verify != null ? !verify.equals(user.verify) : user.verify != null) return false;
        if (headImage != null ? !headImage.equals(user.headImage) : user.headImage != null) return false;
        if (sex != null ? !sex.equals(user.sex) : user.sex != null) return false;
        if (userDescribe != null ? !userDescribe.equals(user.userDescribe) : user.userDescribe != null) return false;
        if (work != null ? !work.equals(user.work) : user.work != null) return false;
        if (privilege != null ? !privilege.equals(user.privilege) : user.privilege != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nickname != null ? nickname.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (cookie != null ? cookie.hashCode() : 0);
        result = 31 * result + (verify != null ? verify.hashCode() : 0);
        result = 31 * result + (headImage != null ? headImage.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (userDescribe != null ? userDescribe.hashCode() : 0);
        result = 31 * result + (work != null ? work.hashCode() : 0);
        result = 31 * result + (privilege != null ? privilege.hashCode() : 0);
        return result;
    }

    public User clean() {
        this.password = "";
        this.cookie = "";
        return this;
    }
}
