<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/modules/layer/default/layer.css" media="all">
    <script type="text/javascript" src="<%=contextPath%>/static/jquery-2.1.3.min.js"></script>

</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>部门添加</legend>
</fieldset>
<form class="layui-form" action="" method="post">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">部门添加</div>
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">部门</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="deptname" lay-verify="required" autocomplete="off"
                                           placeholder="请输入姓名"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">描述信息</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="deptmsg" lay-verify="required" autocomplete="off"
                                           placeholder="请输入部门描述信息"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo"
                                style="margin-left: 120px">立即添加
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="<%=contextPath%>/layui/layui.js"></script>
<script type="text/javascript" src="<%=contextPath%>/layui/lay/modules/layer.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            $.ajax({
                url: '<%=contextPath%>/department/deptAdd',
                type: 'POST',
                data: JSON.stringify(data.field),
                contentType: 'application/json',
                //请求成功时执行该函数
                success: function (result) {
                    if (result == "success") {
                        layer.msg('添加成功!', {time: 1 * 1000}, function () {
                            location.reload();
                        });
                    } else {
                        alert("添加失败!" + result);
                    }
                },
                //请求失败时执行该函数
                error: function (errorMsg) {
                    alert("数据异常!" + errorMsg);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
