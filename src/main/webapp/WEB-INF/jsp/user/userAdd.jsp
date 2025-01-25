<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=contextPath%>/static/jquery-2.1.3.min.js"></script>

</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户添加</legend>
</fieldset>
<form class="layui-form" method="post">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">用户添加</div>
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">登入名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="loginname" lay-verify="required" autocomplete="off"
                                           placeholder="请输入登入名"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" lay-verify="required" autocomplete="off"
                                           placeholder="请输入密码"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">用户类型</label>
                                <div class="layui-input-inline">
                                    <select name="username">
                                        <option value="">请选择用户类型</option>
                                        <option value="超级管理员">超级管理员</option>
                                        <option value="普通用户">普通用户</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">状态</label>
                                <div class="layui-input-inline">
                                    <select name="state">
                                        <option value="">请选择状态</option>
                                        <option value="1">激活</option>
                                        <option value="0">未激活</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button class="layui-btn" lay-submit lay-filter="formDemo"
                                style="margin-left: 120px">立即添加
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        //监听提交点击事件
        form.on('submit(formDemo)', function (data) {
            //像服务端发送请求
            $.ajax({
                url: '<%=contextPath%>/admin/userAdd',
                type: 'POST',
                data: JSON.stringify(data.field),
                contentType: 'application/json',  //数据类型格式
                success: function (result) {
                    if (result == "success") {
                        layer.msg('添加成功！', {time: 1 * 1000}, function () {
                            location.reload();
                        });
                    } else {
                        layer.msg("添加失败！" + result, {icon: 5});
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