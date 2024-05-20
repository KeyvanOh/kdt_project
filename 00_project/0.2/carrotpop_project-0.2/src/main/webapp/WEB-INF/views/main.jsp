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
console.log("Here is main.jsp");
$("<div>").appendTo("body")
	.text("중고거래")
	.on("click", function() {
		console.log("중고거래 clicked");
		window.location.href = "/fleamarket"
	})
;
/*
let usersInfo = function() {
	let userid = null;
	$.ajax({
		type: "get",
		url: "/ajax/login_info",
		data:
		{
		},
		async: false,
		success: function(result, status) {
			console.log(result);
			userid = result;
		},
	});
	return userid;
};
*/
let userid = usersInfo();

if (userid == "") {
	$("<div>").appendTo("body")
		.text("로그인")
		//.text(userid)
		.on("click", function() {
			console.log("로그인 clicked");
			window.location.href = "/login";
		})
	;
	$("<div>").appendTo("body")
		.text("회원가입")
		.on("click", function() {
			console.log("회원가입 clicked");
			window.location.href = "/register";
			//window.location.replace("/register");
		})
	;
} else {
	$("<div>").appendTo("body")
		//.text("로그인")
		.text(userid)
		.on("click", function() {
			console.log("userid clicked");
			//window.location.href = "/login";
		})
	;
	$("<div>").appendTo("body")
		.text("로그아웃")
		.on("click", function() {
			console.log("로그아웃 clicked");
			window.location.href = "/logout";
		})
	;
};







</script>
</html>