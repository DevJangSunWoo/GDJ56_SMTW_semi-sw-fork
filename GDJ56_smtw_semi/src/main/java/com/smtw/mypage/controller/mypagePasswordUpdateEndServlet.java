package com.smtw.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypagePasswordUpdateEndServlet
 */
@WebServlet("/mypage/mypagePasswordUpdateEnd.do")
public class mypagePasswordUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagePasswordUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 3개 값 받아오기 : 아이디, 이전pw, 바꿀pw
		String userId=request.getParameter("id");
		System.out.println("아이디 불러와짐요?"+userId);
		String oriPass=request.getParameter("password");
		String newPass=request.getParameter("password_new");
		
		//1. 현재 비밀번호 맞는지 확인
		Member m=new MypageService().pwdCk(userId,oriPass);//m이 null이면 틀림, 아니면 맞음
		String msg = "", loc="";
		if(m!=null) {
			// 비밀번호 변경 로직진행
			int result=new MypageService().updatePassword(userId,newPass);
			if(result>0) {
				msg="비밀번호 변경 완료"; 
				loc="/logIn/logOut.do";
				String script="opener.location.replace('"+request.getContextPath()+"/logIn/logOut.do');close();";
				//openr =  부모페이지(지금 이 페이지는 새창에 뜨기 때문)
				// 전달되면 opner.location.replace~~("/logout");close();
				request.setAttribute("script",script);
			}else {
				msg="비밀번호 변경 실패";
				loc="<%=request.getContextPath()%>/mypage/mypagePwdCk3.do?id="+userId;
			};
			
		}else {
			//현재 비밀번호가 다릅니다. 다시 시도하세요!
			msg="현재 비밀번호가 일치하지 않습니다. 다시 시도하세요";
			loc="/member/updatePassword.do?userId="+userId;
			
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
