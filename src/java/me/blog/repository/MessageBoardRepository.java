package me.blog.repository;

import me.blog.been.MessageBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guyu on 2016/10/18.
 */
@Repository
public interface MessageBoardRepository extends JpaRepository<MessageBoard, Integer> {
    public List<MessageBoard> findByBlogIdOrderByCreateTimeDesc(int blogId);
}
