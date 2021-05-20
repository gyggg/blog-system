package me.blog.model;

import me.blog.been.BlogType;
import me.blog.repository.BlogTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guyu on 2018/2/10.
 */
@Service
public class BlogTypeModel {
    @Autowired
    private BlogTypeRepository blogTypeRepository;

    public List<BlogType> getUserParentBlogType(int userId) {
        List<BlogType> blogTypes = blogTypeRepository.findByUserIdAndParentTypeId(userId, 0);
        for(BlogType blogType : blogTypes) {
            blogType.setChildBlogTypes(getChildBlogType(blogType.getId()));
        }
        return blogTypes;
    }

    public List<BlogType> getChildBlogType(int parentId) {
        return blogTypeRepository.findByParentTypeId(parentId);
    }

    public BlogType getBlogTypeById(int blogTypeId) {
        return blogTypeRepository.findOne(blogTypeId);
    }
}
