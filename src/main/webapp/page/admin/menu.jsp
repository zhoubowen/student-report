<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-sidebar nav-collapse collapse">
    <ul class="page-sidebar-menu">
        <li>
            <div class="sidebar-toggler hidden-phone"></div>
        </li>

        <c:choose>
            <c:when test="${sessionScope.roleType == 0}">
                <li class="start active ">
                    <a href="javascript:;">
                        <i class="icon-cogs"></i>
                        <span class="title">系统功能</span>
                        <span class="selected"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="${param.m == 0 ? 'active' : '' }"><a href="/admin/member/index?roleType=2&status=1">学生管理</a></li>
                        <li class="${param.m == 1 ? 'active' : '' }"><a href="/admin/member/index?roleType=1&status=1">教师管理</a></li>
                        <li class="${param.m == 2 ? 'active' : '' }"><a href="/admin/comment/index?status=1">留言管理</a></li>
                    </ul>
                </li>
            </c:when>
            <c:when test="${sessionScope.roleType == 1}">
                <li class="start active ">
                    <a href="javascript:;">
                        <i class="icon-cogs"></i>
                        <span class="title">系统功能</span>
                    </a>
                    <ul class="sub-menu">
                        <li class="${param.m == 5 ? 'active' : '' }"><a href="/admin/member/index?roleType=2&status=1&loginRoleType=1">学生管理</a></li>
                        <li class="${param.m == 2 ? 'active' : '' }"><a href="/admin/comment/index?status=1">留言管理</a></li>
                        <li class="${param.m == 4 ? 'active' : '' }"><a href="/admin/notice/index?type=2">公告管理</a></li>
                    </ul>
                </li>
            </c:when>
        </c:choose>

    </ul>

</div>

