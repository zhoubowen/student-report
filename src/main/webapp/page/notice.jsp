<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=3" flush="true"/>
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
                                        <th>通知标题</th>
                                        <th>通知内容</th>
                                        <th class="hidden-480">发布者</th>
                                        <th class="hidden-480">发布时间</th>
                                    </tr>

                                    </thead>

                                    <tbody>
                                    <c:forEach var="item" items="${list}">
                                        <tr class="odd gradeX">
                                            <td>${item.title}</td>
                                            <td>${item.content}</td>
                                            <td>${item.member.name}</td>
                                            <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
