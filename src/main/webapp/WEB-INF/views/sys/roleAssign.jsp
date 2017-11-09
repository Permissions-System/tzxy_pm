<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>分配角色</title>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/sys/role/list">角色列表</a></li>
    <li class="active"><a href="javascript:void(0);">角色分配</a></li>
</ul>
<div class="container-fluid breadcrumb">
    <div class="row-fluid span12">
        <span class="span4">角色名称: <b>${role.name}</b></span>
        <span class="span4">所属机构: ${role.office.name}</span>
    </div>
    <div class="row-fluid span8">

        <span class="span4">数据范围: ${pm:getDictLabel(role.dataScope, 'sys_data_scope')}</span>
    </div>
</div>
<sys:msg msgObj="${msg}"/>

<div class="breadcrumb">
    <form id="assignRoleForm" action="${ctx}/sys/role/assignUser" method="post" class="hide">
        <input type="hidden" name="id" value="${role.id}"/>
        <input id="idsArr" type="hidden" name="idsArr" value=""/>
    </form>
    <input id="assignButton" class="btn btn-primary" type="submit" value="分配角色"/>
    <script type="text/javascript">
        $("#assignButton").click(function () {
            top.$.jBox.open("iframe:${ctx}/sys/role/userToRole?id=${role.id}", "分配角色", 810, $(top.document).height() - 240, {
                buttons: {"确定分配": "ok", "清除已选": "clear", "关闭": true},
                bottomText: "通过选择部门，然后为列出的人员分配角色。",
                submit: function (v, h, f) {
                    var pre_ids = h.find("iframe")[0].contentWindow.pre_ids;
                    var ids = h.find("iframe")[0].contentWindow.ids;
                    //nodes = selectedTree.getSelectedNodes();
                    if (v == "ok") {
                        // 删除''的元素
                        if (ids[0] == '') {
                            ids.shift();
                            pre_ids.shift();
                        }
                        if (pre_ids.sort().toString() == ids.sort().toString()) {
                            top.$.jBox.tip("未给角色【${role.name}】分配新成员！", 'info');
                            return false;
                        }
                        ;
                        // 执行保存
                        loading('正在提交，请稍等...');
                        var idsArr = "";
                        for (var i = 0; i < ids.length; i++) {
                            idsArr = (idsArr + ids[i]) + (((i + 1) == ids.length) ? '' : ',');
                        }
                        $('#idsArr').val(idsArr);
                        $('#assignRoleForm').submit();
                        return true;
                    } else if (v == "clear") {
                        h.find("iframe")[0].contentWindow.clearAssign();
                        return false;
                    }
                },
                loaded: function (h) {
                    $(".jbox-content", top.document).css("overflow-y", "hidden");
                }
            });
        });
    </script>
</div>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
        <tr>
            <th>所属公司</th>
            <th>所属部门</th>
            <th>登录名</th>
            <th>姓名</th>
            <th>电话</th>
            <th>手机</th>
            <shiro:hasPermission name="sys:role:edit">
                <th>操作</th>
            </shiro:hasPermission>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${userList}" var="user" >
        <tr>
            <td>${user.company.name}</td>
            <td>${user.office.name}</td>
            <td>
                <shiro:hasPermission name="sys:user:edit">
                    <a href="${ctx}/sys/user/toEdit?id=${user.id}">${user.loginName}</a>
                </shiro:hasPermission>
                <shiro:lacksPermission name="sys:user:edit">
                    ${user.loginName}
                </shiro:lacksPermission>
            </td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.mobile}</td>
            <shiro:hasPermission name="sys:role:edit">]
                <td>
                    <a href="${ctx}/sys/role/outUserFromRole?id=${role.id}&userId=${user.id}"
                       onclick="return confirmx('确认要将用户<b>[${user.name}]</b>从<b>[${role.name}]</b>角色中移除吗？', this.href)">移除</a>
                </td>
            </shiro:hasPermission>
        </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>