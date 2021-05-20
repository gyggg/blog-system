package me.blog.been;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.List;

/**
 * Created by guyu on 2018/2/10.
 */
@Entity
@javax.persistence.Table(name = "blog_type", schema = "my-blog", catalog = "")
public class BlogType {
    private int id;

    @Id
    @javax.persistence.Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int userId;

    @Basic
    @javax.persistence.Column(name = "user_id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    private String name;

    @Basic
    @javax.persistence.Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private Integer parentTypeId;

    @Basic
    @javax.persistence.Column(name = "parent_type_id")
    public Integer getParentTypeId() {
        return parentTypeId;
    }

    public void setParentTypeId(Integer parentTypeId) {
        this.parentTypeId = parentTypeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BlogType blogType = (BlogType) o;

        if (id != blogType.id) return false;
        if (userId != blogType.userId) return false;
        if (name != null ? !name.equals(blogType.name) : blogType.name != null) return false;
        if (parentTypeId != null ? !parentTypeId.equals(blogType.parentTypeId) : blogType.parentTypeId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + userId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (parentTypeId != null ? parentTypeId.hashCode() : 0);
        return result;
    }

    private List<BlogType>  childBlogTypes;

    @Transient
    public List<BlogType> getChildBlogTypes() {
        return childBlogTypes;
    }

    public void setChildBlogTypes(List<BlogType> childBlogTypes) {
        this.childBlogTypes = childBlogTypes;
    }
}
