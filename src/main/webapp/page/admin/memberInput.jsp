<%--
会员编辑
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
                                <input type="hidden" name="loginRoleType" value="${param.loginRoleType}"/>

                                <%--<div class="control-group">--%>
                                    <%--<label class="control-label">账号</label>--%>
                                    <%--<div class="controls">--%>
                                        <%--<input type="text" name="account" class="span6 m-wrap" value="${member.account}">--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="control-group">--%>
                                    <%--<label class="control-label">姓名</label>--%>
                                    <%--<div class="controls">--%>
                                        <%--<input type="text" name="name" class="span6 m-wrap" value="${member.name}">--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="control-group">--%>
                                    <%--<label class="control-label">手机号码</label>--%>
                                    <%--<div class="controls">--%>
                                        <%--<input class="span6 m-wrap " name="phone" type="text" value="${member.phone}" />--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="control-group">--%>
                                    <%--<label class="control-label">邮箱</label>--%>
                                    <%--<div class="controls">--%>
                                        <%--<input class="span6 m-wrap " name="email" type="text" value="${member.email}" />--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <c:if test="${param.roleType == 2}">
                                    <c:if test="${ empty param.loginRoleType}">
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <div class="control-group">
                                                <label class="control-label">学费</label>
                                                <div class="controls">
                                                    <input class="m-wrap " name="tuition" type="text" value="${member.tuition}" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span6">
                                            <div class="control-group">
                                                <label class="control-label">专业</label>
                                                <div class="controls">
                                                    <select class="m-wrap" name="major">
                                                        <option value="">请选择</option>
                                                        <c:forEach items="${majors}" var="item">
                                                            <option value="${item.dicKey}"  ${member.major == item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%--<div class="control-group">--%>
                                        <%--<label class="control-label">学籍</label>--%>
                                        <%--<div class="controls">--%>
                                            <%--<input class="m-wrap span6" name="schoolNo" type="text" value="${member.schoolNo}" />--%>
                                        <%--</div>--%>
                                    <%--</div>--%>



                                        <%--<div class="control-group">--%>
                                            <%--<label class="control-label">班级</label>--%>
                                            <%--<div class="controls">--%>
                                                <%--<select class="m-wrap span6" name="clazz">--%>
                                                    <%--<option value="">请选择</option>--%>
                                                    <%--<c:forEach items="${clazzs}" var="item">--%>
                                                        <%--<option value="${item.dicKey}" ${member.clazz == item.dicKey ? "selected" : ""}>${item.dicValue}</option>--%>
                                                    <%--</c:forEach>--%>
                                                <%--</select>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>






                                </c:if>


                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">姓名</label>
                                            <div class="controls">
                                                <input type="text" name="name" class=" m-wrap" value="${member.name}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">邮箱</label>
                                            <div class="controls">
                                                <input type="text" name="email" class=" m-wrap" value="${member.email}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">手机号码</label>
                                            <div class="controls">
                                                <input type="text" name="phone" class=" m-wrap" value="${member.phone}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">性别</label>
                                            <div class="controls">
                                                <select>
                                                    <option value="0">男</option>
                                                    <option value="1">女</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">身份证</label>
                                            <div class="controls">
                                                <input type="text" name="idCard" class=" m-wrap" value="${member.idCard}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">学校名称</label>
                                            <div class="controls">
                                                <input type="text" name="schoolName" class=" m-wrap" value="${member.schoolName}">
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">民族</label>
                                            <div class="controls">
                                                <input type="text" name="minority" class=" m-wrap" value="${member.minority}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">学历类型</label>
                                            <div class="controls">
                                                <select name="eduType">
                                                    <option value="0">普通</option>
                                                    <option value="1">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">班级</label>
                                            <div class="controls">
                                                <select class="m-wrap" name="clazz">
                                                    <option value="">请选择</option>
                                                    <c:forEach items="${clazzs}" var="item">
                                                        <option value="${item.dicKey}" ${member.clazz == item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">宿舍</label>
                                            <div class="controls">
                                                <select class="m-wrap " name="dormitory">
                                                    <option value="">请选择</option>
                                                    <c:forEach items="${dormitories}" var="item">
                                                        <option value="${item.dicKey}" ${member.dormitory == item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">学习形式</label>
                                            <div class="controls">
                                                <select name="eduWay">
                                                    <option value="0">普通全日制</option>
                                                    <option value="1">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">出生日期</label>
                                            <div class="controls">
                                                <input type="text" name="birthday" class=" m-wrap" value="<fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd"/>" id="birthday" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">学制</label>
                                            <div class="controls">
                                                <input type="text" name="schooling" class=" m-wrap" value="${member.schooling}" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">层次</label>
                                            <div class="controls">
                                                <select name="arrangement">
                                                    <option value="0">本科</option>
                                                    <option value="1">专科</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">入学时间</label>
                                            <div class="controls">
                                                <input type="text" name="schooleJoin" class=" m-wrap" value="<fmt:formatDate value="${member.schooleJoin}" pattern="yyyy-MM-dd"/>"  id="schooleJoin" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">预计毕业时间</label>
                                            <div class="controls">
                                                <input type="text" name="graduationTime" class=" m-wrap" value="<fmt:formatDate value="${member.graduationTime}" pattern="yyyy-MM-dd"/>"  id="graduationTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">学号</label>
                                            <div class="controls">
                                                <input type="text" name="schoolNo" class=" m-wrap" value="${member.schoolNo}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">学籍状态</label>
                                            <div class="controls">
                                                <select name="schoolStatus">
                                                    <option value="0">在籍</option>
                                                    <option value="1">毕业</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>



        <c:if test="${param.roleType == 1}">
        <div class="row-fluid">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">工号</label>
                    <div class="controls">
                        <input type="text" name="schoolNo" class=" m-wrap" value="${member.schoolNo}">
                    </div>
                </div>
            </div>

            <div class="span6">
                <div class="control-group">
                    <label class="control-label">职称</label>
                    <div class="controls">
                        <select class="m-wrap" name="positional">
                            <option value="">请选择</option>
                            <c:forEach items="${positionals}" var="item">
                                <option value="${item.dicKey}"  ${member.positional== item.dicKey ? "selected" : ""}>${item.dicValue}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
        </div>


    <div class="row-fluid">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">姓名</label>
                <div class="controls">
                    <input type="text" name="name" class=" m-wrap" value="${member.name}">
                </div>
            </div>
         </div>

        <div class="span6">
            <div class="control-group">
            <label class="control-label">邮箱</label>
                <div class="controls">
                 <input type="text" name="email" class=" m-wrap" value="${member.email}">
                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">手机号码</label>
                <div class="controls">
                    <input type="text" name="phone" class=" m-wrap" value="${member.phone}">
                </div>
            </div>
        </div>

    <div class="span6">
    <div class="control-group">
    <label class="control-label">性别</label>
    <div class="controls">
    <select>
    <option value="0">男</option>
    <option value="1">女</option>
    </select>
    </div>
    </div>
    </div>

    </div>


    <div class="row-fluid">
        <div class="span6">
        <div class="control-group">
        <label class="control-label">身份证</label>
        <div class="controls">
        <input type="text" name="idCard" class=" m-wrap" value="${member.idCard}">
        </div>
        </div>
        </div>

        <div class="span6">
        <div class="control-group">
        <label class="control-label">学校名称</label>
        <div class="controls">
        <input type="text" name="schoolName" class=" m-wrap" value="${member.schoolName}">
        </div>
        </div>
        </div>

        </div>


            <div class="row-fluid">
                <div class="span6">
                    <div class="control-group">
                        <label class="control-label">主干课程</label>
                        <div class="controls">
                            <input type="text" name="curriculum" class=" m-wrap" value="${member.curriculum}">
                        </div>
                    </div>
                </div>

                <div class="span6">
                    <div class="control-group">
                        <label class="control-label">地址</label>
                        <div class="controls">
                            <input type="text" name="address" class=" m-wrap" value="${member.address}">
                        </div>
                    </div>
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

        $("select[name='dormitory']").change(function () {
            var dormitory = $(this).val();
            $.get(
                    "/admin/member/sumDormitory",
                    {"dormitory": dormitory},
                    function (data) {
                        if(data > 4){
                            alert("当前寝室已住满4人,请重新选择!");
                        }
                    }
            );
        });
    });

</script>
</body>
</html>
