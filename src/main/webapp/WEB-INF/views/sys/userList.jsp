<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">

		function page(n,s){
			if(n) $("#pageNum").val(n);
			if(s) $("#pageSize").val(s);
			//$("#searchForm").attr("action","${ctx}/sys/user/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">用户列表</a></li>
		<li><a href="${ctx}/sys/user/toEdit">用户添加</a></li>
	</ul>
	<form:form id="searchForm" cssClass="breadcrumb form-search "
			   action="${ctx}/sys/user/list" method="post" modelAttribute="user">
		<sys:msg msgObj="${msg}" />
		<input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}"/>
		<!--排序 -->
		<sys:tableSort id="userOderBy" name="orderBy" value="${orderBy}" callback="page ();" />
		<!--排序 -->
		<ul class="ul-form">
			<li><label>所属公司：</label>
			<sys:treeselect id="company" name="company.id" value="${user.company.id}"
							labelName="company.name" labelValue="${user.company.name}"
							title="公司" url="/sys/office/treeData?type=1"
							cssClass="input-small" allowClear="true" />
			</li>
			<li><label>登录名：</label>
				<form:input path="loginName" id="loginName" cssClass="input-medium" maxlength="50" />
			<li class="clearfix"></li>
			<li><label>所属部门：</label>
			<sys:treeselect id="office" name="office.id" value="${user.office.id}"
							labelName="office.name" labelValue="${user.office.name}"
							title="部门" url="/sys/office/treeData?type=2"
							cssClass="input-small" allowClear="true" notAllowSelectParent="true" />
			</li>
			<li><label>姓&nbsp;&nbsp;&nbsp;名：</label>
				<form:input path="name" maxlength="50" cssClass="input-medium" id="name" />
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			<li class="clearfix"></li>
		</ul>
	</form:form>
<script type="text/javascript">top.$.jBox.closeTip();</script>

	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>所属公司</th>
			<th>所属部门</th>
			<th class="sort-column login_name">登录名</th>
			<th class="sort-column name">姓名</th>
			<th>电话</th>
			<th>手机</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${pageInfo.list}" var="user">
			<tr>
				<td>${user.company.name}</td>
				<td>${user.office.name}</td>
				<td><a href="${ctx}/sys/user/toEdit?id=${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>${user.phone}</td>
				<td>${user.mobile}</td>
				<td>
					<a href="${ctx}/sys/user/toEdit?id=${user.id}">修改</a>
					<a href="${ctx}/sys/user/delete?id=${user.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">
		${pm:pageStr(pageInfo)}
	</div>
</body>
</html>