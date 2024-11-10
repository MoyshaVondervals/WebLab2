<%--
  Created by IntelliJ IDEA.
  User: moyshavondefvals
  Date: 28.10.2024
  Time: 01:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Models.Point" %>
<%@ page import="Managers.PointManager" %>
<%@ page import="Managers.PointManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% PointManager pointDAO = (PointManager) session.getAttribute("pointManager"); %>
<table>
  <thead>
  <tr>
    <td>X value</td>
    <td>Y value</td>
    <td>R value</td>
    <td>Result</td>
  </tr>
  <%if (pointDAO !=null){
    for(Point point : pointDAO.getPointLinkedList()){
  %>
  <tr>
    <td><%=point.getX()%></td>
    <td><%=point.getY()%></td>
    <td><%=point.getR()%></td>
    <td><%=point.isStatus()%></td>
  </tr>
  <%}
  }%>
  </thead>
</table>