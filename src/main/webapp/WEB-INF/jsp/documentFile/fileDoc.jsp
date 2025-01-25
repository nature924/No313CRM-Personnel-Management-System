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
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="text-align: center">CRM文件系统页面</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend>下载文件中心</legend>
        </fieldset>
        <div class="layui-form" style="text-align: center">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="250">
                    <col width="250">
                    <col width="250">
                    <col width="150">
                    <col width="50">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th style="text-align: center">序号</th>
                    <th style="text-align: center">文件名</th>
                    <th style="text-align: center">文件描述</th>
                    <th style="text-align: center">上传用户</th>
                    <th style="text-align: center">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>测试</td>
                    <td>测试啊啊啊啊啊啊啊啊啊啊啊</td>
                    <td>测试</td>
                    <td>测试</td>
                    <td><a href="">删除</a>&nbsp;|&nbsp;<a href="">下载</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="<%=contextPath%>/layui/layui.js"></script>
</body>
</html>
