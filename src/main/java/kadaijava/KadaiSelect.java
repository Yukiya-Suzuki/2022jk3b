package kadaijava;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/select")
public class KadaiSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiSelect() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession kadaiSession = request.getSession();
		
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
					request.getRequestDispatcher("insert").forward(request, response);
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
				} else if(proc.equals("fixConfirm")) {
					List<String> detailData = (List<String>)kadaiSession.getAttribute("S_detailData");
					String strStatus = request.getParameter("changed_status");
					String strStatusDate = request.getParameter("changed_statusdate");
					String strName = request.getParameter("changed_name");
					String strFurigana = request.getParameter("changed_furigana");
					String strBirth = request.getParameter("changed_birth");
					String strPost = request.getParameter("changed_post");
					String strAddress = request.getParameter("changed_address");
					String strTel = request.getParameter("changed_tel");
					String strEmail = request.getParameter("changed_email");
					String strPName = request.getParameter("changed_pname");
					String strPFurigana = request.getParameter("changed_pfurigana");
					String strPPost = request.getParameter("changed_ppost");
					String strPAddress = request.getParameter("changed_paddress");
					String strPTel = request.getParameter("changed_ptel");
					String strPEmail = request.getParameter("changed_pemail");
					request.setAttribute("strStatus",strStatus);
					request.setAttribute("strStatusDate",strStatusDate);
					request.setAttribute("strName",strName);
					request.setAttribute("strFurigana",strFurigana);
					request.setAttribute("strBirth",strBirth);
					request.setAttribute("strPost",strPost);
					request.setAttribute("strAddress",strAddress);
					request.setAttribute("strTel",strTel);
					request.setAttribute("strEmail",strEmail);
					request.setAttribute("strPName",strPName);
					request.setAttribute("strPFurigana",strPFurigana);
					request.setAttribute("strPPost",strPPost);
					request.setAttribute("strPAddress",strPAddress);
					request.setAttribute("strPTel",strPTel);
					request.setAttribute("strPEmail",strPEmail);
					request.setAttribute("detailData", detailData);
					request.getRequestDispatcher("fixConfirm").forward(request, response);
				} else if(proc.equals("fixEnter")) {
					request.getRequestDispatcher("fixEnter").forward(request, response);
				} else if(proc.equals("option")) {
					String stroption = request.getParameter("option");
					request.setAttribute("option", stroption);
					request.getRequestDispatcher("displayAll").forward(request, response);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}