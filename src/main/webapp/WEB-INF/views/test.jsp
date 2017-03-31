<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linghu
  Date: 17/02/07
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${ctp}/static/assets/jquery/1.12.1/jquery.js"></script>
</head>
<input type="text" id="text">
<button id="btn">点击获取名称</button>
<body>
<script>
    $("#btn").click(function () {
        var val = $("#text").val();
        $.ajax({
            url: "${ctp}/test/getStr?str=" + val,
            success: function (v) {
                alert(v);
            }
        })
    });
</script>
</body>
</html>
