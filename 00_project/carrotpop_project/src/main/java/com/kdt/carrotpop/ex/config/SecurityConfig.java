package com.kdt.carrotpop.ex.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.kdt.carrotpop.ex.security.CppUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	// @Autowired
	// private EmpUserDetailsService empUserDetailsService;
	@Autowired
	private CppUserDetailsService cppUserDetailsService;

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
		// web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// auth.userDetailsService(empUserDetailsService).passwordEncoder(passwordEncoder());
		auth.userDetailsService(cppUserDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*
		 * // http.csrf().disable();
		 * http.authorizeRequests().antMatchers("/user/**").hasAnyRole("USER").
		 * antMatchers("/admin/**").hasAnyRole("ADMIN") //
		 * .antMatchers("/board/**").hasAnyRole("ADMIN")
		 * .antMatchers("/emp/list").hasAnyRole("ADMIN").antMatchers("/board/list").
		 * hasAnyRole("ADMIN"); // .antMatchers("/**").permitAll(); // http.formLogin();
		 * http.formLogin().loginPage("/login").usernameParameter("id").
		 * passwordParameter("pw") // .defaultSuccessUrl("/board/list")
		 * .defaultSuccessUrl("/").permitAll();
		 */

		// http.formLogin();

		http.formLogin().loginPage("/login")
				// .loginPage("/")
				// .loginPage("/asd")
				.usernameParameter("id")
				.passwordParameter("pw")
				.defaultSuccessUrl("/")
		// .permitAll()
		;

	}
}