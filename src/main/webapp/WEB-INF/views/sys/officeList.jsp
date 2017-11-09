<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>机构管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#treeTable").treeTable({expandLevel : 5});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">机构列表</a></li>
		<li><a href="${ctx}/sys/office/toEdit">机构添加</a></li>
	</ul>
	<sys:msg msgObj="${msg}" />

	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>机构名称</th>
			<th>所属区域</th>
			<th>机构编码</th>
			<th>机构类型</th>
			<th>备注</th>
			<shiro:hasPermission name="sys:office:edit" >
				<th>操作</th>
			</shiro:hasPermission>
		</tr>
		</thead>
		<tbody id="treeTableList">
			<c:forEach items="${list}" var="office" >
				<tr id="${office.id}" pId="${office.parent.id}">
					<td><a href="#">${office.name}</a></td>
					<td>${office.area.name}</td>
					<td>${office.code}</td>
					<td>${pm:getDictLabel(office.type, 'sys_office_type')}</td>
					<td>${office.remarks}</td>
					<shiro:hasPermission name="sys:office:edit" >
						<td>
							<a href="${ctx}/sys/office/toEdit?id=${office.id}">修改</a>
							<a href="${ctx}/sys/office/delete?id=${office.id}"
							   onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)">删除</a>
							<a href="${ctx}/sys/office/toEdit?parent.id=${office.id}">添加下级机构</a>
						</td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>