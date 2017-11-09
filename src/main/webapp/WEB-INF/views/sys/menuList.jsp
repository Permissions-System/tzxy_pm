<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>菜单管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("#treeTable").treeTable({expandLevel : 3}).show();
		});
    	function updateSort() {
			loading('正在提交，请稍等...');
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">菜单列表</a></li>
		<shiro:hasPermission name="sys:menu:edit">
		<li><a href="${ctx}/sys/menu/toEdit">菜单添加</a></li>
		</shiro:hasPermission>
	</ul>
	<sys:msg msgObj="${msg}" />

	<form id="listForm" method="post" action="${ctx}/sys/menu/updateSort">
		<table id="treeTable" class="table table-striped table-bordered table-condensed hide">
			<thead>
				<tr>
					<th>名称</th>
					<th>链接</th>
					<th style="text-align:center;">排序</th>
					<th>可见</th>
					<th>权限标识</th>
					<shiro:hasPermission name="sys:menu:edit">
					<th>操作</th>
					</shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="menu">
				<tr id="${menu.id}" pId="${menu.parent.id ne '1'?menu.parent.id:'0'}">
					<td nowrap>
						<i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i>
						<a href="${ctx}/sys/menu/toEdit?id=${menu.id}">${menu.name}</a></td>
					<td title="${menu.href}">${menu.href}</td>
					<td style="text-align:center;">
						<shiro:hasPermission name="sys:menu:edit">
						<input type="hidden" name="ids" value="${menu.id}"/>
						<input name="sorts" type="text" value="${menu.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
						</shiro:hasPermission>
						<shiro:lacksPermission name="sys:menu:edit" >
							${menu.sort}
						</shiro:lacksPermission>
					</td>
					<td>${pm:getDictLabel(menu.isShow, 'show_hide')}</td>
					<td title="${menu.permission}">${menu.permission}</td>
					<shiro:hasPermission name="sys:menu:edit">
					<td nowrap>
						<a href="${ctx}/sys/menu/toEdit?id=${menu.id}">修改</a>
						<a href="${ctx}/sys/menu/delete?id=${menu.id}" onclick="return confirmx('要删除该菜单及所有子菜单项吗？', this.href)">删除</a>
						<a href="${ctx}/sys/menu/toEdit?parent.id=${menu.id}">添加下级菜单</a>
					</td>
					</shiro:hasPermission>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<shiro:hasPermission name="sys:menu:edit" >
			<div class="form-actions pagination-left">
				<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
			</div>
		</shiro:hasPermission>
	 </form>
</body>
</html>