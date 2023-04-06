package servletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterSer")
public class RegisterSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisterSer() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		   try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","nidhi@123");
	    Statement st = con.createStatement();
		int x = st.executeUpdate("insert into regis(email,pass,mno) values('"+request.getParameter("email")+"','"+request.getParameter("pass")+"','"+request.getParameter("mno")+"')");
			
		if(x!=0)
		 {
				out.print("data inserted");
			}
		} 
			catch(Exception ex)
			{
				out.print(ex.getMessage().toString());
			}
			
		   //<input type="text" name="fees" placeholder="Enter fees" />
		  // <br><br>
		   //+request.getParameter("fees")+"')");
		}

	}
