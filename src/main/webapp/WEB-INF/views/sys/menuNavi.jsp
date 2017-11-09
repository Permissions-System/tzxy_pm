<%@page pageEncoding="utf-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="accordion" id="menu-${param.parentId}">
  <c:set var="menuList" value="${pm:getMenuList()}" />
  <c:set var="first" value="true" />
  <c:forEach items="${menuList}" var="menu">
    <c:if test="${menu.parent.id eq param.parentId && menu.isShow eq '1'}" >
      <div class="accordion-group">
        <div class="accordion-heading">
          <a class="accordion-toggle" data-toggle="collapse" data-parent="#menu-${param.parentId}"
             data-href="#collapse-${menu.id}" href="#collapse-${menu.id}" title="${menu.remarks}">
            <i class="icon-chevron-${first ? 'down' : 'right'}"></i>&nbsp;${menu.name}
          </a>
        </div>
        <div id="collapse-${menu.id}" class="accordion-body ${first ? 'in' : ''} collapse">
          <div class="accordion-inner">
            <ul class="nav nav-list">
              <c:forEach items="${menuList}" var="menu2" >
                <c:if test="${menu2.parent.id eq menu.id && menu2.isShow eq '1'}">
                  <li>
                    <a data-href=".menu3-${menu2.id}" href="${ctx}${menu2.href}"
                       target="${empty menu2.target ? 'mainFrame' : menu2.target}">
                      <i class="icon-${menu2.icon}"></i>&nbsp;${menu2.name}
                    </a>
                    <ul class="nav nav-list hide" style="margin:0;padding-right:0;">
                      <c:forEach items="${menuList}" var="menu3">
                        <c:if test="${menu3.parent.id eq menu2.id && menu3.isShow eq '1'}">
                        <li class="menu3-${menu3.id} hide">
                          <a data-href=".menu3-${menu3.id}" href="${ctx}${menu3.href}"
                             target="${empty menu3.target ? 'mainFrame' : menu3.target}">
                            <i class="icon-${menu3.icon}"></i>&nbsp;${menu3.name}
                          </a>
                        </li>
                        </c:if>
                      </c:forEach>
                    </ul>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
        <c:set var="first" value="false" />
      </div>
    </c:if>
  </c:forEach>
</div>
