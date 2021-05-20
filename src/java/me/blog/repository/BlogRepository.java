package me.blog.repository;

import me.blog.been.Blog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guyu on 2016/10/18.
 */
@Repository
public interface BlogRepository extends JpaRepository<Blog, Integer> {
    public List<Blog> findByUserIdOrderByLikes(int userId);
    public List<Blog> findByUserIdOrderByCreateTimeDesc(int userId);
}
