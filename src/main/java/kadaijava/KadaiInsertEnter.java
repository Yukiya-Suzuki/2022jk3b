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

@WebServlet("/insertEnter")
public class KadaiInsertEnter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiInsertEnter() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession kadaiSession = request.getSession();
		KadaiDAO dao = new KadaiDAO();
		List<String> errList = new ArrayList<String>();
		KadaiDataBean newBean = (KadaiDataBean)kadaiSession.getAttribute("newBean");
		Integer id = newBean.getId();
		String strId = id.toString();
		KadaiDataBean bean = dao.getOneRec(strId);
		if(bean == null) {
			int result = dao.insertData(newBean);
			if(result == 0) {
				errList.add("登録に失敗しました。");
				request.setAttribute("errList", errList);
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("insertComplete").forward(request, response);
			}
		} else {
			errList.add("学籍番号が重複しています。");
			errList.add("重複している学籍番号：”" + newBean.getId() + "”");
			request.setAttribute("errList", errList);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
