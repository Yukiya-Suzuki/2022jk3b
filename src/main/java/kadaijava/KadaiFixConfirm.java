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

@WebServlet("/fixConfirm")
public class KadaiFixConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KadaiFixConfirm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession kadaiSession = request.getSession();
		List<String> errList = new ArrayList();
		List<String> detailData = (List<String>)kadaiSession.getAttribute("S_detailData");
		KadaiDataBean changedBean = new KadaiDataBean();
		int id = (int)kadaiSession.getAttribute("id");
		String strStatus = (String)request.getAttribute("strStatus");
		String strStatusDate = (String)request.getAttribute("strStatusDate");
		String strName = (String)request.getAttribute("strName");
		String strFurigana = (String)request.getAttribute("strFurigana");
		String strBirth = (String)request.getAttribute("strBirth");
		String strPost = (String)request.getAttribute("strPost");
		String strAddress = (String)request.getAttribute("strAddress");
		String strTel = (String)request.getAttribute("strTel");
		String strEmail = (String)request.getAttribute("strEmail");
		String strPName = (String)request.getAttribute("strPName");
		String strPFurigana = (String)request.getAttribute("strPFurigana");
		String strPPost = (String)request.getAttribute("strPPost");
		String strPAddress = (String)request.getAttribute("strPAddress");
		String strPTel = (String)request.getAttribute("strPTel");
		String strPEmail = (String)request.getAttribute("strPEmail");
		
		//--学籍番号
		changedBean.setId(id);
		
		//--在籍状態
		try {
			int status = Integer.parseInt(strStatus);
			if(status != 0 && status != 1 && status != 2 && status == 3) {
				errList.add("在籍状態は0 , 1 , 2 , 3のどれかで入力してください。");
			} else if(strStatus.isEmpty()) {
				errList.add("在籍状態が未設定になっています。");
			} else {
				changedBean.setStatus(status);
			}
		} catch(Exception e) {
			errList.add("在籍状態は数値で入力してください。");
		}
		
		//--在籍状態確定日
		if(strStatusDate.isEmpty()) {
			errList.add("在籍状態確定日が未設定になっています。");
		} else {
			changedBean.setStatusEnterDate(strStatusDate);
		}
		
		//--氏名
		if(strName.isEmpty()) {
			errList.add("氏名が未設定になっています。");
		} else {
			changedBean.setName(strName);
		}
		
		//--ふりがな
		if(strFurigana.isEmpty()) {
			errList.add("ふりがなが未設定になっています。");
		} else if(strFurigana.matches("^[\\u3040-\\u309F]+$") == false) {
			errList.add("ふりがなは平仮名で入力してください。");
		} else {
			changedBean.setFurigana(strFurigana);
		}
		
		//--生年月日（今日より後はダメもやりたい）
		if(strBirth.isEmpty()) {
			errList.add("生年月日が未設定になっています。");
		} else {
			changedBean.setBirth(strBirth);
		}
		
		//--郵便番号
		try {
			int post = Integer.parseInt(strPost);
			if(strPost.isEmpty()) {
				errList.add("郵便番号が未設定になっています。");
			} else {
				changedBean.setPostNumber(strPost);
			}
		} catch(Exception e) {
			errList.add("郵便番号は7桁の数値で入力してください。");
		}
		
		//--住所
		if(strAddress.isEmpty()) {
			errList.add("住所が未設定になっています。");
		} else {
			changedBean.setAddress(strAddress);
		}
		
		//--電話番号
		String strpattern = "^[0-9][0-9\\-]*$";
		Pattern p = Pattern.compile(strpattern);
		Matcher m = p.matcher(strTel);
		if(strTel.isEmpty()) {
			errList.add("電話番号が未設定になっています。");
		} else if(!m.find()) {
			errList.add("電話番号の型が合っていません。");
		} else {
			changedBean.setTellNumber(strTel);
		}
		
		//--メール
		if(strEmail == null || strEmail == "") {
			strEmail = "";
		}
		changedBean.setMail(strEmail);
		
		//--保護者氏名
		if(strPName.isEmpty()) {
			errList.add("保護者氏名が未設定になっています。");
		} else {
			changedBean.setParentName(strPName);
		}
		
		//--保護者ふりがな
		if(strPFurigana.isEmpty()) {
			errList.add("保護者ふりがなが未設定になっています。");
		} else if(strPFurigana.matches("^[\\u3040-\\u309F]+$") == false) {
			errList.add("保護者ふりがなは平仮名で入力してください。");
		} else {
			changedBean.setParentFurigana(strPFurigana);
		}
		
		//--保護者郵便番号
		try {
			int ppost = Integer.parseInt(strPPost);
			if(strPPost.isEmpty()) {
				errList.add("保護者郵便番号が未設定になっています。");
			} else {
				changedBean.setParentPostNumber(strPPost);
			}
		} catch(Exception e) {
			errList.add("郵便番号は7桁の数値で入力してください。");
		}
		
		//--保護者住所
		if(strPAddress.isEmpty()) {
			errList.add("保護者住所が未設定になっています。");
		} else {
			changedBean.setParentAddress(strPAddress);
		}
		
		//--保護者電話番号
		Matcher pm = p.matcher(strPTel);
		if(strPTel.isEmpty()) {
			errList.add("保護者電話番号が未設定になっています。");
		} else if(!pm.find()) {
			errList.add("保護者電話番号の型が合っていません。");
		} else {
			changedBean.setParentTellNumber(strPTel);
		}
		
		//--保護者メール
		if(strPEmail == null || strPEmail == "") {
			strPEmail = "";
		}
		changedBean.setParentMail(strPEmail);
		
		if(errList.size() != 0) {
			request.setAttribute("FixErrList", errList);
			request.getRequestDispatcher("kadaiFix.jsp").forward(request, response);
		} else {
			request.setAttribute("detailData", detailData);
			kadaiSession.setAttribute("changedBean", changedBean);
			request.getRequestDispatcher("kadaiFixConfirm.jsp").forward(request, response);
		}
	}
}
