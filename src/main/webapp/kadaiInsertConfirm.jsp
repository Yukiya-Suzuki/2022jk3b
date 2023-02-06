<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.KadaiDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>追加の確定</title>
		<style>
			table{
  				border-collapse:separate;
  				border-spacing: 3px;
  				width: 40%;
  				margin-top: 30px;
			}
 
			table th,table td{
  				border-radius: 5px;
  				text-align: center;
  				padding: 5px ;
  				font-size: 20px;
			}
 
			table th{
  				background-color: #c79852;
	  			color: white;
	  			border:solid 1px #927141;
  				font-size: 25px;
			}
			font_text {
    			font-weight:  bolder ;
    			font-family:  serif;
			}
			.yukiya12{
 				width:80px;
				height:50px;
			}
			.yukiya13{
 				width:80px;
				height:50px;
			}
			.yukiya14{
 				width:80px;
				height:50px;
			}
			input{
				font-size: 25px;
			}
			h2{
            	color: white;
            	border: 3px dashed #927141;
            	background-color: #c79852;
            	box-shadow: 0 0 3px 3px #e4d4bc;
            	padding: 0.5em 0.8em;
            	text-align: center
        	}
			p {
				color : red;
			}
		</style>
	</head>
	<body>
		<header>
			<h2>この内容の追加でよろしいですか？</h2>
		</header>
		<main>
			<%
				HttpSession kadaiSession = request.getSession();
				KadaiDataBean newData = (KadaiDataBean)kadaiSession.getAttribute("newBean");
			%>
				<table>
					<tr><th>学籍番号</th>
						<td><%= newData.getId() %></td></tr>
					<tr><th>在籍状態</th>
						<td><%= newData.getStatus() %></td></tr>
					<tr><th>在籍状態確定日</th>
						<td><%= newData.getStatusEnterDate() %></td></tr>
					<tr><th>学生氏名</th>
						<td><%= newData.getName() %></td></tr>
					<tr><th>ふりがな</th>
						<td><%= newData.getFurigana() %></td></tr>
					<tr><th>生年月日</th>
						<td><%= newData.getBirth() %></td></tr>
					<tr><th>本人郵便番号</th>
						<td><%= newData.getPostNumber() %></td></tr>
					<tr><th>本人住所</th>
						<td><%= newData.getAddress() %></td></tr>
					<tr><th>本人電話番号</th>
						<td><%= newData.getTellNumber() %></td></tr>
					<tr><th>本人メールアドレス</th>
					<%
						String Mail;
						if(newData.getMail() != null) {
							Mail = newData.getMail(); 
						} else {
							Mail = "";
						}
					%>
						<td><%=Mail %></td></tr>
					<tr><th>保護者氏名</th>
						<td><%= newData.getParentName() %></td></tr>
					<tr><th>保護者ふりがな</th>
						<td><%= newData.getParentFurigana() %></td></tr>
					<tr><th>保護者郵便番号</th>
						<td><%= newData.getParentPostNumber() %></td></tr>
					<tr><th>保護者住所</th>
						<td><%= newData.getParentAddress() %></td></tr>
					<tr><th>保護者電話番号</th>
						<td><%= newData.getParentTellNumber() %></td></tr>
					<tr><th>保護者メールアドレス</th>
					<%
						String PMail;
						if(newData.getParentMail() != null) {
							PMail = newData.getParentMail(); 
						} else {
							PMail = "";
						}
					%>
						 <td><%= PMail %></td></tr>
				</table>
				<form method="get" action="insertEnter" class="buttonarea">
				<button onclick="history.back()" class="yukiya13" class="button">戻る</button>
				<button type="submit" class="yukiya13" class="button">確定</button>
				</form>
		</main>
	</body>
</html>