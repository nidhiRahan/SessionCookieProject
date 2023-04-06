package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginSer")
public class LoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginSer() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html:charset=UTF-8");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","nidhi@123");
		Statement st=con.createStatement();
		ResultSet res=st.executeQuery("select * from regis where email='"+email+"' and pass='"+pass+"'");
		if(res.next()) {
			Cookie c=new Cookie("abc",email);
			c.setMaxAge(1000);
			response.addCookie(c);
			Cookie c1=new Cookie("abc1",pass);
			c.setMaxAge(1000);
			response.addCookie(c1);
			HttpSession ref=request.getSession();
			ref.setAttribute("uid", email);
			response.sendRedirect("dashboard.jsp");
		}
		else {
			out.print("login failed");
		}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
