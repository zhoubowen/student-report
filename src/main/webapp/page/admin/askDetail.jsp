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
                            <a href="/admin/member/index">留言管理</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">留言详情</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>留言详情
                            </div>
                        </div>

                        <div class="portlet-body">

                            <div class="tabbable tabbable-custom">

                                <div class="tab-content">
                                    <div class="tab-pane active">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tbody>
                                                <tr class="odd gradeX">
                                                    <td class="hidden-480"><b>标题</b></td>
                                                    <td class="hidden-480">${ask.title}</td>
                                                </tr>
                                                <tr class="odd gradeX">
                                                    <td class="hidden-480"><b>内容</b></td>
                                                    <td class="hidden-480">${ask.descript}</td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><b>回复</b></td>
                                                </tr>
                                                <c:if test="${empty commentList}">
                                                    <tr><td colspan="2">暂无回复!</td></tr>
                                                </c:if>
                                                <c:forEach items="${commentList}" var="item">
                                                    <tr>
                                                        <td colspan="2">
                                                            ${item.content}   &nbsp;  --- <span class="media-heading">${item.memberName} <span><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <c:if test="${ask.createBy != sessionScope.memberId}">
                                            <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                            <div class="post-comment">
                                                <h4>我要回答</h4>
                                                <input type="hidden" name="askId" value="${ask.id}" />
                                                <textarea class="span10 m-wrap" rows="5" name="content"></textarea>
                                                <p>
                                                    <button class="btn blue" type="submit" onclick="addComment()">提交</button>
                                                    <a class="btn green"  href="javascript:history.go(-1);">返回</a>
                                                </p>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>


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
    <form id="modelDeleteForm" action="/admin/ask/update" method="post">
        <input type="hidden" name="id">
        <input type="hidden" name="deleted" value="1">
        <input type="hidden" name="status" value="${param.status}">
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
            $(this).find('input[name=id]').val(memberId);
        });
    });

    function doDelete() {
        $("#modelDeleteForm").submit();
    }


    function addComment() {
        $.post(
                "/comment/add",
                {
                    articleId: $("input[name=askId]").val(),
                    content : $("textarea[name=content]").val()
                },
                function(result){
                    if(result.success){
                        window.location.reload();
                    }
                    console.log(result);

                }
        );
    }

</script>
</body>
</html>
