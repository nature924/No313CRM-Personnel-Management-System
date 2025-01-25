<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=contextPath%>/static/jquery-2.1.3.min.js"></script>
    <script>
        function showTime() {
            nowtime = new Date();
            year = nowtime.getFullYear();
            month = nowtime.getMonth() + 1;
            date = nowtime.getDate();
            document.getElementById("mytime").innerText = year + "年" + month + "月" + date + " " + nowtime.toLocaleTimeString();
        }
        setInterval("showTime()", 100);
    </script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="text-align: center">欢迎访问CRM人事管理系统</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">
                    <img src="images/ic_system.png" alt="">
                    &nbsp;&nbsp;系统详细信息
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>系统记录</legend>
                </fieldset>
                <ul class="layui-timeline">
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">开发作者 By：iArchie</div>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">所使用的数据库：MySQL</div>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">前台使用技术点:layui框架+jQuery+JavaScript+HTML/CSS</div>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">后端使用技术框架：Spring5+SpringMVC+Mybatis</div>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">当前系统版本 1.0 发布</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">
                    <img src="images/ic_time.png" alt=""> &nbsp;&nbsp;
                    当前系统时间：<span id="mytime"></span>
                </div>
                <div class="layui-card-body">
                    <div class="site-demo-laydate">
                        <div class="layui-inline" id="test-n1"></div>
                        <div class="layui-inline" id="test-n2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            , position: 'static'
        });
        laydate.render({
            elem: '#test-n2'
            , position: 'static'
            , lang: 'en'
        });
    });
</script>
</body>
</html>
