<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.expensetracker.DBUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Database Connection Test</title>
</head>
<body style="font-family: Arial, sans-serif; text-align: center; margin-top: 100px;">

<%
    Connection conn = null;
    try {
        conn = DBUtil.getConnection();
        out.println("<h1 style='color:green;'>? Database Connection Successful!</h1>");
    } catch (Exception e) {
        out.println("<h1 style='color:red;'>? Database Connection Failed</h1>");
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>

</body>
</html>
