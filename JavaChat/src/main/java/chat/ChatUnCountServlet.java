package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatUnCountServler
 */
@WebServlet("/ChatUnCountServlet")
public class ChatUnCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("닫기실행됨");
		
		String roomID = URLDecoder.decode(request.getParameter("roomID"), "UTF-8");
		try {
			response.getWriter().write(new CountDao().uncount(roomID));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
