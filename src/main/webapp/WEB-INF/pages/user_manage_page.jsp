<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2016/11/28
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${current_user.email}的个人页面</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <%--<link href="/css/font-awesome.min.css" rel="stylesheet">--%>
    <%--<link href="/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="/css/templatemo-style.css" rel="stylesheet">

    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="/media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <link href="/media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

    <link href="/media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <link href="/media/css/style-metro.css" rel="stylesheet" type="text/css"/>

    <link href="/media/css/style.css" rel="stylesheet" type="text/css"/>

    <link href="/media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

    <link href="/media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

    <link href="/media/css/uniform.default.css" rel="stylesheet" type="text/css"/>



    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="/media/css/select2_metro.css" />

    <link rel="stylesheet" href="/media/css/DT_bootstrap.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/bootstrap-fileupload.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/jquery.gritter.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/chosen.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/jquery.tagsinput.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/clockface.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/bootstrap-wysihtml5.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/datepicker.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/timepicker.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/colorpicker.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/bootstrap-toggle-buttons.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/daterangepicker.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/datetimepicker.css" />

    <link rel="stylesheet" type="text/css" href="/media/css/multi-select-metro.css" />

    <link href="/media/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>

    <!-- END PAGE LEVEL STYLES -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <end if!-->
</head>
<body>

<div id="stack1" class="modal hide fade" tabindex="-1" data-focus-on="input:first">

    <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

        <h3>编辑用户信息</h3>

    </div>

    <div class="modal-body">

        <div class="row-fluid">

            <div class="span12">

                <!-- BEGIN SAMPLE FORM PORTLET-->

                    <div class="portlet-body form">

                        <!-- BEGIN FORM-->

                        <form action="#" class="form-horizontal">

                            <div class="control-group">

                                <label class="control-label">昵称</label>

                                <div class="controls">

                                    <input id="set-name" type="text" class="span6 m-wrap" />

                                    <%--<span class="help-inline">设置用户昵称</span>--%>

                                </div>

                            </div>

                            <div class="control-group">

                                <label class="control-label">Email</label>

                                <div class="controls">

                                    <input id="set-email" type="text" class="span6 m-wrap" />

                                    <%--<span class="help-inline">设置用户邮箱</span>--%>

                                </div>

                            </div>

                            <div class="control-group">

                                <label class="control-label">性别</label>

                                <div class="controls">

                                    <select data-placeholder="Your Favorite Type of Bear" class="chosen-with-diselect span6" tabindex="-1" id="set-sex">

                                        <option value="man">男</option>

                                        <option value="woman">女</option>

                                        <option value="secret">保密</option>

                                    </select>

                                </div>

                            </div>

                            <div class="control-group">

                                <label class="control-label">权限</label>

                                <div class="controls">

                                    <select data-placeholder="Your Favorite Type of Bear" class="chosen-with-diselect span6" tabindex="-1" id="set-pro">
                                        <option value="0">用户</option>
                                        <option value="1">管理员</option>
                                    </select>

                                </div>

                            </div>

                        </form>

                        <!-- END FORM-->

                    </div>

                </div>

                <!-- END SAMPLE FORM PORTLET-->

            </div>

    </div>

    <div class="modal-footer">

        <button type="button" data-dismiss="modal" class="btn">Close</button>

        <button type="button" onclick="submit()" class="btn red">Ok</button>

    </div>

</div>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="personal_left.jsp"></jsp:include>

    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">Admin panel</a></li>
                        <%--<li><a href="">Dashboard</a></li>--%>
                        <%--<li><a href="">Overview</a></li>--%>
                        <%--<li><a href="login.html">Sign in form</a></li>--%>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-widget no-padding">
            <div class="row-fluid">

                <div class="span12">

                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">

                        <div class="portlet-title">

                            <div class="caption"><i class="icon-edit"></i>用户列表</div>

                            <div class="tools">

                                <a href="javascript:;" class="collapse"></a>

                            </div>

                        </div>

                        <div class="portlet-body">

                            <div class="clearfix">

                                <div class="btn-group">

                                </div>

                            </div>

                            <table class="table table-striped table-hover table-bordered" id="sample_editable_1">

                                <thead>

                                <tr>

                                    <th>昵称</th>

                                    <th>Email</th>

                                    <th>性别</th>

                                    <th>权限</th>

                                    <th>Edit</th>

                                </tr>

                                </thead>

                                <tbody>
                                <c:forEach items="${users}" var="u" varStatus="status">
                                    <tr class="">

                                        <td id="nickname-${u.id}">${u.nickname}</td>

                                        <td id="email-${u.id}">${u.email}</td>

                                        <td id="sex-${u.id}">
                                            <c:choose>
                                                <c:when test="${u.sex == 'man'}">男</c:when>
                                                <c:when test="${u.sex == 'woman'}">女</c:when>
                                                <c:otherwise>保密</c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td id="pro-${u.id}" class="center">
                                            <c:choose>
                                                <c:when test="${u.privilege == 1}">管理员</c:when>
                                                <c:otherwise>用户</c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td><button class="btn blue btn-block" onclick="onEditClick(${u.id})">Edit</button></td>


                                    </tr>
                                </c:forEach>

                                </tbody>

                            </table>

                        </div>

                    </div>

                    <!-- END EXAMPLE TABLE PORTLET-->

                </div>

            </div>
        </div>
    </div>
</div>



<!-- JS -->

<script>


</script>
<script type="text/javascript" src="/js/templatemo-script.js"></script>      <!-- Templatemo Script -->

<!-- END FOOTER -->

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

<!-- BEGIN CORE PLUGINS -->

<script src="/media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

<script src="/media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

<script src="/media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>

<script src="/media/js/bootstrap.min.js" type="text/javascript"></script>

<!--[if lt IE 9]>

<script src="/media/js/excanvas.min.js"></script>

<script src="/media/js/respond.min.js"></script>

<![endif]-->

<script src="/media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

<script src="/media/js/jquery.blockui.min.js" type="text/javascript"></script>

<script src="/media/js/jquery.cookie.min.js" type="text/javascript"></script>

<script src="/media/js/jquery.uniform.min.js" type="text/javascript" ></script>

<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->

<script type="text/javascript" src="/media/js/select2.min.js"></script>

<script type="text/javascript" src="/media/js/jquery.dataTables.js"></script>

<script type="text/javascript" src="/media/js/DT_bootstrap.js"></script>

<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="/media/js/bootstrap-modal.js" type="text/javascript" ></script>

<script src="/media/js/bootstrap-modalmanager.js" type="text/javascript" ></script>

<!-- END PAGE LEVEL PLUGINS -->


<!-- BEGIN PAGE LEVEL SCRIPTS -->

<script src="/media/js/app.js"></script>

<script src="/media/js/table-editable.js"></script>

<script src="/media/js/form-components.js"></script>

<script>
    var setId = 0;
    jQuery(document).ready(function() {

        App.init();

        TableEditable.init();
        FormComponents.init();

    });

    function submit() {
        $.ajax({
            url : '/userManage.do',
            method : 'POST',
            data : {
                'userId':setId,
                'nickname':document.getElementById('set-name').value,
                'sex':document.getElementById('set-sex').value,
                'email':document.getElementById('set-email').value,
                'privilege':document.getElementById('set-pro').value
            },
            success : function(data) {
                if(data.wrongId != 0) {
                    switch (data.wrongId) {
                        case data.NOT_ADMIN:alert('没有操作权限');break;
                        case data.CANNOT_FIND_USER:alert('无此用户，无法修改');break;
                        case data.CANNOT_SET_MINE:alert('不能用管理员权限操作自己');break;
                        case data.NICK_NAME_EMPTY:alert('不能有空');break;
                    }
                }
                else {
                    document.getElementById("nickname-" + data.user.id).innerHTML = data.user.nickname;
                    document.getElementById("email-" + data.user.id).innerHTML = data.user.email;
                    var sex;
                    if(data.user.sex == 'man')
                            sex = '男'
                    else if(data.user.sex == 'woman')
                            sex = '女'
                    else
                            sex = '保密'
                    document.getElementById("sex-" + data.user.id).innerText = sex
                    var pri;
                    if(data.user.privilege == 1)
                            pri = "管理员"
                    else
                            pri = "用户"
                    document.getElementById("pro-" + data.user.id).innerText = pri;
                    alert('操作成功！')
                    $('#stack1').modal('hide');
                }
            },
            error :function() {
                alert('网络链接错误');
            }
        });
    }


    function onEditClick(id) {
        setId = id
        var nickname = document.getElementById("nickname-" + id).innerHTML
        var email = document.getElementById("email-" + id).innerHTML
        var sex = document.getElementById("sex-" + id).innerText
        if(sex == '男')
                sex = 'man'
        else if(sex == '女')
                sex = 'woman'
        else
                sex = 'secret'
        var pro = document.getElementById("pro-" + id).innerText
        if(pro == '管理员')
                pro = 1
        else
                pro = 0
        document.getElementById("set-name").value = nickname
        document.getElementById("set-email").value = email
        document.getElementById("set-sex").value = sex
        document.getElementById("set-pro").value = pro
        $('#stack1').modal('show');
    }

</script>


</body>
</html>