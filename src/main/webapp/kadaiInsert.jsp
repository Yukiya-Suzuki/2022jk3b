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
		<title>学生を登録</title>
		<style type="text/css">
			.red {
				color: red;
			}
			.blue {
				color: blue;
			}
		</style>
	</head>
	<body>
		<header>
			<h2>登録する学生の情報を入力してください</h2>
			<p class="blue">郵便番号は７桁で入力してください<br>
										電話番号は「-」を含めて入力してください</p>
		</header>
		<main>
			<%
			HttpSession kadaiSession = request.getSession();
			List<String> errList = (List<String>)kadaiSession.getAttribute("insertErrList");
			KadaiDataBean newBean = (KadaiDataBean)kadaiSession.getAttribute("newBean");
			if(errList != null) {
				for(String error : errList) {
				%>
				<p class="red"><%= error %></p>
				<%
				}
			}
			%>
			
			<!-- 中身を受け取る操作-->
			<%
			String statusEnterDate = "";
			String name = "";
			String furigana = "";
			String birth = "";
			String post = "";
			String address = "";
			String tel = "";
			String mail = "";
			String pname = "";
			String pfurigana = "";
			String ppost = "";
			String paddress = "";
			String ptel = "";
			String pmail = "";
			
			if(newBean != null) {
				if(newBean.getStatusEnterDate() != null || newBean.getStatusEnterDate() != "")  {
					statusEnterDate = newBean.getStatusEnterDate();
				}
				if(newBean.getName() != null || newBean.getName() != "") {
					name = newBean.getName();
				}
				if(newBean.getFurigana() != null || newBean.getFurigana() != "") {
					furigana = newBean.getFurigana();
				}
				if(newBean.getBirth() != null || newBean.getBirth() != "") {
					birth = newBean.getBirth();
				}
				if(newBean.getPostNumber() != null || newBean.getPostNumber() != "") {
					post = newBean.getPostNumber();
				}
				if(newBean.getAddress() != null || newBean.getAddress() != "") {
					address = newBean.getAddress();
				}
				if(newBean.getTellNumber() != null || newBean.getTellNumber() != "") {
					tel = newBean.getTellNumber();
				}
				if(newBean.getMail() != null || newBean.getMail() != "") {
					mail = newBean.getMail();
				}
				if(newBean.getParentName() != null || newBean.getParentName() != "") {
					pname = newBean.getParentName();
				}
				if(newBean.getParentFurigana() != null || newBean.getParentFurigana() != "") {
					pfurigana = newBean.getParentFurigana();
				}
				if(newBean.getParentPostNumber() != null || newBean.getParentPostNumber() != "") {
					ppost = newBean.getParentPostNumber();
				}
				if(newBean.getParentAddress() != null || newBean.getParentAddress() != "") {
					paddress = newBean.getParentAddress();
				}
				if(newBean.getParentTellNumber() != null || newBean.getParentTellNumber() != "") {
					ptel = newBean.getParentTellNumber();
				}
				if(newBean.getParentMail() != null || newBean.getParentMail() != "") {
					pmail = newBean.getParentMail();
				}
			}
			%>
			<form class="formarea" method="get" action="insertConfirm">
			<table>
				<tr><th>学籍番号</th>
					<td><input type="text" name="id" maxlength="5" required></td></tr>
				<tr><th>在籍状態</th>
					<td><input type="text" name="status" maxlength="1" required></td></tr>
				<tr><th>在籍状態確定日</th>
					<td><input type="date" name="statusdate"  value="<%= statusEnterDate %>" required></td></tr>
				<tr><th>学生氏名</th>
					<td><input type="text" name="name" value="<%= name %>" required></td></tr>
				<tr><th>ふりがな</th>
					<td><input type="text" name="furigana" value="<%= furigana %>"required></td></tr>
				<tr><th>生年月日</th>
					<td><input type="date" name="birth" value="<%= birth %>" required></td></tr>
				<tr><th>本人郵便番号</th>
					<td><input type="text" name="post" value="<%= post %>" maxlength="7" required></td></tr>
				<tr><th>本人住所</th>
					<td><input type="text" name="address" value="<%= address %>" required></td></tr>
				<tr><th>本人電話番号</th>
					<td><input type="tel" name="tel" value="<%= tel %>" required></td></tr>
				<tr><th>本人メールアドレス</th>
					<td><input type="email" name="email" value="<%= mail %>" ></td></tr>
				<tr><th>保護者氏名</th>
					<td><input type="text" name="pname" value="<%= pname %>" required></td></tr>
				<tr><th>保護者ふりがな</th>
					<td><input type="text" name="pfurigana" value="<%= pfurigana %>" required></td></tr>
				<tr><th>保護者郵便番号</th>
					<td><input type="text" name="ppost" value="<%= ppost%>" maxlength="7" required></td></tr>
				<tr><th>保護者住所</th>
					<td><input type="text" name="paddress" value="<%= paddress %>" required></td></tr>
				<tr><th>保護者電話番号</th>
					<td><input type="tel" name="ptel" value="<%= ptel %>" required></td></tr>
				<tr><th>保護者メールアドレス</th>
					<td><input type="email" name="pemail" value="<%= pmail %>" ></td></tr>
			</table>
			<div class="buttonarea">
			<a href="./displayAll">戻る</a>
			<a onclick="window.location.reload(true)">リセット</a>
			<button type="submit">追加</button>
			</div>
			</form>
		</main>
	</body>
</html>