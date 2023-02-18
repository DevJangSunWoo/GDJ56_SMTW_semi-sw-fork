package com.smtw.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.QnaCommentsService;
import com.smtw.review.model.service.ReviewCommentsService;

@WebServlet("/community/DeleteReviewComment.do")
public class DeleteReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteReviewCommentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int qcNo = Integer.parseInt(request.getParameter("qcNo"));
		int result = new ReviewCommentsService().deleteReviewComment(qnaNo, qcNo);
		String msg = "", loc = "";
		if (result > 0) {
			msg = "댓글 삭제 완료!";
			loc = "/community/readReview.do?ReviewNo=" + qnaNo; // 에러 발생 가능 키값을 변경해야할수도
		} else {
			msg = "댓글 삭제 실패..";
			loc = "/community/readReview.do?ReviewNo=" + qnaNo; // 에러 발생 가능 키값을 변경해야할수도
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}