package kadaijava;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/select")
public class KadaiSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiSelect() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String proc;
		String strid;
		try {
			proc = request.getParameter("submit");
			strid = request.getParameter("id");
			if(strid == null) {
				//エラー処理
			}
			
			if(proc != null) {
				if(proc.equals("insert")) {
					response.sendRedirect("kadaiInsert.jsp");
					return;
				} else if(proc.equals("detail")) {
					request.setAttribute("strid", strid);
					request.getRequestDispatcher("detail").forward(request, response);
					return;
				} else if(proc.equals("search")) {
					request.getRequestDispatcher("displayall").forward(request, response);
					return;
				} else if(proc.equals("fix")) {
					request.setAttribute("strid", strid);
					request.getRequestDispatcher("fix").forward(request, response);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}