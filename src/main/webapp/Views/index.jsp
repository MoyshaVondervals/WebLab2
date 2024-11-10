<%@ page import="Managers.PointManager" %>
<%@ page import="Models.Point" %>
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
<% PointManager pointDAO = (PointManager) session.getAttribute("pointManager"); %>
<jsp:include page="Header.jsp"/>

<div class="container">
    <form id = "form">

        <div class="box-1">
            <jsp:include page="Xform.jsp"/>
        </div>
        <div class="box-2">
            <label>Изменение Y</label>
            <p><input type="text" id="Yvalue" name="Yvalue" placeholder="Значение Y (-5, 3)" required /></p>
        </div>

        <div class="box-3" >
            <jsp:include page="Rform.jsp"/>
        </div>
    </form>


    <div class="box-4" id = "ImgBox" onclick="svgMousePosition()">
        <jsp:include page="Graph.jsp"/>
    </div>

    <div id = "CheckField">
        <div class="box-5">
            <button id = CheckButton onclick="formHandler()"><p>Проверить</p></button>
        </div>

        <div class = "box-6">
            <p>Первичная валидация данных</p>
            <p id = dialogWindow></p>
            <p id = "coords"></p>
        </div>
    </div>
    <div class = "box-7">
        <jsp:include page="ResultTable.jsp"/>
    </div>
</div>

<script src = "ValidatorScript.js"></script>
</body>

</html>
