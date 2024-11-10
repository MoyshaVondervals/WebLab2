<%@ page import="Models.Point" %>
<%@ page import="Managers.PointManager" %>
<%@ page import="Managers.PointManager" %><%--
  Created by IntelliJ IDEA.
  User: moyshavondefvals
  Date: 28.10.2024
  Time: 01:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% PointManager pointDAO = (PointManager) session.getAttribute("pointManager"); %>
<svg height="300" width="300">
  <!-- shapes-->
  <rect x="50" y="150" width="100" height="100" class="geometryShape"></rect>
  <polygon points="150,200 150,150 250,150" class="geometryShape" id = "tri"></polygon>
  <path d="M50,150 A100,100 0 0,1 150,50 L150,150 Z" class="geometryShape" id = "circle"></path>

  <!-- X axis -->
  <line stroke="black" x1="0" x2="300" y1="150" y2="150" />
  <line stroke="black" x1="290" x2="300" y1="145" y2="150" />
  <line stroke="black" x1="290" x2="300" y1="155" y2="150" />
  <text fill="black" x="288" y="140">X</text>

  <!-- Y axis -->
  <line stroke="black" x1="150" x2="150" y1="0" y2="300" />
  <line stroke="black" x1="150" x2="155" y1="0" y2="10" />
  <line stroke="black" x1="150" x2="145" y1="0" y2="10" />
  <text fill="black" x="160" y="12">Y</text>

  <!-- X points -->
  <line stroke="black" x1="50" x2="50" y1="153" y2="147" />
  <line stroke="black" x1="100" x2="100" y1="153" y2="147" />
  <line stroke="black" x1="200" x2="200" y1="153" y2="147" />
  <line stroke="black" x1="250" x2="250" y1="153" y2="147" />

  <!-- X points R-->
  <text fill="black" x="35" y="140" font-size="12">-R/2</text>
  <text fill="black" x="90" y="140" font-size="12">-R</text>
  <text fill="black" x="188" y="140" font-size="12">R/2</text>
  <text fill="black" x="245" y="140" font-size="12">R</text>

  <!-- Y points -->
  <line stroke="black" x1="147" x2="153" y1="50" y2="50" />
  <line stroke="black" x1="147" x2="153" y1="100" y2="100" />
  <line stroke="black" x1="147" x2="153" y1="200" y2="200" />
  <line stroke="black" x1="147" x2="153" y1="250" y2="250" />

  <!-- Y points R-->
  <text fill="black" x="160" y="55" font-size="12">R</text>
  <text fill="black" x="160" y="105" font-size="12">R/2</text>
  <text fill="black" x="160" y="205" font-size="12">-R/2</text>
  <text fill="black" x="160" y="255" font-size="12">-R</text>
  <%if (pointDAO !=null){
    for(Point point : pointDAO.getPointLinkedList()){
      int x = (int)( point.getX()/point.getR()*100)+150;
      int y = (int) (-point.getY()/ point.getR()*100)+150;
  %>
  <circle cx=<%=x%> cy=<%=y%> r=4 fill=<%=pointDAO.colorDot(point.isStatus())%> stroke-width=1 stroke="white" />
  <%}
  }%>

</svg>