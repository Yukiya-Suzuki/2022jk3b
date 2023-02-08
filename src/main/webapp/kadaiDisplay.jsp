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
	border-collapse: separate;
	border-spacing: 3px;
	width: 50%;
}
table th, table td {
	border-radius: 5px;
	text-align: center;
	padding: 5px;
}
table th {
	background-color: #c79852;
	color: white;
	border: solid 1px #927141;
}
table td {
	background-color: #e4d4bc;
	border: solid 1px #af9d85;
}
.font_text {
	font-weight: bold;
	font-family: serif;
	font-size: 25px;
}
.formarea {
	margin-top: 10px;
}
.yuikya2 {
	width: 400px;
	height:60px;
	font-size:30px;
	
	}
.yukiya5{
	width:80px;
	height:50px;
	}
.yukiya6{
	width:80px;
	height:50px;
}
.yukiya7{
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
	font-size: 30px;
}

		</style>
		<title>学生表</title>
	</head>
	<body>
		<header>
			<h2>学生表</h2>
		</header>
		<main>
			<form class="formarea" method="get" action="search">
				<input type="text" class="yuikya2" name="keyword">
				<button type="submit"  class="yukiya5" class="button" name="submit" value="search">検索</button>
			</form>
			
			<form class="option" method="get" action="select">
				<input type="radio" name="option" value="5">全学生
				<input type="radio" name="option" value="0">在学
				<input type="radio" name="option" value="1">休学
				<input type="radio" name="option" value="2">退学
				<input type="radio" name="option" value="3">除籍
				<button type="submit" class="yukiya6" class="button" name="submit" value="option">絞り込み</button>
			</form>
			
			
			<form class="formarea" method="get" action="select">
				<table>
					<tr>
						<th>選択</th>
						<th>学籍番号</th>
						<th>学生氏名</th>
						<th>ふりがな</th>
					</tr>
					<%
						HttpSession kadaiSession = request.getSession();
						int cnt;
						List<KadaiDataBean> data = (ArrayList)kadaiSession.getAttribute("data");
						for(KadaiDataBean bean : data) {
							cnt = bean.getId();
					%>
					<tr>
						<td class="font_text"><input type="radio" name="id" value="<%= bean.getId() %>" id="radio<%= cnt %>"></td>
						<td class="font_text"><label for="radio<%= cnt %>"><%= bean.getId() %></label></td>
						<td class="font_text"><label for="radio<%= cnt %>"><%= bean.getName() %></label></td>
						<td class="font_text"><label for="radio<%= cnt %>"><%= bean.getFurigana() %></label></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					String keyword = (String)kadaiSession.getAttribute("keyword");
					if(keyword == null ) {
						keyword = "";
					}
					int currentPage = (int)kadaiSession.getAttribute("page");
					int allPage = (Integer)kadaiSession.getAttribute("allpage");
					
					if(allPage> 0) {
						//---現在のページの２ページ前を表示の最初とするが、なければ１を最初とする。
						int startPage = currentPage -2;
						if (startPage < 1) {
							startPage = 1;
						}
						//---開始ページの４ページ後を表示の最後とするが、無ければ最終ページとする。
						int endPage = startPage + 4;
						if (endPage > allPage) {
							endPage = allPage;
						}
						//---必ず５ページ分になるように、表示数の調整
						while(startPage > 1 && endPage -startPage < 4) {
							startPage--;
						}
						//---"前へ"を表示ただし、現在ページが１ならリンクは設定しない
						if(currentPage > 1) {
							%>
							<a class="linkStyle" href="displayAll?page=<%= (currentPage - 1) %>&keyword=<%=keyword%>">前へ</a>
							<%	
						} else {
							%>
							<span class="noLinkStyle">前へ</span>	
							<%
						}
						//---ページ表示現在ページの場合はリンクは設定しない
						for(int i = startPage; i <= endPage; i++) {
							if (i == currentPage) {
								%>
								<span class="noLinkStyle"><%=i%></span>
								<%
							} else {
								%>
								<a class="linkStyle" href="displayAll?page=<%=i%>&keyword<%=keyword%>"><%=i%></a>
								<%
							}
						}
						//----"へ"の表示ただし、現在ページが最終ページならリンクは設定しない
						if(currentPage < allPage) {
							%>
							<a class="linkStyle" href="displayAll?page=<%=(currentPage + 1)%>&keyword=<%=keyword %>>"> 次へ</a>
							<%
						} else {
							%>
							<span class="noLinkStyle">次へ</span>
							<%
						}
					}
				%>
				<div class="buttonarea">
					<button type="submit" class="yukiya6" class="button" name="submit" value="detail">詳細</button>
					<button type="submit" class="yukiya7" class="button" name="submit" value="insert">新規登録</button>
					
				</div>
			</form>
		</main>
		<script>
		</script>
	</body>
</html>