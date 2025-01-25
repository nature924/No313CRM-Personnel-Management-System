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
    <legend style="text-align: center">职位列表界面</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">职位信息</div>
                <form class="layui-form layui-from-pane" action="" method="post">
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">职位名称:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="positionname" placeholder="请输入需要查询的用户名"
                                           lay-verify="required" autocomplete="off" class="layui-input">
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
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: 312
            , url: '<%=contextPath%>/position/positionList' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'positionname', title: '职位名称', width: 450}
                , {field: 'positionmsg', title: '职位详细信息', width: 700}
                , {
                    fixed: 'right', title: '操作', toolbar: '#barDemo', width: 100
                }
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除\t' + data.positionname + "\t职位吗！", function (index) {
                    //向服务端发送请求
                    $.ajax({
                        url: '<%=contextPath%>/position/positionDelete',
                        type: 'GET',
                        data: {'id': data.id},
                        //请求执行成功
                        success: function (result) {
                            console.log("------------------->" + result);
                            if (result == "success") {
                                obj.del();
                                layer.msg("删除成功", {icon: 6});
                            } else {
                                layer.msg("删除失败", {icon: 5});
                            }
                        },
                        //请求执行失败
                        error: function (errorMsg) {
                            console.log("------------------->" + errorMsg);
                            layer.close(index);
                            alert("数据异常!" + errorMsg);
                        }

                    });
                });
            }
        });
        //监听职位查询按钮
        form.on('submit(queryForm)', function (data) {
            console.log("----->" + data.field.positionname)
            table.render({
                elem: '#demo'
                , height: 312
                , url: '<%=contextPath%>/position/positionList?keyword=' + data.field.positionname//数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'positionname', title: '职位名称', width: 450}
                    , {field: 'positionmsg', title: '职位详细信息', width: 700}
                    , {
                        fixed: 'right', title: '操作', toolbar: '#barDemo', width: 100
                    }
                ]]
            });
            return false;
        });
    });
</script>
</body>
</html>