<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=contextPath%>/static/jquery-2.1.3.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>职位添加</legend>
</fieldset>

<form class="layui-form" method="post">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">职位添加</div>
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">职位名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="positionname" lay-verify="required" autocomplete="off"
                                           placeholder="请输入职位名称"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">职位描述</label>
                                <div class="layui-input-block">
                                    <input type="text" name="positionmsg" lay-verify="required" autocomplete="off"
                                           placeholder="请输入职位描述" class="layui-input">
                                </div>
                            </div>
                            <button class="layui-btn" lay-submit lay-filter="formBtn"
                                    style="margin-left: 120px">立即添加
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</form>

<script type="text/javascript" src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        //监听提交点击事件
        form.on('submit(formBtn)', function (data) {
            //像服务端发送请求
            $.ajax({
                url: '<%=contextPath%>/position/positionAdd',
                type: 'POST',
                data: JSON.stringify(data.field),
                contentType: 'application/json',  //数据类型格式
                success: function (result) {
                    if (result == "success") {
                        layer.msg('添加成功！', {time: 1 * 1000}, function () {
                            location.reload();
                        });
                    } else {
                        alert("添加失败！" + result);
                    }
                },
                error: function (errorMsg) {
                    alert("数据异常！" + errorMsg);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
