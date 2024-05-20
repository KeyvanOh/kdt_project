<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous"
/>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
  crossorigin="anonymous"
></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

</head>
<body>



</body>
<script src="cpp_ajax.js"></script>
<script>
console.log("Here is register.jsp");
/*
let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

console.log("token: " + token);
console.log("header: " + header);

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
*/

/*
USERID      NOT NULL VARCHAR2(14)  
PASSWORD    NOT NULL VARCHAR2(60)  
NICKNAME    NOT NULL VARCHAR2(30)  
POSTCODE    NOT NULL VARCHAR2(7)   
ADDRESS     NOT NULL VARCHAR2(300) 
ADDRESSMORE NOT NULL VARCHAR2(300) 
*/

$("<div>").appendTo("body")
	.attr("id", "userid")
;
$("<span>").appendTo($("#userid"))
	.text("아이디 : ")
;
$("<input>").appendTo($("#userid"))
;
//let newId = false;
//let newId = ("aa", false);
//let isNewId = false;
let checkedId = "";
/*
let authorityList = function() {
	let authorities = [];
	$.post("/ajax/authority_list", {
		'userid': $("#userid input").val()
	},
	//async: false,
	function(result, status) {
		//console.log(result);
		//console.log("sgd");
		authorities = result;
	});
	return authorities;
};
*/

/*
let authorityList = function() {
	let authorities = [];
	$.ajax({
		type: "post",
		url: "/ajax/authority_list",
		data:
		{
			'userid': $("#userid input").val()
		},
		async: false,
		success: function(result, status) {
			authorities = result;
		},
	});
	return authorities;
};
*/

$("<span>").appendTo($("#userid"))
	.text("중복확인")
	.on("click", function() {
		console.log("중복확인 clicked");
		
		//authorityList();
		//console.log(authorityList());
		console.log(authorityList().length);
		
		if ($("#userid input").val() != "" && authorityList().length == 0) {
			//newId = true;
			//isNewId = true;
			checkedId = $("#userid input").val();
			console.log("중복되지 않음");
		} else {
			//newId = false;
			//isNewId = false;
			checkedId = "";
			console.log("중복됨");
		};
		
		//console.log("newId: " + newId);
		//console.log("isNewId: " + isNewId);
		console.log("checkedId: " + checkedId);
	})
;

$("<div>").appendTo("body")
	.attr("id", "password")
;
$("<span>").appendTo($("#password"))
	.text("비밀번호 : ")
;
$("<input>").appendTo($("#password"))
	.attr("type", "password")
;

$("<div>").appendTo("body")
	.attr("id", "password_check")
;
$("<span>").appendTo($("#password_check"))
	.text("비밀번호 확인 : ")
;
$("<input>").appendTo($("#password_check"))
	.attr("type", "password")
;

$("<div>").appendTo("body")
	.attr("id", "nickname")
;
$("<span>").appendTo($("#nickname"))
	.text("닉네임 : ")
;
$("<input>").appendTo($("#nickname"))
;

$("<div>").appendTo("body")
	.attr("id", "postcode")
;
$("<span>").appendTo($("#postcode"))
	.text("우편번호 : ")
;
$("<input>").appendTo($("#postcode"))
;

$("<div>").appendTo("body")
	.attr("id", "address")
;
$("<span>").appendTo($("#address"))
	.text("주소 : ")
;
$("<input>").appendTo($("#address"))
;

$("<div>").appendTo("body")
	.attr("id", "addressmore")
;
$("<span>").appendTo($("#addressmore"))
	.text("상세주소 : ")
;
$("<input>").appendTo($("#addressmore"))
;


/*
let usersInsert = function() {
	$.post("/ajax/users_insert", {
		'userid': $("#userid input").val(),
		'password': $("#password input").val(),
		'nickname': $("#nickname input").val(),
		'postcode': $("#postcode input").val(),
		'address': $("#address input").val(),
		'addressmore': $("#addressmore input").val()
	},
	function(result, status) {
	});
};
*/


/*
let usersInsert = function() {
	$.ajax({
		type: "post",
		url: "/ajax/users_insert",
		data:
		{
			'userid': $("#userid input").val(),
			'password': $("#password input").val(),
			'nickname': $("#nickname input").val(),
			'postcode': $("#postcode input").val(),
			'address': $("#address input").val(),
			'addressmore': $("#addressmore input").val()
		},
		async: false,
		success: function(result, status) {
		},
	});
};
*/


$("<div>").appendTo("body")
	.text("가입하기")
	.on("click", function() {
		console.log("가입하기 clicked");
		
		console.log($("#userid input").val());
		console.log($("#password input").val());
		console.log($("#password_check input").val());
		console.log($("#nickname input").val());
		console.log($("#postcode input").val());
		console.log($("#address input").val());
		console.log($("#addressmore input").val());
		/*
		USERID      NOT NULL VARCHAR2(14)  
		PASSWORD    NOT NULL VARCHAR2(60)  
		NICKNAME    NOT NULL VARCHAR2(30)  
		POSTCODE    NOT NULL VARCHAR2(7)   
		ADDRESS     NOT NULL VARCHAR2(300) 
		ADDRESSMORE NOT NULL VARCHAR2(300) 
		*/
		if ($("#userid input").val() == "") {
			console.log("empty userid");
		} else if ($("#userid input").val() != checkedId) {
			console.log("아이디 중복확인 필요");
		} else if ($("#password input").val() == "") {
			console.log("empty password");
		} else if ($("#password input").val() != $("#password_check input").val()) {
			console.log("different passwords");
		} else if ($("#nickname input").val() == "") {
			console.log("empty nickname");
		} else if ($("#postcode input").val() == "") {
			console.log("empty postcode");
		} else if ($("#address input").val() == "") {
			console.log("empty address");
		} else if ($("#addressmore input").val() == "") {
			console.log("empty addressmore");
		} else {
			usersInsert();
			console.log("usersInsert()..");
			
			if (authorityList().length > 0) {
				console.log("회원가입성공");
				//window.location.href = "/"
				window.location.replace("/");
			} else {
				console.log("회원가입실패");
			};
		};
	})
;



</script>
</html>