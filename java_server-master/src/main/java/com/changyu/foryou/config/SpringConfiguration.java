package com.changyu.foryou.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;


@Configuration
@ComponentScan("com.changyu.foryou")
@PropertySource("application.properties")
@EnableAsync
@EnableScheduling
@Import(
        MybatisConfig.class
)
public class SpringConfiguration {

}
