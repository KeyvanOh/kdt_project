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
<!-- <body onload="document.f.id.focus();"> -->
<body>


<%-- <c:url value="/login" var="loginUrl" />
<form:form name="f" action="${loginUrl}" method="POST">
    <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
    </c:if>
    <p>
        <label for="username">아이디</label>
        <input type="text" id="id" name="id" />
    </p>
    <p>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="pw"/>
    </p>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit" class="btn">로그인</button>
</form:form> --%>


</body>
<script src="cpp_ajax.js"></script>
<script>
console.log("Here is login.jsp");
/*
let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
console.log("token: " + token);
console.log("header: " + header);
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
*/

$("<div>").appendTo("body")
	.attr("id", "userid")
;
$("<span>").appendTo($("#userid"))
	.text("아이디 : ")
;
$("<input>").appendTo($("#userid"))
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

/*
let tryLogin = function() {
	$.ajax({
		type: "post",
		url: "/login",
		data:
		{
			//'userid': $("#userid input").val(),
			//'id': $("#userid input").val(),
			//'pw': $("#password input").val(),
			'userid': $("#userid input").val(),
			'password': $("#password input").val(),
		},
		async: false,
		success: function(result, status) {
			//console.log(result);
			//console.log(status);
		},
	});
};
*/

$("<div>").appendTo("body")
	.text("로그인")
	.on("click", function() {
		console.log("로그인 clicked");
		
		console.log($("#userid input").val());
		console.log($("#password input").val());
		if ($("#userid input").val() == "") {
			console.log("empty userid");
		} else if ($("#password input").val() == "") {
			console.log("empty password");
		} else {
			console.log("trying login");
			tryLogin();
			//console.log(authorityList());
			console.log(usersInfo());
			if ($("#userid input").val() == usersInfo()) {
				console.log("login SUCCESS");
				window.location.replace("/");
			} else {
				console.log("login FAILED");
			};
		};
	})
;


</script>
</html>