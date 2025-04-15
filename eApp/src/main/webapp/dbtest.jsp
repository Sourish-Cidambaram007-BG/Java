<%@ page import="java.sql.*" %>
<%@ page import="com.DB.DBConnect" %>
<%
    Connection conn = DBConnect.getConn();
    if (conn != null) {
        out.println("<h3 style='color:green;'>✅ Database Connected Successfully!</h3>");
    } else {
        out.println("<h3 style='color:red;'>❌ Database Connection Failed!</h3>");
    }
%>
