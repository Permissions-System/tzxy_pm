<%@page import="com.tanzhouedu.pm.utils.ExceptionUtil"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<%
response.setStatus(403);

//获取异常类
Throwable ex = ExceptionUtil.getThrowable(request);

%>

<!DOCTYPE html>
<html>
<head>
	<title>403 - 操作权限不足</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>操作权限不足.</h1></div>

		<div><a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a></div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>