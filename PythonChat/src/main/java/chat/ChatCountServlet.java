package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatCountServlet")
public class ChatCountServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String roomID = URLDecoder.decode(request.getParameter("roomID"), "UTF-8");
		try {
			response.getWriter().write(new CountDao().count(roomID));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
