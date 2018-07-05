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

@WebServlet(name = "ContactSer", urlPatterns = { "/ContactSer" })
public class ContactSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		Connection con = null;
		Statement stmt = null;
		try {
			con = new OracalDatabaseConnect().Connect();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt.executeQuery("DECLARE \r\n" + "    NCOUNT NUMBER; \r\n" + "    V_SQL  LONG; \r\n"
					+ "    V_SQL1 LONG; \r\n" + "    TRIG   LONG; \r\n" + "BEGIN \r\n" + "    SELECT COUNT(*) \r\n"
					+ "    INTO   NCOUNT \r\n" + "    FROM   DBA_TABLES \r\n"
					+ "    WHERE  TABLE_NAME = 'ENQUIRY'; \r\n" + "\r\n" + "    IF ( NCOUNT <= 0 ) THEN \r\n"
					+ "      V_SQL := '  CREATE TABLE ENQUIRY(  ID NUMBER(15) NOT NULL , FULLNAME VARCHAR2(50) NOT NULL  , MOBILE NUMBER(15) NOT NULL  , EMAIL VARCHAR2(50) NOT NULL  , MESSAGE VARCHAR2(500) NOT NULL  , CONSTRAINT ENQUIRY_PK PRIMARY KEY (ID)  ENABLE )'; \r\n"
					+ "\r\n" + "      V_SQL1 := \r\n"
					+ "      'CREATE SEQUENCE ENQUIRY_SEQ MINVALUE 1 NOMAXVALUE INCREMENT BY 1'; \r\n" + "\r\n"
					+ "      TRIG := 'CREATE TRIGGER ENQUIRY_TRIGGER BEFORE INSERT ON ENQUIRY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW  BEGIN  SELECT ENQUIRY_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;  END;'; \r\n"
					+ "\r\n" + "      EXECUTE IMMEDIATE V_SQL; \r\n" + "\r\n" + "      EXECUTE IMMEDIATE V_SQL1; \r\n"
					+ "\r\n" + "      EXECUTE IMMEDIATE TRIG; \r\n" + "    END IF; \r\n" + "END; ");
			con.commit();
			stmt.executeUpdate("INSERT INTO ENQUIRY (FULLNAME, MOBILE, EMAIL, MESSAGE) VALUES ('"
					+ request.getParameter("FName").toString() + "', " +request.getParameter("MNumber") + ", '"
					+ request.getParameter("EmailID") + "', '" + request.getParameter("Msg") + "')");
			con.commit();
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://code.jquery.com/jquery-2.1.3.min.js'></script>");
			out.println("  <script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js'></script>");
			out.println("  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css'>");
			out.println("<style>");
			out.println(".sweet-alert fieldset input[type='text'] {");
			out.println("display: none;");
			out.println("}");
			out.println("</style>");
			out.println("<script type='text/javascript'>");
			out.println("$(document).ready(function() {");
			out.println("        swal({");
			out.println("            title: 'Submitted',");
			out.println("            type: 'success'");
			out.println("        }, function() {");
			out.println("            location.href = 'ContactUs.jsp';");
			out.println("        });");
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("ContactUs.jsp");
            rd.include(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
