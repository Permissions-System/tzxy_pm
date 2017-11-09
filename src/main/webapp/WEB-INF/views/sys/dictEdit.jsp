<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>字典管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#valueInput").focus();
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
		<li><a href="${ctx}/sys/dict/list">字典列表</a></li>
		<li class="active"><a href="javascript:void(0);">字典${not empty dict.id ? '修改' : '添加'}</a></li>
	</ul><br/>
	<form:form id="inputForm" cssClass="form-horizontal" action="${ctx}/sys/dict/save"
			method="post" modelAttribute="dict">
		<form:hidden path="id" />

		<div class="control-group">
			<label class="control-label">键值:</label>
			<div class="controls">
				<form:input id="valueInput" path="value" cssClass="required" maxlength="50" />
				<form:errors path="value" cssClass="error" element="label" />
				<span class="help-inline"><span style="color:red">*</span></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标签:</label>
			<div class="controls">
				<form:input path="label" cssClass="required" maxlength="50" />
				<form:errors path="label" cssClass="error" element="label" />
				<span class="help-inline"><span style="color:red">*</span></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型:</label>
			<div class="controls">
				<form:input path="type" cssClass="required" maxlength="50" />
				<form:errors path="type" cssClass="error" element="label" />
				<span class="help-inline"><span style="color:red">*</span> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">描述:</label>
			<div class="controls">
				<form:input path="description" cssClass="required" maxlength="50" />
				<form:errors path="description" cssClass="error" element="label" />
				<span class="help-inline"><span style="color:red">*</span> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" cssClass="required digits" maxlength="11" />
				<form:errors path="sort" cssClass="error" element="label" />
				<span class="help-inline"><span style="color:red">*</span> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" maxlength="200" cssClass="input-xlarge" rows="3" />
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>