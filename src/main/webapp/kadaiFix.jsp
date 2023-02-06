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
		<title>編集</title>
	</head>
	<body>
		<header>
			<h2>学生情報を編集</h2>
		</header>
		<main>
		<form class="formarea" method="get" action="select">
				<%
				HttpSession kadaiSession = request.getSession();
				List<String> errList = (List<String>)request.getAttribute("fixErrList");
				List<KadaiDataBean> detailData = (ArrayList)kadaiSession.getAttribute("S_detailData");
				for(KadaiDataBean bean : detailData) {
					int id = bean.getId();
					kadaiSession.setAttribute("id", id);
				%>
				<%
				if(errList != null && errList.size() != 0) {
					for(String err : errList) {
				%>
				<p><%= err %><br></p>
				<%				
					}
				}
				%>
				<table>
						<tr><th>学籍番号</th>
							<td><%= bean.getId() %></td></tr>
						<tr><th>在籍状態</th>
							<td><input type="text" name="changed_status" value="<%= bean.getStatus() %>" maxlength="1" required></td></tr>
						<tr><th>在籍状態確定日</th>
							<td><input type="date" name="changed_statusdate" value="<%= bean.getStatusEnterDate() %>" required></td></tr>
						<tr><th>学生氏名</th>
							<td><input type="text" name="changed_name" value="<%= bean.getName() %>" required></td></tr>
						<tr><th>ふりがな</th>
							<td><input type="text" name="changed_furigana" value="<%= bean.getFurigana() %>" required></td></tr>
						<tr><th>生年月日</th>
							<td><input type="date" name="changed_birth" value="<%= bean.getBirth() %>" required></td></tr>
						<tr><th>本人郵便番号</th>
							<td><input type="text" name="changed_post" value="<%= bean.getPostNumber() %>"maxlength="7" required></td></tr>
						<tr><th>本人住所</th>
							<td><input type="text" name="changed_address" value="<%= bean.getAddress() %>" required></td></tr>
						<tr><th>本人電話番号</th>
							<td><input type="tel" name="changed_tel" value="<%= bean.getTellNumber() %>" required></td></tr>
						<tr><th>本人メールアドレス</th>
						<%
						String Mail;
						if(bean.getMail() != null) {
							Mail = bean.getMail(); 
						} else {
							Mail = "";
						}
						%>
							<td><input type="email" name="changed_email" value="<%= Mail %>"></td></tr>
						<tr><th>保護者氏名</th>
							<td><input type="text" name="changed_pname" value="<%= bean.getParentName() %>" required></td></tr>
						<tr><th>保護者ふりがな</th>
							<td><input type="text" name="changed_pfurigana" value="<%= bean.getParentFurigana() %>" required></td></tr>
						<tr><th>保護者郵便番号</th>
							<td><input type="text" name="changed_ppost" value="<%= bean.getParentPostNumber() %>" maxlength="7" required></td></tr>
						<tr><th>保護者住所</th>
							<td><input type="text" name="changed_paddress" value="<%= bean.getParentAddress() %>" required></td></tr>
						<tr><th>保護者電話番号</th>
							<td><input type="tel" name="changed_ptel" value="<%= bean.getParentTellNumber() %>" required></td></tr>
						<tr><th>保護者メールアドレス</th>
						<%
						String PMail;
						if(bean.getParentMail() != null) {
							PMail = bean.getParentMail(); 
						} else {
							PMail = "";
						}
						%>
						 	<td><input type="email" name="changed_pemail" value="<%= PMail %>"></td></tr>
				</table>
				<div class="buttonarea">
					<button type="button" onclick="history.back()" class="yukiya12" class="button">戻る</button>
					<button type="button" onclick="window.location.reload(true)" class="yukiya13" class="button">リセット</button>
					<button type="submit" class="yukiya14" class="button" name="submit" value="fixConfirm">修正</button>
				</div>
				<% } %>
				</form>
		</main>
	</body>
</html>