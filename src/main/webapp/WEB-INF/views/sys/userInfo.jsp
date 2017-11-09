<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人信息</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>

<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">个人信息</a></li>
		<li><a href="${ctx}/sys/user/changePwd">修改密码</a></li>
	</ul>
	<br/>

	<form:form id="inputForm" cssClass="form-horizontal" action="${ctx}/sys/user/saveInfo" method="post"
			modelAttribute="user">
		<sys:msg msgObj="${msg}" />
		<form:hidden path="id" />
		<form:hidden path="loginName" />
		<div class="control-group">
			<label class="control-label">所属公司:</label>
			<div class="controls">
				<label class="lbl">${user.company.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属部门:</label>
			<div class="controls">
				<label class="lbl">${user.office.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名:</label>
			<div class="controls">
				<label class="lbl">${user.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱:</label>
			<div class="controls">
				<form:input path="email" id="email" maxlength="50" cssClass="email" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话:</label>
			<div class="controls">
				<form:input path="phone" maxlength="50" id="phone"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机:</label>
			<div class="controls">
				<form:input path="mobile" id="mobile" maxlength="50" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" id="remarks" maxlength="200" cssClass="input-xlarge" rows="3" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户角色:</label>
			<div class="controls">
				<label class="lbl">${user.roleNames}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上次登录:</label>
			<div class="controls">
				<label class="lbl">IP: ${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：
				<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full" /></label>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
		</div>
	</form:form>
</body>
</html>