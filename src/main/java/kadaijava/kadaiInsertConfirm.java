package kadaijava;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.KadaiDataBean;
import dao.KadaiDAO;

@WebServlet("/insertConfirm")
public class kadaiInsertConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public kadaiInsertConfirm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession kadaiSession = request.getSession();
		List<String> errList = new ArrayList<String>();
		KadaiDataBean newBean = new KadaiDataBean();
		KadaiDAO dao = new KadaiDAO();
		
		String strId = request.getParameter("id");
		String strStatus = request.getParameter("status");
		String strStatusDate = request.getParameter("statusdate");
		String strName = request.getParameter("name");
		String strFurigana = request.getParameter("furigana");
		String strBirth = request.getParameter("birth");
		String strPost = request.getParameter("post");
		String strAddress = request.getParameter("address");
		String strTel = request.getParameter("tel");
		String strEmail = request.getParameter("email");
		String strPName = request.getParameter("pname");
		String strPFurigana = request.getParameter("pfurigana");
		String strPPost = request.getParameter("ppost");
		String strPAddress = request.getParameter("paddress");
		String strPTel = request.getParameter("ptel");
		String strPEmail = request.getParameter("pemail");
		
		//--学籍番号
		KadaiDataBean bean = dao.getOneRec(strId);
		int id = -1;
		if(strId == null || strId == "") {
			errList.add("学籍番号が入力されていません。");
		} else {
			try {
				id = Integer.parseInt(strId);
			} catch(Exception e ) {
				errList.add("学籍番号は数値で入力してください。");
				newBean.setId(id);
			}
			if(bean != null) {
				errList.add("学籍番号が重複しています。");
				newBean.setId(id);
			} else {
				newBean.setId(id);
			}
		}
		
		//--在籍状態
		try {
			int status = Integer.parseInt(strStatus);
			if(status != 0 && status != 1 && status != 2 && status == 3) {
				errList.add("在籍状態は0 , 1 , 2 , 3のどれかで入力してください。");
				newBean.setStatus(status);
			} else if(strStatus.isEmpty()) {
				errList.add("在籍状態が未設定になっています。");
			} else {
				newBean.setStatus(status);
			}
		} catch(Exception e) {
			errList.add("在籍状態は数値で入力してください。");
			newBean.setStatus(0);
		}
				
		//--在籍状態確定日
		if(strStatusDate.isEmpty()) {
			errList.add("在籍状態確定日が入力されていません。");
		} else {
			newBean.setStatusEnterDate(strStatusDate);
		}
				
		//--氏名
		if(strName.isEmpty()) {
			errList.add("氏名が入力されていません。");
		} else {
			newBean.setName(strName);
		}
				
		//--ふりがな
		if(strFurigana.isEmpty()) {
			errList.add("ふりがなが入力されていません。");
		} else if(strFurigana.matches("^[\\u3040-\\u309F]+$") == false) {
			errList.add("ふりがなは平仮名で入力してください。");
			newBean.setFurigana(strPFurigana);
		} else {
			newBean.setFurigana(strFurigana);
		}
				
		//--生年月日（今日より後はダメもやりたい）
		if(strBirth.isEmpty()) {
			errList.add("生年月日が入力されていません。");
		} else {
			newBean.setBirth(strBirth);
		}
				
		//--郵便番号
		try {
			int post = Integer.parseInt(strPost);
			if(strPost.isEmpty()) {
				errList.add("郵便番号が入力されていません。");
			} else {
				newBean.setPostNumber(strPost);
			}
		} catch(Exception e) {
			errList.add("郵便番号は7桁の数値で入力してください。");
			newBean.setPostNumber(strPost);
		}
				
		//--住所
		if(strAddress.isEmpty()) {
			errList.add("住所が入力されていません。");
		} else {
			newBean.setAddress(strAddress);
		}
				
		//--電話番号
		String strpattern = "^[0-9][0-9\\-]*$";
		Pattern p = Pattern.compile(strpattern);
		Matcher m = p.matcher(strTel);
		if(strTel.isEmpty()) {
			errList.add("電話番号が入力されていません。");
		} else if(!m.find()) {
			errList.add("電話番号の型が合っていません。");
			newBean.setTellNumber(strTel);
		} else {
			newBean.setTellNumber(strTel);
		}
				
		//--メール
		if(strEmail == null || strEmail == "") {
			strEmail = "";
		} else {
			newBean.setMail(strEmail);
		}
		
		//--保護者氏名
		if(strPName.isEmpty()) {
			errList.add("保護者氏名が入力されていません。");
		} else {
			newBean.setParentName(strPName);
		}
				
		//--保護者ふりがな
		if(strPFurigana.isEmpty()) {
			errList.add("保護者ふりがなが入力されていません。");
		} else if(strPFurigana.matches("^[\\u3040-\\u309F]+$") == false) {
			errList.add("保護者ふりがなは平仮名で入力してください。");
			newBean.setParentFurigana(strPFurigana);
		} else {
			newBean.setParentFurigana(strPFurigana);
		}
				
		//--保護者郵便番号
		try {
			int ppost = Integer.parseInt(strPPost);
			if(strPPost.isEmpty()) {
				errList.add("保護者郵便番号が入力されていません。");
			} else {
				newBean.setParentPostNumber(strPPost);
			}
		} catch(Exception e) {
			errList.add("郵便番号は7桁の数値で入力してください。");
			newBean.setParentPostNumber(strPost);
		}
				
		//--保護者住所
		if(strPAddress.isEmpty()) {
			errList.add("保護者住所が入力されていません。");
		} else {
			newBean.setParentAddress(strPAddress);
		}
				
		//--保護者電話番号
		Matcher pm = p.matcher(strPTel);
		if(strPTel.isEmpty()) {
			errList.add("保護者電話番号が入力されていません。");
		} else if(!pm.find()) {
			errList.add("保護者電話番号の型が合っていません。");
			newBean.setParentTellNumber(strPTel);
		} else {
			newBean.setParentTellNumber(strPTel);
		}
				
		//--保護者メール
		if(strPEmail == null || strPEmail == "") {
			strPEmail = "";
		} else {
			newBean.setParentMail(strPEmail);
		}
				
		if(errList.size() != 0) {
			kadaiSession.setAttribute("insertErrList", errList);
			kadaiSession.setAttribute("newBean", newBean);
			request.getRequestDispatcher("kadaiInsert.jsp").forward(request, response);
		} else {
			kadaiSession.setAttribute("newBean",newBean);
			request.getRequestDispatcher("kadaiInsertConfirm.jsp").forward(request, response);
		}
	}
}
