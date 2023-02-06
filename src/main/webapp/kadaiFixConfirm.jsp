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
				font-size: 20px;
			}
			th, td {
				padding: 5px;
				font-size: 20px;
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
	/* 円 */
		.arrow_right2 {
			margin-top: 150px;
			font-size: 100px;
			position: relative;
			width: 1.2em;
			height: 1.4em;
			border-radius: 100%;
		}
	/* 長方形 */
		.arrow_right2::before {
			position: absolute;
			top: 0.5em;
			right: 0.6em;
			width: 0.5em;
			height: 0.4em;
			content: "";
			background-color: #c79852;
		}
	/* 三角 */
		.arrow_right2::after {
			position: absolute;
			top: 0.3em;
			right: 0.3em;
			width: 0;
			height: 0;
			content: "";
			border-left: 0.4em solid #c79852;
			border-top: 0.4em solid transparent;
			border-bottom: 0.4em solid transparent;
		}
		.yukiya {
			display: flex;
			margin-top:30px;
	}
		.yukiya15{
 			width:80px;
			height:50px;
		}
		.yukiya16{
 			width:80px;
			height:50px;
		}
		.yukiya th{
			background-color: #c79852;
			color: white;
			border: solid 1px #927141;
		}
		.yukiya td{
			background-color: #e4d4bc;
			color: black;
			border: solid 1px #af9d85;
		}
		h2 {
			color: white;
			border: 3px dashed #927141;
			background-color: #c79852;
			box-shadow: 0 0 3px 3px #e4d4bc;
			padding: 0.3em 0.5em;
			text-align: center
		}
		</style>
		<title>変更の確定</title>
	</head>
	<body>
		<header>
			<h2>この内容の変更でよろしいですか？</h2>
		</header>
		<main>
		<div class="yukiya">
		<div>
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
				</div>
				<div class="arrow_right2"></div>
				<%
				KadaiDataBean changedData = (KadaiDataBean)kadaiSession.getAttribute("changedBean");
				%>
				<div>
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
				</div>
				</div>
				<div class="buttonarea">
				<form method="get" action="select">
				<button type="button" onclick="history.back()" class="yukiya15" class="button">戻る</button>
				<button type="submit" class="yukiya16" class="button"name="submit" value="fixEnter">確定</button>
				</form>
			</div>
		</main>
	</body>
</html>