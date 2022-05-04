package com.ssafy.happyhouse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@MapperScan(basePackages = "com.ssafy.**.repo")
public class HappyhouseApplication {
    public static void main(String[] args) {
        SpringApplication.run(HappyhouseApplication.class, args);
    }

}
