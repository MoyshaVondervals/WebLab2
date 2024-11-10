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
<% PointManager pointManager = (PointManager) session.getAttribute("pointManager"); %>
<table>
  <thead>
  <tr>
    <td>X value</td>
    <td>Y value</td>
    <td>R value</td>
    <td>Result</td>
  </tr>
  <%if (pointManager !=null){
    for(Point point : pointManager.getPointLinkedList()){
  %>
  <tr>
    <td><%=point.getCoordinates().getX()%></td>
    <td><%=point.getCoordinates().getY()%></td>
    <td><%=point.getCoordinates().getR()%></td>
    <td><%=point.isStatus()%></td>
  </tr>
  <%}
  }%>
  </thead>
</table>