package com.agv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/SignUpSer" }, initParams = { @WebInitParam(name = "SignUpSer", value = "jj") })
public class SignUpSer extends HttpServlet {
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
			stmt.executeQuery("DECLARE \r\n" + "    NCOUNT NUMBER; \r\n" + "    V_SQL  LONG; \r\n"
					+ "    V_SQL1 LONG; \r\n" + "    TRIG   LONG; \r\n" + "BEGIN \r\n" + "    SELECT COUNT(*) \r\n"
					+ "    INTO   NCOUNT \r\n" + "    FROM   DBA_TABLES \r\n" + "    WHERE  TABLE_NAME = 'SIGNUP'; \r\n"
					+ "\r\n" + "    IF ( NCOUNT <= 0 ) THEN \r\n"
					+ "      V_SQL := '  CREATE TABLE SIGNUP(  ID NUMBER(15) NOT NULL , EMAIL VARCHAR2(50) NOT NULL,USERNAME VARCHAR2(50) NOT NULL,Gender VARCHAR2(50) NOT NULL,Address VARCHAR2(450) NOT NULL, PSW VARCHAR2(50) NOT NULL ,Mobile Number(15) NOT NULL, CONSTRAINT SIGNUP_PK PRIMARY KEY (ID)  ENABLE )'; \r\n"
					+ "\r\n" + "      V_SQL1 := \r\n"
					+ "      'CREATE SEQUENCE SIGNUP_SEQ MINVALUE 1 NOMAXVALUE INCREMENT BY 1'; \r\n" + "\r\n"
					+ "      TRIG := 'CREATE TRIGGER SIGNUP_TRIGGER BEFORE INSERT ON SIGNUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW  BEGIN  SELECT SIGNUP_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;  END;'; \r\n"
					+ "\r\n" + "      EXECUTE IMMEDIATE V_SQL; \r\n" + "\r\n" + "      EXECUTE IMMEDIATE V_SQL1; \r\n"
					+ "\r\n" + "      EXECUTE IMMEDIATE TRIG; \r\n" + "    END IF; \r\n" + "END; ");
			con.commit();
			System.out.println("INSERT INTO SIGNUP (Email, USERNAME, PSW, Mobile,Gender,Address) VALUES ('"
					+ request.getParameter("email") + "', '" + request.getParameter("User") + "', '"
					+ request.getParameter("password") + "', '" + request.getParameter("Phone") + "', '"
					+ request.getParameter("Gender") + "', '" + request.getParameter("Addr") + "')");
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
					"select * from SIGNUP where upper(Email) =upper('" + request.getParameter("email") + "')");
			if (rs.next()) {
				out.println("            document.getElementById('email').style.borderColor = 'red';");
				out.println("            document.getElementById('002').style.display='block';");
				Errmsg.append("Email ID Already Exists!\\n");
				// Errmsg.append(System.getProperty("line.separator"));
			}
			rs = null;

			rs = stmt.executeQuery(
					"select * from SIGNUP where upper(USERNAME) =upper('" + request.getParameter("User") + "')");
			if (rs.next()) {
				out.println("            document.getElementById('User').style.borderColor = 'red';");
				out.println("            document.getElementById('002').style.display='block';");
				Errmsg.append("User Name Already Taken!\\n");
				// Errmsg.append(System.getProperty("line.separator"));
			}

			rs = stmt.executeQuery("select * from SIGNUP where Mobile ='" + request.getParameter("Phone") + "'");
			if (rs.next()) {
				out.println("            document.getElementById('Phone').style.borderColor = 'red';");
				out.println("            document.getElementById('002').style.display='block';");
				Errmsg.append("Phone No Already Exists!\\n");
				// Errmsg.append(System.getProperty("line.separator"));;
			}

			rs = stmt.executeQuery(
					"select * from SIGNUP where Email ='" + request.getParameter("email") + "' or USERNAME ='"
							+ request.getParameter("User") + "' or Mobile ='" + request.getParameter("Phone") + "'");
			if (!rs.next()) {
				stmt.executeUpdate("INSERT INTO SIGNUP (Email, USERNAME, PSW, Mobile,Gender,Address) VALUES ('"
						+ request.getParameter("email") + "', '" + request.getParameter("User") + "', '"
						+ request.getParameter("password") + "', '" + request.getParameter("Phone") + "', '"
						+ request.getParameter("Gender") + "', '" + request.getParameter("Addr") + "')");
				con.commit();
				out.println("        swal({");
				out.println("            title: 'SignUp SucessFull',");
				out.println("            type: 'success'");
				out.println("        }, function() {");
				out.println("            document.getElementById('002').style.display='none';");
				out.println("location.href = '"+ (String) getServletContext().getAttribute("JSPName")+"';");
				out.println("        });");
			} else {
				out.println("        swal({");
				out.println("            title: 'SignUp Failed',");
				out.println("            text:'" + Errmsg + "',");
				out.println("            type: 'error'");
				out.println("        }, function() {");
//				out.println("location.href = '"+ (String) getServletContext().getAttribute("JSPName")+"';");
				out.println("            document.getElementById('002').style.display='block';");
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
