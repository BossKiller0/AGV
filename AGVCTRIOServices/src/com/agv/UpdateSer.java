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

@WebServlet("/UpdateSer")
public class UpdateSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = new OracalDatabaseConnect().Connect();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			System.out.println("Update SIGNUP set Email ='" + request.getParameter("email") + "', USERNAME ='"
					+ request.getParameter("User") + "', PSW='" + request.getParameter("password") + "', Mobile=  '"
					+ request.getParameter("Phone") + "',Gender ='" + request.getParameter("Gender") + "',Address='"
					+ request.getParameter("Addr") + "'");
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
			out.println("document.getElementById('email').value='" + request.getParameter("email") + "'");
			out.println("document.getElementById('User').value='" + request.getParameter("User") + "'");
			out.println("document.getElementById('Phone').value='" + request.getParameter("Phone") + "'");
			out.println("document.getElementById('Gender').value='" + request.getParameter("Gender") + "'");
			out.println("document.getElementById('Addr').value='" + request.getParameter("Addr") + "'");
			StringBuffer Errmsg = new StringBuffer();
			rs = stmt.executeQuery(
					"select * from SIGNUP where upper(Email) =upper('" + request.getParameter("email") + "') and id <>'" + (String) getServletContext().getAttribute("LID") + "'");
			if (rs.next()) {
				out.println("            document.getElementById('email').style.borderColor = 'red';");
//				out.println("            document.getElementById('002').style.display='block';");
				Errmsg.append("Email ID Already Exists!\\n");
				// Errmsg.append(System.getProperty("line.separator"));
			}
			rs = null;

			rs = stmt.executeQuery(
					"select * from SIGNUP where upper(USERNAME) =upper('" + request.getParameter("User") + "') and id <>'" + (String) getServletContext().getAttribute("LID") + "'");
			if (rs.next()) {
				out.println("            document.getElementById('User').style.borderColor = 'red';");
//				out.println("            document.getElementById('002').style.display='block';");
				Errmsg.append("User Name Already Taken!\\n");
				// Errmsg.append(System.getProperty("line.separator"));
			}

			rs = stmt.executeQuery("select * from SIGNUP where Mobile ='" + request.getParameter("Phone") + "'  and id <>'" + (String) getServletContext().getAttribute("LID") + "'");
			if (rs.next()) {
				out.println("            document.getElementById('Phone').style.borderColor = 'red';");
//				out.println("            document.getElementById('002').style.display='block';");
				Errmsg.append("Phone No Already Exists!\\n");
				// Errmsg.append(System.getProperty("line.separator"));;
			}

			rs = stmt.executeQuery(
					"select * from SIGNUP where (Email ='" + request.getParameter("email") + "' or USERNAME ='"
							+ request.getParameter("User") + "' or Mobile ='" + request.getParameter("Phone")
							+ "') and id <>'" + (String) getServletContext().getAttribute("LID") + "'");
			System.out.println("select * from SIGNUP where (Email ='" + request.getParameter("email") + "' or USERNAME ='"
					+ request.getParameter("User") + "' or Mobile ='" + request.getParameter("Phone")
					+ "') and id <>'" + (String) getServletContext().getAttribute("LID") + "'");
			if (!rs.next()) {
				stmt.executeUpdate("Update SIGNUP set Email ='" + request.getParameter("email") + "', USERNAME ='"
						+ request.getParameter("User") + "', PSW='" + request.getParameter("password") + "', Mobile=  '"
						+ request.getParameter("Phone") + "',Gender ='" + request.getParameter("Gender") + "',Address='"
						+ request.getParameter("Addr") + "' where id ='" + (String) getServletContext().getAttribute("LID") + "'");
				con.commit();
				out.println("        swal({");
				out.println("            title: 'Update SucessFull',");
				out.println("            type: 'success'");
				out.println("        }, function() {");
//				out.println("            document.getElementById('002').style.display='none';");
				out.println("location.href = '" + (String) getServletContext().getAttribute("JSPName") + "';");
				out.println("        });");
			} else {
				out.println("        swal({");
				out.println("            title: 'Update Failed',");
				out.println("            text:'" + Errmsg + "',");
				out.println("            type: 'error'");
				out.println("        }, function() {");
				// out.println("location.href = '"+ (String)
				// getServletContext().getAttribute("JSPName")+"';");
//				out.println("            document.getElementById('002').style.display='block';");
				out.println("        });");

			}
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher((String) getServletContext().getAttribute("JSPName"));
			rd.include(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
