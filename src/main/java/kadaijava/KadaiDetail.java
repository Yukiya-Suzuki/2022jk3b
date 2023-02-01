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


@WebServlet("/detail")
public class KadaiDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiDetail() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String strid;
		int id;
		try {
			strid = (String)request.getAttribute("strid");
			id = Integer.parseInt(strid);
			
			List<KadaiDataBean> list = new ArrayList<KadaiDataBean>();
			KadaiDAO dao = new KadaiDAO();
			list = dao.getDetailData(id);
			
			HttpSession kadaiSession = request.getSession();
			kadaiSession.setAttribute("S_detailData", list);
			request.getRequestDispatcher("kadaiDetailDisplay.jsp").forward(request, response);
		} catch(Exception e) {
			response.sendRedirect("displayAll");
		}
	}
}
