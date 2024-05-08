package com.kdt.carrotpop.ex;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(value = { "com.kdt.carrotpop.ex.mapper" })
@SpringBootApplication
public class CarrotpopProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(CarrotpopProjectApplication.class, args);
	}

}
