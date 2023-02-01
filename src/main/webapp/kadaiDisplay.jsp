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
		<title>学生表</title>
	</head>
	<body>
		<header>
			<h2>学生表</h2>
		</header>
		<main>
			<form class="formarea" method="get" action="search">
				<input type="text" name="keyword">
				<button type="submit" name="submit" value="search">検索</button>
			</form>
			
			<form class="option" method="get" action="select">
				<input type="radio" name="option" value="5">全学生
				<input type="radio" name="option" value="0">在学
				<input type="radio" name="option" value="1">休学
				<input type="radio" name="option" value="2">退学
				<input type="radio" name="option" value="3">除籍
				<button type="submit" name="submit" value="option">絞り込み</button>
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
						int cnt;
						List<KadaiDataBean> data = (ArrayList)request.getAttribute("data");
						for(KadaiDataBean bean : data) {
							cnt = bean.getId();
					%>
					<tr>
						<td><input type="radio" name="id" value="<%= bean.getId() %>" id="radio<%= cnt %>"></td>
						<td><label for="radio<%= cnt %>"><%= bean.getId() %></label></td>
						<td><label for="radio<%= cnt %>"><%= bean.getName() %></label></td>
						<td><label for="radio<%= cnt %>"><%= bean.getFurigana() %></label></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					String keyword = (String)request.getAttribute("keyword");
					if(keyword == null ) {
						keyword = "";
					}
					int currentPage = (int)request.getAttribute("page");
					int allPage = (Integer) request.getAttribute("allpage");
					
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
					<button type="submit" name="submit" value="detail">詳細</button>
					<button type="submit" name="submit" value="insert">新規登録</button>
					
				</div>
			</form>
		</main>
		<script>
		</script>
	</body>
</html>