package me.blog.repository;

import me.blog.been.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guyu on 2016/10/18.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    public List<User> findByEmailAndPassword(String email, String password);
    public List<User> findByEmail(String email);
}
