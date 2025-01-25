<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
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
    <legend style="text-align: center">欢迎使用CRM人事管理公告模块</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-form" style="text-align: center">
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="250">
                    <col width="350">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th style="text-align: center">序号</th>
                    <th style="text-align: center">公告标题</th>
                    <th style="text-align: center">公告描述</th>
                    <th style="text-align: center">操作用户</th>
                    <th style="text-align: center">操作</th>
                </tr>
                </thead>
                <c:forEach items="${docList}" var="d">
                    <tbody>
                    <tr>
                        <td style="text-align: center">${d.id}</td>
                        <td style="text-align: center">${d.docname}</td>
                        <td style="text-align: center">${d.docmsg}</td>
                        <td style="text-align: center">${d.useraction}</td>
                        <td style="text-align: center"><a href="deleteDoc?id=${d.id}">删除</a>&nbsp;|&nbsp;<a
                                href="updateDoc?id=${d.id}">查看</a></td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
    <div style="text-align: center">

        当前第 ${page.pageNum} 页.总共 ${page.pages} 页.一共 ${page.total} 条记录
        [${page.pageNum}/${page.total}]
        <%--第一页不能点击--%>
        <c:choose>
            <c:when test="${page.pageNum==1 }">
                <span>首页</span>
                <span>上一页</span>
            </c:when>
            <c:otherwise>
                <a href="noticeView?pageIndex=1">首页</a>
                <a href="noticeView?pageIndex=${page.pageNum-1}">上一页</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${page.firstPage == page.total}">
                <span>下一页</span>
                <span>末页</span>
            </c:when>
            <c:otherwise>
                <a href="noticeView?pageIndex=${page.pageNum +1}">下一页</a>
                <a href="noticeView?pageIndex=${page.pages}">尾页</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<script src="<%=contextPath%>/layui/layui.js"></script>
<script>

</script>
</body>
</html>
