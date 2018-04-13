<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=2" flush="true"/>

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
                            <a href="/admin/member/index">留言信息</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">留言列表</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption"><i class="icon-globe"></i>留言列表</div>
                        </div>

                        <div class="portlet-body">
                            <div class="tabbable tabbable-custom">
                                <ul class="nav nav-tabs">
                                    <li class="${param.status == 1 ? 'active' : ''}"><a href="/admin/comment/index?status=1">审核通过</a></li>
                                    <li class="${param.status == 0 ? 'active' : ''}"><a href="/admin/comment/index?status=0">待审核</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>留言内容</th>
                                                <th class="hidden-480">留言者</th>
                                                <th class="hidden-480">审核状态</th>
                                                <th class="hidden-480">留言时间</th>
                                                <th class="hidden-480">回复状态</th>
                                                <th >操作</th>
                                            </tr>

                                            </thead>

                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <tr class="odd gradeX">
                                                    <td>${item.content}</td>
                                                    <td>${item.commentMember.name}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item.status == 0}">
                                                                待审核
                                                            </c:when>
                                                            <c:when test="${item.status == 1}">
                                                                审核通过
                                                            </c:when>
                                                            <c:otherwise>审核拒绝</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td>
                                                        ${item.replyContent ? "已回复" : "未回复"}
                                                    </td>
                                                    <td >
                                                        <c:if test="${param.status == 0}">
                                                            <a class="btn green" href="/admin/member/save?id=${item.id}&status=1">审核通过</a>
                                                        </c:if>

                                                        <c:if test="${param.status == 1}">
                                                            <a class="btn green" href="/admin/member/input?memberId=${item.id}">去回复</a>
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


<div id="static" class="modal hide fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-body">
        <p>是否确定删除?</p>
    </div>
    <form id="modelDeleteForm" action="/admin/member/delete" method="post">
        <input type="hidden" name="memberId">
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
            $(this).find('input[name=memberId]').val(memberId);
        });

    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }

</script>
</body>
</html>
