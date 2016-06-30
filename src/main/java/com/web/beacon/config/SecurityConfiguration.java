package com.web.beacon.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception{
		auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery("select USER_NAME,PASSWD,1 from BEACON_USER where USER_NAME = ? ")
		.authoritiesByUsernameQuery("select USER_NAME,role from BEACON_USER where USER_NAME = ?");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests()
		.antMatchers("/","/add/user","/resources/**").permitAll()
		.antMatchers("/admin","/resources/service.js").access("hasRole('ADMIN')")
		.antMatchers("/userpage","/jump").authenticated().and().formLogin()
		.and().formLogin().loginPage("/login")
		.usernameParameter("username").passwordParameter("password").and().csrf()/*.and().exceptionHandling().accessDeniedPage("/access_Denied")*/;
		
		
//		http.csrf().disable();
		
		
	}
	
	@Autowired
	DataSource dataSource;
}

