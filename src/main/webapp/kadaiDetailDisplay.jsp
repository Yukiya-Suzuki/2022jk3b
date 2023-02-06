<%@page import="javax.sound.midi.SysexMessage"%>
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
		<style type="text/css">
			table {
				margin-top: 30px;
				border-collapse: separate;
				border-spacing: 3px;
				width: 40%;
			}
			table th, table td {
				border-radius: 5px;
				text-align: center padding: 5px;
			}
			table th {
				background-color: #c79852;
				color: white;
				border: solid 1px #927141;
				font-size: 25px;
			}
			table td {
				background-color: #e4d4bc;
				border: solid 1px #af9d85;
				font-size: 25px;
			}
			.font_text {
				font-weight: bold;
				font-size: 40px;
			}
			.yukiya10{
   			 	width:80px;
				height:50px;
			}
			.yukiya11{
 				width:80px;
				height:50px;
			}
			h2 {
				color: white;
				border: 3px dashed #927141;
				background-color: #c79852;
				box-shadow: 0 0 3px 3px #e4d4bc;
				padding: 0.5em 0.8em;
				text-align: center;
				font-size:30px
			}
		</style>
		<title>詳細一覧</title>
	</head>
	<body>
		<header>
			<h2>詳細表示</h2>
		</header>
		<main>
				<%
				HttpSession kadaiSession = request.getSession();
				List<KadaiDataBean> detailData = (ArrayList)kadaiSession.getAttribute("S_detailData");
				for(KadaiDataBean bean : detailData) {
				%>
				<table>
						<tr><th>学籍番号</th>
							<td><%= bean.getId() %></td></tr>
						<tr><th>在籍状態</th>
							<td><%= bean.getStatus() %></td></tr>
						<tr><th>在籍状態確定日</th>
							<td><%= bean.getStatusEnterDate() %></td></tr>
						<tr><th>学生氏名</th>
							<td><%= bean.getName() %></td></tr>
						<tr><th>ふりがな</th>
							<td><%= bean.getFurigana() %></td></tr>
						<tr><th>生年月日</th>
							<td><%= bean.getBirth() %></td></tr>
						<tr><th>本人郵便番号</th>
							<td><%= bean.getPostNumber() %></td></tr>
						<tr><th>本人住所</th>
							<td><%= bean.getAddress() %></td></tr>
						<tr><th>本人電話番号</th>
							<td><%= bean.getTellNumber() %></td></tr>
						<tr><th>本人メールアドレス</th>
						<%
						String Mail;
						if(bean.getMail() != null) {
							Mail = bean.getMail(); 
						} else {
							Mail = "";
						}
						%>
							<td><%=Mail %></td></tr>
						<tr><th>保護者氏名</th>
							<td><%= bean.getParentName() %></td></tr>
						<tr><th>保護者ふりがな</th>
							<td><%= bean.getParentFurigana() %></td></tr>
						<tr><th>保護者郵便番号</th>
							<td><%= bean.getParentPostNumber() %></td></tr>
						<tr><th>保護者住所</th>
							<td><%= bean.getParentAddress() %></td></tr>
						<tr><th>保護者電話番号</th>
							<td><%= bean.getParentTellNumber() %></td></tr>
						<tr><th>保護者メールアドレス</th>
						<%
						String PMail;
						if(bean.getParentMail() != null) {
							PMail = bean.getParentMail(); 
						} else {
							PMail = "";
						}
						 %>
						 	<td><%= PMail %></td></tr>
						 <%
						}
					%>
				</table>
				<div class="buttonarea">
				<form method="get" action="select">
				<% for(KadaiDataBean bean : detailData) { %>
				<button type="button" class="yukiya10" class="button"onclick="location.href='./displayAll'">戻る</button>
					<input type="hidden" class="yukiya10" class="button" name="id" value="<%= bean.getId() %>">
					<button type="submit" class="yukiya10" class="button" name="submit" value="fix">修正</button>
					<%} %>
				</form>
			</div>
		</main>
	</body>
</html>