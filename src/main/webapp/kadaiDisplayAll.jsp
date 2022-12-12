<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bean.KadaiDataBean"%>
    <%@ page import="java.util.List"%>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title>一覧</title>	
	</head>
	<body>
		<header>
			<h2>データの編集</h2>
		</header>
		<main>
				<table>
					<tr>
						<th>選択</th>
						<th>ID</th>
						<th>氏名</th>
						<th>ふりがな</th>
					</tr>
					<%		//受け取ったデータをテーブルに表示する
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
							<a class="linkStyle" href="displayAll?page=<%= (currentPage - 1) %>">前へ</a>
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
								<a class="linkStyle" href="displayAll?page=<%=i%>"><%=i%></a>
								<%
							}
						}
						//----"へ"の表示ただし、現在ページが最終ページならリンクは設定しない
						if(currentPage < allPage) {
							%>
							<a class="linkStyle" href="displayAll?page=<%=(currentPage + 1)%>"> 次へ</a>
							<%
						} else {
							%>
							<span class="noLinkStyle">次へ</span>
							<%
						}
					}
				%>
				<div class="buttonarea">
					<button type="submit" name="submit" value="delete">削除</button>
					<button type="submit" name="submit" value="insert">新規登録</button>
					<button type="submit" name="submit" value="update">編集</button>
					
				</div>
		</main>
	</body>
</html>