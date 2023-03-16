<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-family: "Nanum Gothic", cursive;
}

body {
	margin: 0;
}

h1, h2, h3 {
	margin: 0;
}

a {
	text-decoration: none !important
}

a:hover {
	color: red !important;
}

.logo {
	position: fixed;
	background: pink;
	width: 100px;
	float: left;
	height: 100px;
}

.header {
	position: fixed;
	width: 100vw;
	height: 100px;
	margin-left: 100px;
	background: #F5DEB3;
	height: 100px;
}

.menu {
	position: fixed;
	margin-top: 100px;
	float: left;
	height: 100vh;
	width: 200px;
	/* background-color: gray; */
}

.content {
	position: fixed;
	margin-top: 100px;
	margin-left: 200px;
	top: 20px;
	left: 20px;
	height: 100vh;
}
</style>
</head>
<body>

	<!-- header -->

	<div class="logo">
		<tiles:insertAttribute name="logo" />
	</div>
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






