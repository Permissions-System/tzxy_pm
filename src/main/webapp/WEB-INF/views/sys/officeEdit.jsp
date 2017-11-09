<%@page pageEncoding="utf-8" language="java"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>机构管理</title>
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
		<li><a href="${ctx}/sys/office/list">机构列表</a></li>
		<li class="active"><a href="javascript:void(0);">机构
			<shiro:hasPermission name="sys:office:edit">
				${empty office.id ? '添加':'修改'}
			</shiro:hasPermission>
			<shiro:lacksPermission name="sys:office:edit">
				查看
			</shiro:lacksPermission>
		</a></li>
	</ul><br/>
	<form:form id="inputForm" cssClass="form-horizontal" modelAttribute="office"
				   action="${ctx}/sys/office/save" method="post">
		<form:hidden path="id" />
		<input type="hidden" name="oldParentId" value="${office.parent.id}" />
		<div class="control-group">
			<label class="control-label">上级机构:</label>
			<div class="controls">
				<sys:treeselect id="office" name="parent.id" value="${office.parent.id}"
								labelName="parent.name" labelValue="${office.parent.name}"
								title="机构" url="/sys/office/treeData" extId="${office.id}" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属区域:</label>
			<div class="controls">
				<sys:treeselect id="area" name="area.id" value="${office.area.id}"
								labelName="area.name" labelValue="${office.area.name}"
								title="区域" url="/sys/area/treeData" cssClass="required" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构名称:</label>
			<div class="controls">
				<form:input path="name" id="name" cssclass="required"  maxlength="50" />
				<span class="help-inline"><span style="color:red">*</span> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构编码:</label>
			<div class="controls">
				<form:input path="code" maxlength="50" id="code" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构类型:</label>
			<div class="controls">
				<form:select path="type" cssClass="input-medium">
					<form:options items="${pm:getDictList('sys_office_type')}" itemLabel="label"
							itemValue="value" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构级别:</label>
			<div class="controls">
				<form:select path="grade" cssClass="input-medium">
					<form:options items="${pm:getDictList('sys_office_grade')}" itemLabel="label"
								  itemValue="value" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否可用:</label>
			<div class="controls">

				<form:select path="useable">
					<form:options items="${pm:getDictList('yes_no')}" itemLabel="label" itemValue="value" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<form:input path="address" maxlength="50" id="address" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<form:input path="zipCode" maxlength="50" id="zipCode" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">负责人:</label>
			<div class="controls">
				<form:input path="master" maxlength="50" id="master" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话:</label>
			<div class="controls">
				<form:input path="phone" maxlength="50" id="phone" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">传真:</label>
			<div class="controls">
				<form:input path="fax" maxlength="50" id="fax" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱:</label>
			<div class="controls">
				<form:input path="email" maxlength="50" id="email" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" maxlength="200" cssClass="input-xlarge" rows="3" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:office:edit" >
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
