package com.kdt.carrotpop.ex;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class JustTest {

	@Test
	void test() throws IOException {
		// fail("Not yet implemented");

		// tempDirectory.getAbsolutePath();
		// System.getProperty("java.io.tmpdir");
		// System.out.println(System.getProperty("java.io.tmpdir"));
		// System.out.println(System.getProperty("com.kdt.carrotpop.ex"));
		// System.out.println(System.getProperty);
		System.out.println(System.getProperty("user.dir"));

		byte[] fileContent = FileUtils.readFileToByteArray(new File("C:\\upload\\2.png"));
		String encodedString = Base64.getEncoder().encodeToString(fileContent);
		System.out.println(encodedString);

	}

}
