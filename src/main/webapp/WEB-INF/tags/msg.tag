<%@tag language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@attribute name="msgObj"
             required="true" type="com.tanzhouedu.pm.common.Msg"  %>
<script type="text/javascript">top.$.jBox.closeTip();</script>
<c:if test="${not empty msgObj}">
    <c:if test="${not empty msgObj.content && not empty msgObj.type}">
        <div id="messageBox" class="alert alert-${msgObj.type} hide">
            <button data-dismiss="alert" class="close">x</button>
                ${msgObj.content}
        </div>
        <script type="text/javascript" language="JavaScript">
            console.log($("#messageBox"));
            $("#messageBox").show();
        </script>
    </c:if>
</c:if>
