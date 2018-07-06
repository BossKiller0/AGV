package com.agv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginSer", urlPatterns = {"/LoginSer"})
public class LoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = new OracalDatabaseConnect().Connect();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			System.out.println((String) getServletContext().getAttribute("JSPName"));
			response.setContentType("text/html");
			out.println("<style>");
			out.println(".sweet-alert fieldset input[type='text'] {");
			out.println("display: none;");
			out.println("}");
			out.println("</style>");
			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://code.jquery.com/jquery-2.1.3.min.js'></script>");
			out.println(
					"  <script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js'></script>");
			out.println(
					"  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css'>");
			out.println(
					"<script src='https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js'></script>");
			out.println("<script type='text/javascript'>");
			out.println("$(document).ready(function() {");
			
			rs = stmt.executeQuery(
					"select * from SIGNUP where upper(USERNAME) =upper('" + request.getParameter("uname") + "') and PSW ='"+request.getParameter("psw")+"'");
			System.out.println("select * from SIGNUP where upper(USERNAME) =upper('" + request.getParameter("uname") + "') and PSW ='"+request.getParameter("psw")+"'");
			if (rs.next()) {
				getServletContext().setAttribute("UN", request.getParameter("uname"));
				getServletContext().setAttribute("PS", request.getParameter("psw"));
				getServletContext().setAttribute("LID", rs.getString("ID"));
				request.getSession(true);
				request.getSession().setAttribute("name", "login");
				request.getSession().setMaxInactiveInterval(10*60);
				out.println("        swal({");
				out.println("            title: 'Login SucessFull',");
				out.println("            type: 'success'");
				out.println("        }, function() {");
				out.println("			location.href = 'SigEnq.jsp';");
				out.println("        });");
				getServletContext().setAttribute("JSPName", "SigEnq.jsp");
			}else {
				getServletContext().removeAttribute("LID");
				out.println("document.getElementById('uname').value='" + request.getParameter("uname") + "'");
				out.println("document.getElementById('psw').value='" + request.getParameter("psw") + "'");
				out.println("            document.getElementById('id01').style.display='block';");
				out.println("            document.getElementById('uname').style.borderColor = 'red';");
				out.println("            document.getElementById('psw').style.borderColor = 'red';");
				out.println("        swal({");
				out.println("            title: 'Login Failed!',");
				out.println("            text: 'Either UserName or Password is Wrong!',");
				out.println("            type: 'error'");
				out.println("        }, function() {");

//				out.println("location.href = '"+ (String) getServletContext().getAttribute("JSPName")+"';");
				out.println("        });");
			}
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher((String) getServletContext().getAttribute("JSPName"));
			rd.include(request, response);

			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


}
