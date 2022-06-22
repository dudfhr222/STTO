package com.study.stto;

import com.study.stto.config.AppConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@Slf4j
@Import(AppConfig.class)
@SpringBootApplication
public class SttoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SttoApplication.class, args);
	}

}
