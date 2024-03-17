package com.ecommerce.dtos;

import java.util.Objects;

public class UserDTO {
    private String name;
    private String github_id;
    private String avatar;

    public UserDTO(){}

    public UserDTO(String name, String github_id, String avatar) {
        this.name = name;
        this.github_id = github_id;
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGithub_id() {
        return github_id;
    }

    public void setGithub_id(String github_id) {
        this.github_id = github_id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDTO userDTO = (UserDTO) o;
        return Objects.equals(name, userDTO.name) && Objects.equals(github_id, userDTO.github_id) && Objects.equals(avatar, userDTO.avatar);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, github_id, avatar);
    }
}
