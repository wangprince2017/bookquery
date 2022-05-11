<%@ page language="java" import="java.util.*,entity.*,DAO.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    BookDao bookdao = new BookDao();
    ArrayList books = bookdao.queryBooks();
%>
<center>
    <form action="books.jsp" method="post">
        价格:<input type="text" name="p1" />-<input type="text" name="p2" />
        <input type="submit" value="提交" />
    </form>
</center>
<table align="center" width="80%" border="1" cellspacing="0"
       cellpadding="5">
    <tr>
        <td>书号</td>
        <td>书名</td>
        <td>价格</td>
    </tr>
    <%
        String p1 = request.getParameter("p1");
        String p2 = request.getParameter("p2");
        if (books != null & p1 != null && p2 != null) {


            int a = 0, b = 0;
            try {
                a = Integer.parseInt(p1);
                b = Integer.parseInt(p2);
            } catch (Exception e) {
            }

            for (int i = 0; i < books.size(); i++) {
                Book b1 = (Book) books.get(i);
                if (b1.getPrice() > a && b1.getPrice() < b) {
                    out.println("<tr><td>" + b1.getId() + "</td><td>"
                            + b1.getName() + "</td><td>" + b1.getPrice()
                            + "</td></tr>");
                }
            }
        } else {
            out.println("<tr><td colspan='3'>没有符合要求的图书</td></tr>");
        }
    %>
</table>
</body>
</html>