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
		<title>変更の確定</title>
	</head>
	<body>
		<header>
			<h2>この内容の変更でよろしいですか？</h2>
		</header>
		<main>
				<%
				HttpSession kadaiSession = request.getSession();
				List<KadaiDataBean> detailData = (ArrayList)kadaiSession.getAttribute("S_detailData");
				for(KadaiDataBean bean : detailData) {
				%>
				<table class="x">
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
				
				<%
				KadaiDataBean changedData = (KadaiDataBean)kadaiSession.getAttribute("changedBean");
				%>
				<table class="y">
						<tr><th>学籍番号</th>
							<td><%= changedData.getId() %></td></tr>
						<tr><th>在籍状態</th>
							<td><%= changedData.getStatus() %></td></tr>
						<tr><th>在籍状態確定日</th>
							<td><%= changedData.getStatusEnterDate() %></td></tr>
						<tr><th>学生氏名</th>
							<td><%= changedData.getName() %></td></tr>
						<tr><th>ふりがな</th>
							<td><%= changedData.getFurigana() %></td></tr>
						<tr><th>生年月日</th>
							<td><%= changedData.getBirth() %></td></tr>
						<tr><th>本人郵便番号</th>
							<td><%= changedData.getPostNumber() %></td></tr>
						<tr><th>本人住所</th>
							<td><%= changedData.getAddress() %></td></tr>
						<tr><th>本人電話番号</th>
							<td><%= changedData.getTellNumber() %></td></tr>
						<tr><th>本人メールアドレス</th>
						<%
						String Mail;
						if(changedData.getMail() != null) {
							Mail = changedData.getMail(); 
						} else {
							Mail = "";
						}
						%>
							<td><%=Mail %></td></tr>
						<tr><th>保護者氏名</th>
							<td><%= changedData.getParentName() %></td></tr>
						<tr><th>保護者ふりがな</th>
							<td><%= changedData.getParentFurigana() %></td></tr>
						<tr><th>保護者郵便番号</th>
							<td><%= changedData.getParentPostNumber() %></td></tr>
						<tr><th>保護者住所</th>
							<td><%= changedData.getParentAddress() %></td></tr>
						<tr><th>保護者電話番号</th>
							<td><%= changedData.getParentTellNumber() %></td></tr>
						<tr><th>保護者メールアドレス</th>
						<%
						String PMail;
						if(changedData.getParentMail() != null) {
							PMail = changedData.getParentMail(); 
						} else {
							PMail = "";
						}
						 %>
						 	<td><%= PMail %></td></tr>
				</table>
				<div class="buttonarea">
				<form method="get" action="select">
				<button type="button" onclick="history.back()">戻る</button>
				<button type="submit" name="submit" value="fixEnter">確定</button>
				</form>
			</div>
		</main>
	</body>
</html>