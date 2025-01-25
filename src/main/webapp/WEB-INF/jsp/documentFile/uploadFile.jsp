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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>文件上传</legend>
</fieldset>
<form class="layui-form" method="post">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-inline">
                <label class="layui-form-label">上传文件：</label>
                <div class="layui-input-inline">
                    <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">文件描述</label>
                <div class="layui-input-inline">
                    <input type="text" name="filemsg" lay-verify="required" autocomplete="off" placeholder="请输入文件描述"
                           class="layui-input">
                </div>
            </div>
            <button class="layui-btn" lay-submit lay-filter="formBtn"
                    style="margin-left: 120px">立即添加
            </button>
        </div>
    </div>
</form>

<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use(['upload', 'form'], function () {
        var $ = layui.jquery
        var form = layui.form
            , upload = layui.upload;
        upload.render({
            elem: '#test3'
            , url: '/upload/'
            , accept: 'file' //普通文件
            , auto: false
            , done: function (res) {
                console.log(res)
            }
        });
        form.on('submit(formBtn)', function (data) {
            console.log(data);
            return false;
        });
    });

</script>
</body>
</html>
