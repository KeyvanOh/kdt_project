package com.kdt.carrotpop.ex.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kdt.carrotpop.ex.service.CppService;
import com.kdt.carrotpop.ex.vo.AuthorityVO;
import com.kdt.carrotpop.ex.vo.ItemVO;
import com.kdt.carrotpop.ex.vo.ItemcategoryVO;
import com.kdt.carrotpop.ex.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/ajax")
public class CppRestController {
	@Autowired
	private CppService cppService;

	@RequestMapping("/users_insert")
	public void usersInsert(@RequestParam("userid") String userid, @RequestParam("password") String password,
			@RequestParam("nickname") String nickname, @RequestParam("postcode") String postcode,
			@RequestParam("address") String address, @RequestParam("addressmore") String addressmore) {
		log.info("usersInsert()..");
		UsersVO vo = new UsersVO(userid, password, nickname, postcode, address, addressmore);
		cppService.registerUser(vo);

		// BuserVO vo = new BuserVO(buid, bupw);
		// boardService.registerBuser(vo);
	}

	@RequestMapping("/authority_list")
	public List<AuthorityVO> authorityList(@RequestParam("userid") String userid) {
		log.info("authority_list()..");
		return cppService.getListWithUserid(userid);
	}

	@GetMapping("/login_info")
	// public void loginInfo(Authentication authentication, Principal principal) {
	public String loginInfo(Authentication authentication, Principal principal) {
		log.info("loginInfo()..");
		String userid = null;
		if (principal != null) {
			UserDetails user = (UserDetails) authentication.getPrincipal();
			System.out.println(user.getUsername());
			System.out.println(user.getAuthorities());
			userid = user.getUsername();
		} else {
			System.out.println("LOGOUT SUSSESS I GUESS?");
			// userid = null;
		}
		return userid;

		// return "/main";
	}
	
	
	
	@RequestMapping("/upload_item")
	public void uploadItem(
			@RequestParam("sellerid") String sellerid, 
			@RequestParam("title") String title,
			@RequestParam("price") int price, 
			@RequestParam("categorynumber") int categorynumber,
			@RequestParam("content") String content,
			@RequestParam("howmanyimgs") int howmanyimgs
	) {
		log.info("uploadItem()..");
		//UsersVO vo = new UsersVO(userid, password, nickname, postcode, address, addressmore);
		ItemVO vo = new ItemVO();
		
		vo.setSellerid(sellerid);
		vo.setTitle(title);
		vo.setPrice(price);
		vo.setCategorynumber(categorynumber);
		vo.setContent(content);
		vo.setHowmanyimgs(howmanyimgs);
		
		//cppService.registerUser(vo);
		cppService.uploadGoods(vo);

		// BuserVO vo = new BuserVO(buid, bupw);
		// boardService.registerBuser(vo);
	}	
	
	
	
	
	
	
	

	@RequestMapping("/upload_file")
	public void uploadFile(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		log.info("uploadFile()..");

		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		// System.out.println(filePart.getHeaderNames());
		// FilenameUtils.getExtension(fileName);
		System.out.println(fileName);
		// System.out.println(FilenameUtils.getExtension(fileName));

		System.out.println(fileName.substring(fileName.length() - 4));

		
		
		
		
		//long itemid = 0L;
		long itemid = cppService.getLatestItemid();
		
		if (fileName.substring(fileName.length() - 4).equals(".png")) {
			int n = 0;

			System.out.println(request.getParts());

			for (Part part : request.getParts()) {
				// part.write("C:\\upload\\" + fileName);
				// part.write("C:\\upload\\" + (n++) + ".png");
				//part.write("C:\\upload\\" + (n++));
				part.write("C:\\upload\\" + itemid + "-" + (n++));
				// part.write("C:\\Users\\jk\\Documents\\workspace-sts-3.9.11.RELEASE\\carrotpop_project-0.2\\src\\main\\resources\\static\\"
				// + (n++) + ".png");
				// part.write("\\" + (n++) + ".png");
				// part.write(System.getProperty("user.dir") +
				// "\\src\\main\\resources\\static\\" + (n++) + ".png");
				// part.write((n++) + ".png");
				// part.write("whereami" + ".png");
				// part.write("/whereami" + ".png");
				// part.write("C:\\upload\\" + (n++) + FilenameUtils.getExtension(fileName));
			}
		}
		;

		/*
		 * 
		 * int n = 0; for (Part part : request.getParts()) { //
		 * part.write("C:\\upload\\" + fileName); part.write("C:\\upload\\" + (n++));
		 * //part.write("C:\\upload\\" + (n++) + FilenameUtils.getExtension(fileName));
		 * } ;
		 */

		// Collection<Part> parts = request.getParts();
		// Part[] parts = request.getParts().toArray();

		// for (int i = 0; i <= )

	}

	@RequestMapping("/get_image")
	public String getImage(@RequestParam("filename") String filename) throws IOException {
		log.info("getImage()..");

		byte[] fileContent = FileUtils.readFileToByteArray(new File("C:\\upload\\" + filename));
		String encodedString = Base64.getEncoder().encodeToString(fileContent);

		return "data:image/png;base64," + encodedString;
	}

	@RequestMapping("/itemcategory_list")
	public List<ItemcategoryVO> itemcategoryList() {
		log.info("itemcategoryList()..");
		// return cppService.getListWithUserid(userid);
		// return null;
		return cppService.getItemcategoryList();
	}

}
