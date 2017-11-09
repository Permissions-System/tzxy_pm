<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>区域管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("#treeTable").treeTable({expandLevel : 5});
		});

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">区域列表</a></li>
		<li><a href="${ctx}/sys/area/toEdit">区域添加</a></li>
	</ul>
	<sys:msg msgObj="${msg}" />
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>区域名称</th>
			<th>区域编码</th>
			<th>区域类型</th>
			<th>备注</th>
			<shiro:hasPermission name="sys:area:edit">
			<th>操作</th>
			</shiro:hasPermission>
		</tr>
		</thead>
		<tbody id="treeTableList">
			<c:forEach items="${list}" var="area">
				<tr id="${area.id}" pId="${area.parent.id}">
					<td><a href="#">${area.name}</a></td>
					<td>${area.code}</td>
					<td>${pm:getDictLabel(area.type, 'sys_area_type')}</td>
					<td></td>
					<shiro:hasPermission name="sys:area:edit">
						<td>
							<a href="${ctx}/sys/area/toEdit?id=${area.id}">修改</a>
							<a href="${ctx}/sys/area/delete?id=${area.id}"
							   onclick="return confirmx('要删除该区域及所有子区域项吗？', this.href)">删除</a>
							<a href="${ctx}/sys/area/toEdit?parent.id=${area.id}">添加下级区域</a>
						</td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>