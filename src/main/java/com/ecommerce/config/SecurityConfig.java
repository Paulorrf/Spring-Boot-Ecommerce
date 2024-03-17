package com.ecommerce.config;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.ecommerce.dtos.UserDTO;
import com.ecommerce.models.User;
import com.ecommerce.services.CustomOAuth2UserService;
import com.ecommerce.services.UserService;
import com.ecommerce.utils.CustomOAuth2User;

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
                    auth.anyRequest().authenticated();
                })
                // .oauth2Login(Customizer.withDefaults())
                .oauth2Login(oauth2 -> oauth2
                        .userInfoEndpoint(userInfo -> userInfo.userService(oauthUserService)).successHandler(new AuthenticationSuccessHandler() {

                            @Override
                            public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                                                Authentication authentication) throws IOException, ServletException {

                                CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();

                                String github_id = oauthUser.getAttributes().get("id").toString();

                                User userExist = userService.findByGithubId(github_id);

                                if(userExist == null) {
                                    UserDTO userDTO = new UserDTO(oauthUser.getName(), oauthUser.getAttributes().get("id").toString(), oauthUser.getAttributes().get("avatar_url").toString());

                                    userService.create(userDTO);
                                }

                                response.sendRedirect("/");
                            }
                        })
                )
                .formLogin(Customizer.withDefaults())
                //.rememberMe(Customizer.withDefaults())
                .build();
    }
}
