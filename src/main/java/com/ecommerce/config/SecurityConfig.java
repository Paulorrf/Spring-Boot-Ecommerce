package com.ecommerce.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.ecommerce.services.CustomOAuth2UserService;
import com.ecommerce.services.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private CustomOAuth2UserService oauthUserService;

    @Autowired
    private UserService userService;

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .authorizeHttpRequests(auth -> {
                    auth.requestMatchers("/").permitAll();
                    //auth.requestMatchers(HttpMethod.GET, "/user/admin").hasRole("ADMIN");
                    auth.anyRequest().authenticated();
                })
                // .oauth2Login(Customizer.withDefaults())
                .oauth2Login(Customizer.withDefaults())
                //.formLogin(Customizer.withDefaults())
                //.rememberMe(Customizer.withDefaults())
                .build();
    }
}
