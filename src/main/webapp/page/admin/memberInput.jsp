<%--
会员编辑
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=${param.roleType == 1 ? 1 : 0}" flush="true"/>

    <div class="page-content">

        <!-- BEGIN PAGE CONTAINER-->

        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">系统功能</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="/admin/member/index">${param.roleType == 1 ? "教师" : "学生" }信息</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">${param.roleType == 1 ? "教师" : "学生" }信息编辑</a></li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">

                <div class="span12">

                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-reorder"></i>${param.roleType == 1 ? "教师" : "学生" }基本信息</div>
                        </div>
                        <div class="portlet-body form">

                            <form action="/admin/member/save" class="form-horizontal" method="post">

                                <input type="hidden" name="id" value="${member.id}"/>
                                <input type="hidden" name="roleType" value="${param.roleType}"/>
                                <input type="hidden" name="status" value="${member.status}"/>

                                <div class="control-group">
                                    <label class="control-label">账号</label>
                                    <div class="controls">
                                        <input type="text" name="account" class="span6 m-wrap" value="${member.account}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">姓名</label>
                                    <div class="controls">
                                        <input type="text" name="name" class="span6 m-wrap" value="${member.name}">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">手机号码</label>
                                    <div class="controls">
                                        <input class="span6 m-wrap " name="phone" type="text" value="${member.phone}" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">邮箱</label>
                                    <div class="controls">
                                        <input class="span6 m-wrap " name="email" type="text" value="${member.email}" />
                                    </div>
                                </div>

                                <c:if test="${param.roleType == 2}">
                                    <div class="control-group">
                                        <label class="control-label">学籍</label>
                                        <div class="controls">
                                            <input class="m-wrap span6" name="schoolNo" type="text" value="${member.schoolNo}" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">学费</label>
                                        <div class="controls">
                                            <input class="m-wrap span6" name="tuition" type="text" value="${member.tuition}" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">班级</label>
                                        <div class="controls">
                                            <select class="m-wrap span6" name="clazz">
                                                <option value="">请选择</option>
                                                <c:forEach items="${clazzs}" var="item">
                                                    <option value="${item.dicKey}" ${member.clazz == item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">专业</label>
                                        <div class="controls">
                                            <select class="m-wrap span6" name="major">
                                                <option value="">请选择</option>
                                                <c:forEach items="${majors}" var="item">
                                                    <option value="${item.dicKey}"  ${member.major == item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">宿舍</label>
                                        <div class="controls">
                                            <select class="m-wrap span6" name="dormitory">
                                                <option value="">请选择</option>
                                                <c:forEach items="${dormitories}" var="item">
                                                    <option value="${item.dicKey}" ${member.dormitory == item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                </c:if>

                                <div class="form-actions">
                                    <button type="submit" class="btn blue">保存</button>
                                    <a class="btn" href="javascript:history.go(-1)">返回</a>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>

</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();
    });

</script>
</body>
</html>
