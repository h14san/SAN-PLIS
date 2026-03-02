<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.expensetracker.DBUtil" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Expenses - SAN-XT</title>
  <style>
    body {
      background-color: #121212;
      color: #fff;
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #F24E1E;
    }

    table {
      width: 90%;
      margin: 30px auto;
      border-collapse: collapse;
      background: rgba(255, 255, 255, 0.05);
      box-shadow: 0 0 15px rgba(0, 255, 204, 0.3);
    }

    th, td {
      padding: 15px;
      text-align: center;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    th {
      background-color: #F24E1E;
      color: #000;
    }

    tr:hover {
      background-color: rgba(0, 255, 204, 0.1);
    }
    .remove-btn {
    background-color: #e74c3c; /* Red danger color */
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .remove-btn:hover {
    background-color: #c0392b; /* Darker red when hovered */
    transform: scale(1.05); /* Slight zoom effect */
    }
    a.remove-link {
    text-decoration: none; /* remove underline */
    display: inline-block; /* allows margin, padding */
    }
  </style>
</head>

<body>

<h1>All Recorded Expenses</h1>
<%
    String deleteN0 = request.getParameter("deleten0");
    if (deleteN0 != null) {
        Connection deleteConn = null;
        PreparedStatement deleteStmt = null;
        try {
            deleteConn = DBUtil.getConnection();
            deleteStmt = deleteConn.prepareStatement("DELETE FROM expenses WHERE n0 = ?");
            deleteStmt.setInt(1, Integer.parseInt(deleteN0));
            deleteStmt.executeUpdate();
            // Optional: you can redirect to refresh without deleten0 in URL
            response.sendRedirect("viewExpenses.jsp");
            return;
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error deleting record: " + e.getMessage() + "</p>");
        } finally {
            if (deleteStmt != null) try { deleteStmt.close(); } catch (Exception e) {}
            if (deleteConn != null) try { deleteConn.close(); } catch (Exception e) {}
        }
    }
%>

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Date</th>
      <th>Description</th>
      <th>Amount (RWF)</th>
    </tr>
  </thead>
  <tbody>
    <%
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;

      try {
          conn = DBUtil.getConnection();
          stmt = conn.createStatement();
          rs = stmt.executeQuery("SELECT * FROM expenses ORDER BY n0 DESC");

          while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("n0") %></td>
      <td><%= rs.getDate("exdate") %></td>
      <td><%= rs.getString("description") %></td>
      <td><%= rs.getDouble("amount") %></td>
      <td>
          <a href="viewExpenses.jsp?deleten0=<%= rs.getInt("n0") %>" class="remove-link" onclick="return confirm('Are you sure you want to delete this expense?');" style="text-decoration: none;">
            <button type="button" class="remove-btn">Remove</button>
          </a>  
      </td>
    </tr>
    <%
          }
      } catch (Exception e) {
          out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
      } finally {
          if (rs != null) try { rs.close(); } catch (Exception e) {}
          if (stmt != null) try { stmt.close(); } catch (Exception e) {}
          if (conn != null) try { conn.close(); } catch (Exception e) {}
      }
    %>
  </tbody>
</table>

<a href="homepage.jsp">← Add Another Record</a>

</body>
</html>
