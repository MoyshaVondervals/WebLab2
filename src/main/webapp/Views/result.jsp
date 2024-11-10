<%@ page import="Models.Point" %>
<%@ page import="Managers.PointManager" %>
<%@ page import="Managers.PointManager" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style.css" rel="stylesheet">

    <meta name="theme-color" content="#fafafa">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Nerko+One&display=swap" rel="stylesheet">

</head>

<body>
<% PointManager pointManager = (PointManager) session.getAttribute("pointManager"); %>

<jsp:include page="Header.jsp"/>

<div class="container">

    <div class="box-4" id = "ImgBox">
        <jsp:include page="Graph.jsp"/>
    </div>

    <div id = "CheckField">
        <div class="box-5">
            <button id = CheckButton onclick="document.location='http://localhost:8080/web2t-1.0-SNAPSHOT/'">Вернуться на главную</button>
        </div>

        <div class = "box-6">
            <p>Последний запрос</p>
            <% if(pointManager !=null){%>
            <p><%="X:"+ pointManager.getPointLinkedList().getLast().getCoordinates().getX()
            +"  Y:"+ pointManager.getPointLinkedList().getLast().getCoordinates().getY()
            +"  R:"+ pointManager.getPointLinkedList().getLast().getCoordinates().getR()%></p>
            <%}%>
        </div>
    </div>
    <div class = "box-7">
        <jsp:include page="ResultTable.jsp"/>
    </div>
</div>


</body>

</html>
