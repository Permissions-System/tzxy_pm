<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>菜单管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("#name").focus();
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
		<li><a href="${ctx}/sys/menu/list">菜单列表</a></li>
		<li class="active"><a href="javascript:void(0);">菜单添加</a></li>
	</ul>
	<br/>
	<form:form id="inputForm" cssClass="form-horizontal"  modelAttribute="menu"
			   action="${ctx}/sys/menu/save" method="post">
		<form:hidden path="id" />
		<input type="hidden" name="oldParentId" value="${menu.parent.id}" />
		<sys:msg msgObj="${msg}" />
		<div class="control-group">
			<label class="control-label">上级菜单:</label>
			<div class="controls">
			<sys:treeselect id="menu" name="parent.id" value="${menu.parent.id}"
							labelName="parent.name" labelValue="${menu.parent.name}"
							title="菜单" url="/sys/menu/treeData" extId="${menu.id}" cssClass="required" />
			
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
				<form:input path="name" id="name" cssClass="required input-xlarge" maxlength="50" />
				<span class="help-inline"><span style="color:red">*</span> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">链接:</label>
			<div class="controls">
				<form:input path="href" id="href" cssClass="input-xxlarge" maxlength="2000" />
				<span class="help-inline">点击菜单跳转的页面</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目标:</label>
			<div class="controls">
				<form:input path="target" id="target" cssClass="input-small"  maxlength="10" />
				<span class="help-inline">链接地址打开的目标窗口，默认：mainFrame</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图标:</label>
			<div class="controls">
			<sys:iconselect id="icon" name="icon" value="${menu.icon}" />

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" id="sort" cssClass="required digits input-small"  maxlength="50" />
				<span class="help-inline"><span class="help-inline"><span style="color:red">*</span> </span>排列顺序，升序。</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可见:</label>
			<div class="controls">
				<span>
					<form:radiobuttons path="isShow" items="${pm:getDictList('show_hide')}"
						itemLabel="label" itemValue="value" cssClass="required" />
				<span class="help-inline">该菜单或操作是否显示到系统菜单中</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权限标识:</label>
			<div class="controls">
				<form:input path="permission" id="permission" cssClass="input-xxlarge" maxlength="100" />
				<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" id="remarks" maxlength="200"
							   cssClass="input-xxlarge" rows="3" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:menu:edit" >
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>