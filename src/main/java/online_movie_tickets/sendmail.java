package online_movie_tickets;


import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/sendmail")
public class sendmail extends HttpServlet {
		 protected void doPost(HttpServletRequest request,
		            HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("em");
		System.out.println("in");
		forgot.sendmail(email);
		System.out.println("out");
		 }


}