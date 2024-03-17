package com.ecommerce.services;

import com.ecommerce.dtos.UserDTO;
import com.ecommerce.mappers.UserMapper;
import com.ecommerce.models.User;
import com.ecommerce.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    UserRepository repository;

    UserMapper userMapper;

    @Autowired
    public UserService(UserRepository repository, UserMapper userMapper) {
        this.repository = repository;
        this.userMapper = userMapper;
    }


    public UserDTO create(UserDTO userDTO) {
        User userEntity = userMapper.userDTOtoUser(userDTO);
        User savedUser = repository.save(userEntity);

        UserDTO dto = userMapper.userToUserDTO(savedUser);
        return dto;
    }

    public User findByGithubId(String github_id) {
        return repository.findByGithubId(github_id);
    }

}
