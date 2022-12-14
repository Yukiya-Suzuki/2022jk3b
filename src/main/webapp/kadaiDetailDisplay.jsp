<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bean.KadaiDataBean"%>
    <%@ page import="java.util.List"%>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			table {
				border-collapse: collapse;
			}
			table, th, td {
				border: solid 1px #000000;
			}
			th, td {
				padding: 5px;
			}
			.formarea {
				margin-left: 30px;
			}
			.buttonarea {
				margin-top: 20px;
			}
			.linkStyle {
				display: inline-block;
				padding: 10px;
				color: #0000ff;
			}
			.noLinkStyle {
				display: line-block;
				padding: 10px;
				color: #99999;
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
				List<KadaiDataBean> detailData = (ArrayList)request.getAttribute("detailData");
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
						if(bean.getMail() != null) {
						 %>
							<td><%= bean.getMail() %></td></tr>
						 <%} else { %>
						 	<td><%="" %></td></tr>
						 <%} %>
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
						if(bean.getParentMail() != null) {
						 %>
						 	<td><%= bean.getParentMail() %></td></tr>
						 <%} else { %>
						 	<td><%="" %></td></tr>
					<%
						}
					}
					%>
				</table>
				<div class="buttonarea">
				<form method="get" action="select">
				<% for(KadaiDataBean bean : detailData) { %>
				<button type="button" onclick="history.back()">戻る</button>
					<input type="hidden" name="id" value="<%= bean.getId() %>">
					<button type="submit" name="submit" value="fix">修正</button>
					<%} %>
				</form>
			</div>
		</main>
	</body>
</html>