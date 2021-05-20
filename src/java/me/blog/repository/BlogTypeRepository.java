package me.blog.repository;

import me.blog.been.BlogType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guyu on 2018/2/10.
 */
@Repository
public interface BlogTypeRepository extends JpaRepository<BlogType, Integer> {
    List<BlogType> findByUserIdAndParentTypeId(Integer userId, Integer parenTypeId);
    List<BlogType> findByParentTypeId(Integer parentTypeId);
}
