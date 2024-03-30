package com.ecommerce.dtos;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@AllArgsConstructor
@Setter
@Getter
public class UserDTO {
    private String name;
    private String github_id;
    private String avatar;
    private String username;

    public UserDTO(){}
}
