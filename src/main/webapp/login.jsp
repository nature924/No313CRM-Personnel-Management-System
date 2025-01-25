<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=contextPath%>/css/admin.css">
    <script src="<%=contextPath%>/layui/layui.js"></script>

    <script>
        function chageCode() {
            document.getElementById("img").src = "<%=contextPath%>/imageCode?time="
                + new Date().getTime();
        }
    </script>
</head>
<body>
<form class="layui-form" action="<%=contextPath%>/login" method="post">
    <div class="login">

        <h1>CRM后台登入系统</h1>
        <c:choose>
            <c:when test="${sessionScope.errorMsg == null }">
                <span style="margin-left: 50px;color: red">允许以中文名称登录</span>
            </c:when>
            <c:otherwise>
                <span style="margin-left: 20px;color: red">
                        ${sessionScope.errorMsg}
                </span>
            </c:otherwise>
        </c:choose>
        </span>
        <div class="layui-form-item">
            <input class="layui-input" name="loginname" placeholder="用户名" lay-verify="required" type="text"
                   id="username" value="${loginname}"
                   autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="password" id="password" placeholder="密码" lay-verify="required"
                   type="password"
                   autocomplete="off">
        </div>
        <div class="layui-form-item form_code">
            <input class="layui-input" name="imgCode" placeholder="验证码" lay-verify="required" type="text"
                   autocomplete="off">
            <div class="code">
                <img src="<%=contextPath%>/imageCode" width="116" height="36" id="img"
                     onclick="chageCode()">
            </div>
        </div>
        <button class="layui-btn login_btn" id="login" lay-submit lay-filter="formBtn">登录</button>
    </div>
</form>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //渲染控件
        form.render();
    });
</script>
</body>
</html>
