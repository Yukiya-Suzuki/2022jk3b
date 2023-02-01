package kadaijava;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/fixComplete")
public class KadaiFixComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiFixComplete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("kadaiFixComplete.jsp").forward(request, response);
	}

}
