<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	top-margin: 0;
	bottom-margin: 0;
	left-margin: 0;
	right-margin: 0
}

h1, h2, h3 {
	margin: 0;
}

.header {
	position: fixed;
	width: 100vw;
	height: 100px;
	background: pink;
}

.menu {
	position: fixed;
	margin-top: 100px;
	float: left;
	height: 100vh;
	width: 200px;
	background-color: gray;
}

.content {
	position: fixed;
	margin-top: 100px;
	margin-left: 250px;
	top: 50px;
	height: 100vh;
}
</style>
</head>
<body>

	<!-- header -->

	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>


	<!-- main -->

	<div class="menu">
		<tiles:insertAttribute name="menu" />
	</div>
	<div class="content">
		<tiles:insertAttribute name="content" />
	</div>



	</div>

</body>
</html>






