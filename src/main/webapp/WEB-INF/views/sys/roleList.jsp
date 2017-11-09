<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>角色管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		function page(n,s){
			if(n) $("#pageNum").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").submit();
			return false;
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">角色列表</a></li>
		<shiro:hasPermission name="sys:role:edit">
			<li><a href="${ctx}/sys/role/toEdit">角色添加</a></li>
		</shiro:hasPermission>
	</ul>
	<sys:msg msgObj="${msg}" />
	<form action="${ctx}/sys/role/list" method="post" id="searchForm">
		<input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}"/>
	</form>

	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<tr>
			<th>角色名称</th>
			<th>所属机构</th>
			<th>数据范围</th>
			<shiro:hasPermission name="sys:role:edit">
				<th>操作</th>
			</shiro:hasPermission>
		</tr>
		<c:forEach items="${pageInfo.list}" var="role">
		<tr>
			<td><a href="${ctx}/sys/role/toEdit?id=${role.id}">${role.name}</a></td>
			<td>${role.office.name}</td>
			<td>${pm:getDictLabel(role.dataScope, 'sys_data_scope')}</td>
			<shiro:hasPermission name="sys:role:edit">
				<td>
					<a href="${ctx}/sys/role/toRoleAssign?id=${role.id}">分配</a>
					<a href="${ctx}/sys/role/toEdit?id=${role.id}">修改</a>
					<a href="${ctx}/sys/role/delete?id=${role.id}"
					   onclick="return confirmx('确认要删除该角色吗？', this.href)">删除</a>
				</td>
			</shiro:hasPermission>
		</tr>
		</c:forEach>

	</table>
	<div class="pagination">
		${pm:pageStr(pageInfo)}
	</div>
</body>
</html>