<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>区域管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
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
		<li><a href="${ctx}/sys/area/list">区域列表</a></li>
		<li class="active"><a href="javascript:void(0);">区域
			<shiro:hasPermission name="sys:area:edit">
				${empty area.id ? '添加':'修改'}
			</shiro:hasPermission>
			<shiro:lacksPermission name="sys:area:edit">
				查看
			</shiro:lacksPermission>
		</a></li>
	</ul><br/>
	<form:form id="inputForm" cssClass="form-horizontal"
			   action="${ctx}/sys/area/save" method="post" modelAttribute="area" >
		<form:hidden path="id" />
		<input type="hidden" name="oldParentId" value="${area.parent.id}" />
		<div class="control-group">
			<label class="control-label">上级区域:</label>
			<div class="controls">
				<sys:treeselect id="area" name="parent.id" value="${area.parent.id}"
								labelName="parent.name" labelValue="${area.parent.name}"
								title="区域" url="/sys/area/treeData" cssClass="input-block-level" extId="${area.id}"
								allowClear="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域名称:</label>
			<div class="controls">
				<form:input path="name" id="name" cssClass="required" maxlength="50" />
				<span class="help-inline"><span style="color:red">*</span> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域编码:</label>
			<div class="controls">
				<form:input path="code" maxlength="50" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域类型:</label>
			<div class="controls">
				
				<form:select path="type" cssClass="input-medium">
					<form:options items="${pm:getDictList('sys_area_type')}" itemLabel="label" itemValue="value" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" maxlength="200" cssClass="input-xlarge" rows="3" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:area:edit" >
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>