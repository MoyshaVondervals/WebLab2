<%@ page import="com.example.web2t.Points.PointManager" %>
<%@ page import="com.example.web2t.Points.Point" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style.css" rel="stylesheet">
<%--    <meta name="description" content="">--%>

<%--    <meta property="og:title" content="">--%>
<%--    <meta property="og:type" content="">--%>
<%--    <meta property="og:url" content="">--%>
<%--    <meta property="og:image" content="">--%>
<%--    <meta property="og:image:alt" content="">--%>

<%--    <link rel="icon" href="/favicon.ico" sizes="any">--%>
<%--    <link rel="icon" href="/icon.svg" type="image/svg+xml">--%>
<%--    <link rel="apple-touch-icon" href="icon.png">--%>

<%--    <link rel="manifest" href="site.webmanifest">--%>
    <meta name="theme-color" content="#fafafa">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Nerko+One&display=swap" rel="stylesheet">

</head>

<body>
<% PointManager pointManager = (PointManager) session.getAttribute("pointManager"); %>
<div class = "cap">
    <h1 id = "cap">Покалюхин Илья Игоревич</h1>
    <h2>Группа: P3210</h2>
    <p>Вариант: 66678</p>
</div>

<div class="container">
    <form id = "form">
        <!--  <form>-->
        <div class="box-1">

            <label>Изменение X</label>
            <p>
                <select id="Xvalue" name="Xvalue">
                    <option value=-4>-4</option>
                    <option value=-3>-3</option>
                    <option value=-2>-2</option>
                    <option value=-1>-1</option>
                    <option value=0>0</option>
                    <option value=1>1</option>
                    <option value=2>2</option>
                    <option value=3>3</option>
                    <option value=4>4</option>
                </select>
            </p>

        </div>

        <div class="box-2">
            <label>Изменение Y</label>
            <p><input type="text" id="Yvalue" name="Yvalue" placeholder="Значение Y (-5, 3)" required /></p>

        </div>

        <div class="box-3" >
            <label>Изменение R</label>
            </p>
                <input type="radio" id="R1" name="Rvalue" value=1>
                <label for="R1">1</label><br>
                <input type="radio" id="R1.5" name="Rvalue" value=1.5>
                <label for="R1.5">1.5</label><br>
                <input type="radio" id="R2" name="Rvalue" value=2 checked>
                <label for="R2">2</label><br>
                <input type="radio" id="R2.5" name="Rvalue" value=2.5>
                <label for="R2.5">2.5</label><br>
                <input type="radio" id="R3" name="Rvalue" value=3>
                <label for="R3">3</label><br>
            </p>
        </div>
    </form>
    <!--  </form>-->

    <div class="box-4" id = "ImgBox" onclick="svgMousePosition()">
        <svg height="300" width="300" >
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
        </svg>
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
        <table>
            <thead>
                <tr>
                    <td>X value</td>
                    <td>Y value</td>
                    <td>R value</td>
                    <td>Result</td>
                </tr>

                <%if (pointManager!=null){
                    for(Point point : pointManager.getPointLinkedList()){
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
    </div>
</div>

<script src = "ValidatorScript.js"></script>
</body>

</html>
