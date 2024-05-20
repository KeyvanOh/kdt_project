console.log("Loading cpp_ajax.js");

let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
console.log("token: " + token);
console.log("header: " + header);
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

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


