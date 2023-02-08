package kadaijava;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.KadaiDataBean;
import dao.KadaiDAO;

@WebServlet("/displayAll")
public class KadaiDisplayAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiDisplayAll() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession kadaiSession = request.getSession();
		String stroption = (String)request.getAttribute("option");
		if(stroption != null) {
			kadaiSession.setAttribute("option", stroption);
			kadaiSession.setAttribute("keyword", null);
		} else {
			stroption = (String)kadaiSession.getAttribute("option");
		}
		
		String keyword;
		List<String> errList = new ArrayList<String>();
		try {
			try {
				keyword = (String) kadaiSession.getAttribute("keyword");
			} catch(Exception e) {
				keyword = "";
			}
			if(keyword == null) {
				keyword = "";
			}
			int page = 1;
				try {
					String strPage = (String)request.getParameter("page");
					page = Integer.parseInt(strPage);
				} catch (Exception e) {
					page = 1;
				}
		
		
			List<KadaiDataBean> list = new ArrayList<KadaiDataBean>();
			KadaiDAO dao = new KadaiDAO();
			if(stroption != null) {
				if(Integer.parseInt(stroption) == 5) {
					list = dao.getAllStudent(page);
				} else if(stroption != null) {
					int option = Integer.parseInt(stroption);
					list = dao.getSelectStudent(option, page);
				}
			} else {
				list = dao.getAllData(page,keyword);
			}
		
			kadaiSession.setAttribute("data", list);
			kadaiSession.setAttribute("allpage", dao.getListPage(list));
			kadaiSession.setAttribute("page", page);
			request.getRequestDispatcher("kadaiDisplay.jsp").forward(request, response);
		} catch(Exception e) {
			errList.add("データベースへの接続に失敗しました。");
			e.printStackTrace();
			request.setAttribute("errList",errList);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
