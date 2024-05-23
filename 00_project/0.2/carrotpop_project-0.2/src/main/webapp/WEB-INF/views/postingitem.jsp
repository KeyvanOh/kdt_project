<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

</head>
<body>

</body>
<script src="cpp_ajax.js"></script>
<script>
console.log("Here is postingitem.jsp");

/*
ITEMID         NOT NULL NUMBER(19)     
SELLERID       NOT NULL VARCHAR2(14)   
TITLE          NOT NULL VARCHAR2(100)  
PRICE          NOT NULL NUMBER(10)     
CATEGORYNUMBER NOT NULL NUMBER(2)      
UPLOADTIME     NOT NULL DATE           
CONTENT        NOT NULL VARCHAR2(4000) 
HIT            NOT NULL NUMBER(19)  
*/

$("<div>").appendTo("body")
	.attr("id", "title")
;
$("<span>").appendTo($("#title"))
	.text("제목 : ")
;
$("<input>").appendTo($("#title"))
;

$("<div>").appendTo("body")
	.attr("id", "content")
;
$("<span>").appendTo($("#content"))
	.text("설명 : ")
;
$("<textarea>").appendTo($("#content"))
;


$("<div>").appendTo("body")
	.attr("id", "price")
;
$("<span>").appendTo($("#price"))
	.text("가격 : ")
;
$("<input>").appendTo($("#price"))
	//.attr("type", "number")
;

$("<div>").appendTo("body")
	.attr("id", "category")
;
$("<span>").appendTo($("#category"))
	.text("분류 : ")
;
$("<select>").appendTo($("#category"))
	.attr("id", "select_category")
	//.attr("type", "number")
;

let getItemcategories = function() {
	let categories = null;
	$.ajax({
		type: "get",
		url: "/ajax/itemcategory_list",
		data:
		{
		},
		async: false,
		success: function(result, status) {
			categories = result;
		},
	});
	return categories;
};
//console.log(getItemcategories());
for (let category of getItemcategories()) {
	//console.log(category);
	$("<option>").appendTo($("#select_category"))
		.val(category.itemcategoryid)
		.text(category.itemcategoryname)
	;	
}

/*
$("<option>").appendTo($("#select_category"))
	.val(1)
	.text("111")
;
$("<option>").appendTo($("#select_category"))
	.val(2)
	.text("222")
;
*/




//let formData = new FormData();

$("<div>").appendTo("body")
	.attr("id", "file")
;
//let formData = new FormData();

let pngs = [];

//let fileReader = new FileReader();
//console.log(fileReader);

$("<input>").appendTo($("#file"))
	.attr("type", "file")
	.on("change", function() {
		
		//console.log("change???");
		let file = $("#file input").prop("files")[0];
		
		//console.log(file);
		//console.log(fileReader.readAsDataURL(file));
		//console.log(URL.createObjectURL(file));
		//console.log(fileReader.readAsDataURL(file[0]));
		//fileReader.readAsDataURL(file);
		
		//formData.append("file", $("#file input").prop("files")[0]);
		//formData.append("file", file);
		
		pngs.push(file);
		console.log(pngs);
		
		/*
		//console.log($("#file input").prop("files")[0]);
		//console.log($("#file input").prop("files")[0].name);
		console.log(file.name);
		//console.log(formData);
		//console.log(formData.keys());
		console.log(Array.from(formData.keys()).length);
		console.log(Array.from(formData.entries()).length);
		for (let entry of Array.from(formData.entries())) {
			
			//console.log(entry);
			console.log(entry[1]);
			console.log(entry[1].name);
			console.log(entry[1].size);
			console.log(entry[1].lastModified);
		}
		
		
		//console.log(formData.entries().length);
		//console.log(formData.entries());
		
		
		//console.log(file);
		//console.log(file.size);
		console.log(file.lastModified);
		*/
		
		console.log(URL.createObjectURL(file));
		
		let divFile = $("<div>").appendTo($("#file"))
			//.attr("id", "")
			//.attr("id", "f" + file.size)
			//.attr("id", "f" + file.lastModified)
			.attr("id", "f" + file.lastModified)
			//.attr("id", "f" + file.name)
			//.text(file.size)
			//.text(file.size + "bytes")
			.text(file.name + " (" + file.size + "bytes)")
			.on("click", function() {
				
				//console.log("before: " + Array.from(formData.entries()).length);
				//console.log(file.name);
				//formData.delete(file.name);
				//formData.delete("file");
				//console.log("after: " + Array.from(formData.entries()).length);
				
				
				//console.log(pngs);
				//console.log();
				
				//console.log(file.name);
				pngs.forEach(function(item, index) {
					
					//console.log(item);
					//console.log(item.name);
					//console.log(index);
					
					if (file.name == item.name) {
						
						console.log(index);
						pngs.splice(index, 1)
						
						//$(this).remove();
						//$(this).parent().remove();
						//$("this").remove();
						
						//console.log("#f" + file.name);
						//$("#f" + file.name).remove();
						
						//console.log(pngs);
						$("#f" + file.lastModified).remove();
						
						//console.log($(this));
						
						console.log(pngs);
					};
					
				});
				
				
				
			})
		;
		
		//console.log($(this));
		//console.log(divFile);
		//$("<img>").appendTo($("#f" + file.lastModified))
		$("<img>").appendTo(divFile)
			.attr("src", URL.createObjectURL(file))
			//.css("max-width", "600px")
			.css("max-height", "2em")
		;
		
		
		
		
		
		
		console.log("one file stored.");
	})
;



let uploadFile = function() {
	let formData = new FormData();
	//formData.append("file", $("#file input").prop("files")[0]);
	//formData.append("file", $("#file input").prop("files")[0]);
	
	for (let png of pngs) {
		formData.append("file", png);
	};
	
	$.ajax({
		type: "post",
		contentType: false,
		processData: false,
		url: "/ajax/upload_file",
		data: formData,
		success: function(result, status) {
			console.log(status);
		},
	});
};





let uploadItem = function() {
	$.ajax({
		type: "post",
		url: "/ajax/upload_item",
		data:
		{
			'sellerid': usersInfo(),
			'title': $("#title input").val(),
			'price': $("#price input").val(),
			'categorynumber': $("#category select").val(),
			'content': $("#content textarea").val(),
			'howmanyimgs': pngs.length
		},
		async: false,
		success: function(result, status) {
		},
	});	
	
};






$("<div>").appendTo("body")
	.attr("id", "upload")
	//.text("업로드")
	.text("등록")
	.on("click", function() {
		console.log(pngs);
		
		console.log("sellerid: "+ usersInfo());
		console.log("title: " + $("#title input").val());
		console.log("price: " + $("#price input").val());
		console.log("categorynumber: " + $("#category select").val());
		console.log("content: " + $("#content textarea").val());
		console.log("howmanyimgs: " + pngs.length);
		
		uploadItem();
		uploadFile();
		
		
		//console.log($("#file input").val());
	})
;









</script>
</html>