package com.ecommerce.controllers;

import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "succeesssss";
    }

    @GetMapping("/userinfo")
    public String usuarioinfo() {
        return "succeesssss";
    }

    @GetMapping("/protected")
    public String homeProtected(OAuth2AuthenticationToken authentication) {
        System.out.println(authentication.getAuthorities());
        //System.out.println(authentication.getCredentials().toString());
        //System.out.println(authentication.getDetails().toString());
        return "protected";
    }
}
