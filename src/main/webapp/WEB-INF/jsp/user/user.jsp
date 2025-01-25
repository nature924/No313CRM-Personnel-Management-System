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

</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户列表界面</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">用户信息</div>
                <form class="layui-form layui-from-pane" action="" method="post">
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">用户名:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="loginname" placeholder="请输入需要查询的用户名"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">用户状态:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="state" placeholder="请输入查询的状态（0/1）"
                                           class="layui-input">
                                </div>
                            </div>
                            <button class="layui-btn" lay-submit lay-filter="queryForm"
                                    style="margin-left: 120px">立即查询
                            </button>
                        </div>
                        <table id="demo" lay-filter="test"></table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--
这里是弹出层的表单信息
表单的id用于表单的选择，style是在本页隐藏，只有点击编辑才会弹出
--%>
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">登入名</label>
                    <div class="layui-input-inline">
                        <input type="text" readonly="readonly" id="loginname" name="loginname" lay-verify="required"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <span style="color: #8D8D8D;">后台登入名不可更改！</span>

                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input id="password" type="password" name="password" lay-verify="required" autocomplete="off"
                               placeholder="请输入密码"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户类型</label>
                    <div class="layui-input-inline">
                        <select name="username" id="username" lay-verify="required">
                            <option value="">请选择用户类型</option>
                            <option value="超级管理员">超级管理员</option>
                            <option value="普通用户">普通用户</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <select name="state" id="state" lay-verify="required">
                            <option value="">请选择状态</option>
                            <option value="1">激活</option>
                            <option value="0">未激活</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="formDemo"
                        style="margin-left: 120px">立即添加
                </button>
            </div>
        </form>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="<%=contextPath%>/layui/layui.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/jquery-2.1.3.min.js"></script>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#demo'
            , height: 312
            , url: '<%=contextPath%>/admin/userList' //后台数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'loginname', title: '登入名', width: 200}
                , {field: 'password', title: '密码', width: 200}
                , {field: 'username', title: '用户类型', width: 200}
                , {field: 'state', title: '状态', width: 120}
                , {field: 'createtime', title: '注册时间', width: 430, sort: true}
                , {
                    fixed: 'right', title: '操作', toolbar: '#barDemo', width: 180
                }
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除\t' + data.loginname + "\t用户吗!", function (index) {
                    //向服务端发送请求
                    $.ajax({
                        url: "<%=contextPath%>/admin/delete",
                        type: "GET",
                        data: {'id': data.id},
                        success: function (result) {
                            if (result == "success") {
                                layer.msg("删除成功", {icon: 6});
                                //删除这一行
                                obj.del();
                                //关闭弹框
                                layer.close(index);
                            } else if (result == "error") {
                                //关闭弹框
                                layer.close(index);
                                layer.msg("删除失败", {icon: 5});
                            }
                        },
                    });
                });
            } else if (obj.event = 'edit') {
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    type: 1,
                    title: "更新用户",
                    area: ['580px', '330px'],
                    content: $("#popUpdateTest"),//引用的弹出层的页面层的方式加载修改界面表单
                    success: function (layero, index) {
                        //做回显
                        $('#loginname').val(data.loginname);
                        $('#password').val(data.password);
                    }
                });
            }
        });
        //监听查询点击事件
        form.on('submit(queryForm)', function (data) {
                table.render({
                    elem: '#demo'
                    , height: 312
                    , url: '<%=contextPath%>/admin/userList?page=1&limit=10&keyword1=' + data.field.loginname + '&keyword2=' + data.field.state //后台数据接口
                    , page: true //开启分页
                    , cols: [[ //表头
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'loginname', title: '登入名', width: 200}
                        , {field: 'password', title: '密码', width: 200}
                        , {field: 'username', title: '用户类型', width: 200}
                        , {field: 'state', title: '状态', width: 120}
                        , {field: 'createtime', title: '注册时间', width: 430, sort: true}
                        , {
                            fixed: 'right', title: '操作', toolbar: '#barDemo', width: 180
                        }
                    ]]
            });
            return false;
        });
        //监听表单中按钮
        layui.use('form', function () {
            var form = layui.form;
            //监听提交点击事件
            form.on('submit(formDemo)', function (data) {
                //像服务端发送请求
                $.ajax({
                    url: '<%=contextPath%>/admin/update',
                    data: JSON.stringify(data.field),
                    type: 'POST',
                    contentType: 'application/json',  //数据类型格式
                    success: function (result) {
                        if (result == "success") {
                            layer.msg('更新成功！', {icon: 6});
                            location.reload();
                        } else {
                            layer.msg('更新失败！', {icon: 5});
                        }
                    },
                    error: function (errorMsg) {
                        alert("数据异常！" + errorMsg);
                        location.reload();
                    },
                });
                return false;
            });
        });
    });
</script>
</body>
</html>