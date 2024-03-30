package com.ecommerce.repositories;

import com.ecommerce.models.User;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u WHERE u.github_id = ?1")
    User findByGithubId(String github_id);

    @EntityGraph(attributePaths = "authorities")
    Optional<User> findByUsername(String username);
}
