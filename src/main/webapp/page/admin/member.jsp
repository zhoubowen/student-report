
<%--学生,教师管理列表--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <c:choose>
        <c:when test="${empty loginRoleType}">
            <jsp:include page="menu.jsp?m=${param.roleType == 1 ? 1 : 0 }" flush="true"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="menu.jsp?m=5" flush="true"/>
        </c:otherwise>
    </c:choose>

    <div class="page-content">

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
                        <li><a href="#">${param.roleType == 1 ? "教师" : "学生" }列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption"><i class="icon-globe"></i>${param.roleType == 1 ? "教师" : "学生" }列表</div>
                        </div>

                        <div class="portlet-body">
                            <%--<a class="btn green" href="/admin/member/input?roleType=${param.roleType}">添加</a>--%>
                            <%--<hr/>--%>
                            <div class="tabbable tabbable-custom">
                                <ul class="nav nav-tabs">
                                    <c:if test="${empty loginRoleType}">
                                        <li class="${param.status == 1 ? 'active' : ''}"><a href="/admin/member/index?roleType=${param.roleType}&status=1">审核通过</a></li>
                                        <li class="${param.status == 0 ? 'active' : ''}"><a href="/admin/member/index?roleType=${param.roleType}&status=0">待审核</a></li>
                                    </c:if>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>姓名</th>
                                                <c:if test="${param.roleType == 2}">
                                                    <th class="hidden-480">班级</th>
                                                    <th class="hidden-480">专业</th>
                                                    <th class="hidden-480">宿舍</th>
                                                    <th class="hidden-480">学费(元)</th>
                                                    <th class="hidden-480">学籍</th>
                                                </c:if>
                                                <th class="hidden-480">邮箱</th>
                                                <th class="hidden-480">联系电话</th>
                                                <th >操作</th>
                                            </tr>

                                            </thead>

                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <tr class="odd gradeX">
                                                    <td>${item.name}</td>
                                                    <c:if test="${param.roleType == 2}">
                                                        <td>${item.clazzDic.dicValue}</td>
                                                        <td>${item.majorDic.dicValue}</td>
                                                        <td>${item.dormitoryDic.dicValue}</td>
                                                        <td class="hidden-480">${item.tuition}</td>
                                                        <td class="hidden-480">${item.schoolNo}</td>
                                                    </c:if>
                                                    <td class="hidden-480">${item.email}</td>
                                                    <td class="hidden-480">${item.phone}</td>
                                                    <td >
                                                    <%--<a class="btn red" data-toggle = "modal" data-id= "${item.id}" data-target="#static">删除</a>--%>
                                                        <c:if test="${param.status == 0}">
                                                            <a class="btn green" href="/admin/member/save?id=${item.id}&roleType=${item.roleType}&status=1">审核通过</a>
                                                        </c:if>

                                                        <c:if test="${param.status == 1}">
                                                            <a class="btn green" href="/admin/member/input?memberId=${item.id}&roleType=${item.roleType}&loginRoleType=${loginRoleType}">修改</a>
                                                            <c:if test="${!empty loginRoleType}">
                                                                <a class="btn bulue" data-toggle = "modal" data-id= "${item.id}" data-status= "${item.status}" data-target="#static">修改密码</a>
                                                            </c:if>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <%@include file="pagination.jsp"%>


                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<div id="static" class="modal hide fade" tabindex="-1">
    <form id="modelDeleteForm" action="/admin/member/save" method="post">
        <div class="modal-body form form-horizontal">
            <div class="control-group">
                <label class="control-label">新密码</label>
                <div class="controls">
                    <input type="password" name="password" class=" m-wrap" value="">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">确认密码</label>
                <div class="controls">
                    <input type="password" name="repassword" class=" m-wrap" value="">
                </div>
            </div>
        </div>
        <input type="hidden" name="id">
        <input type="hidden" name="status">
        <input type="hidden" name="roleType" value="${param.roleType}">
        <input type="hidden" name="loginRoleType" value="${param.loginRoleType}">
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">否</button>
            <button type="button" data-dismiss="modal" class="btn green" onclick="doDelete()">是</button>
        </div>
    </form>
</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();
        $('#static').on('show.bs.modal', function (event) {
            var btnThis = $(event.relatedTarget); //触发事件的按钮
            var memberId = btnThis.data("id");
            var status = btnThis.data("status");
            $(this).find('input[name=id]').val(memberId);
            $(this).find('input[name=status]').val(status);
        });


        $("input[name ='repassword']").blur(function () {
            var password = $("input[name='password']").val();
            var repassword = $("input[name ='repassword']").val();
            if(!password || !repassword){
                alert("密码,确认密码必填");
                $('#static').modal('show');
                return;
            }
            if(repassword != password){
                alert("两次输入密码不一致,请重新输入!");
                return;
            }
        });

    });

    function doDelete() {
        var password = $("input[name='password']").val();
        var repassword = $("input[name ='repassword']").val();
        if(!password || !repassword){
            alert("密码,确认密码必填");
            $('#static').modal('show');
            return;
        }
        if(repassword != password){
            alert("两次输入密码不一致,请重新输入!");
            return;
        }
        $("#modelDeleteForm").submit();
    }


</script>
</body>
</html>
