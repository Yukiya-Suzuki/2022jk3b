<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>エラー</title>
		<style>
			header {
				color: white;
				border: 3px dashed #927141;
				background-color: #c79852;
				box-shadow: 0 0 3px 3px #e4d4bc;
				padding: 0.3em 0.5em;
				text-align: center
			}
		</style>
	</head>
	<body>
		<header>
			<h1>エラーが発生しました</h1>
		</header>
		<main>
			<h2>エラー原因：</h2>
			<%
				List<String> errList = (List<String>)request.getAttribute("errList");
				for(String error : errList) {
			%>
			<h2><%= error %></h2>
			<%
				}
			%>
		</main>
	</body>
</html>