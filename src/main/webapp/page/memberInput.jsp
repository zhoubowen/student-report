<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<jsp:include page="nav.jsp?m=2"/>

<div class="page-container">

    <div class="space12">
        <div class="span3 sidebar-content ">
            <jsp:include page="memberProfileMenu.jsp?t=1"/>
        </div>

        <div class="span9 ">

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box blue" style="margin-top: 20px;">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-cogs"></i>个人信息修改</div>
                        </div>

                        <div class="portlet-body form">

                            <form action="/member/memberSave" class="form-horizontal" method="post">

                                <input type="hidden" name="id" value="${member.id}"/>
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

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id', {
                uploadJson : '/upload/uploadForEditor',
                fileManagerJson : '/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                filePostName : 'file'
            });

        });
        var editorAble = '${member.editorAble}';
        if(editorAble === '1'){
            $("input").attr("disabled", "disabled");
            $("select").attr("disabled", "disabled");
            $("[name='phone']").removeAttrs("disabled");
            $("[name='email']").removeAttrs("disabled");

        }
    });
    
    function doInfo(i) {
        switch(i)
        {
            case 1:
                window.location.href = "/member/info";
                break;
            case 2:
                window.location.href = "/member/supply?type=0";
                break;
            case 3:
                window.location.href = "/member/supply?type=1";
                break;
            case 4:
                window.location.href = "/comment/list";
                break;
            default:
                window.location.href = "/member/supply?type=0";
        }
    }
</script>

</body>
</html>
