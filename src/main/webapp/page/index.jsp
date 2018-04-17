<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=${param.status == 1 ? 1 : 0}" flush="true"/>
<div class="page-container row-fluid">

    <div class="row-fluid">

        <div class="span12">
            <div class="portlet box light-grey">

                <div class="portlet-body">
                    <div class="tabbable tabbable-custom">
                        <div class="tab-content">
                            <div class="tab-pane active">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>留言内容</th>
                                        <th class="hidden-480">留言者</th>
                                        <th class="hidden-480">留言时间</th>
                                        <th class="hidden-480">回复内容</th>
                                    </tr>

                                    </thead>

                                    <tbody>
                                    <c:forEach var="item" items="${list}">
                                        <tr class="odd gradeX">
                                            <td>${item.content}</td>
                                            <td>${item.commentMember.name}</td>
                                            <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td>
                                                    ${empty item.replyContent ? "未回复" : item.replyContent}
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

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
    });
</script>

</body>
</html>
