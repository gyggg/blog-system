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
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <end if!-->
</head>
<body>
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
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget white-bg">
                <h2 class="margin-bottom-10">个人信息</h2>
                <p>你可以在这里进行个人信息配置.</p>
                <div  class="templatemo-login-form" enctype="multipart/form-data">
                     <div class="row form-group">
                        <div class="col-lg-6 col-md-6 form-group" id="nicknameDiv">
                            <label for="inputUsername">昵称</label>
                            <input type="text" class="form-control" id="inputUsername" value="${current_user.nickname}">
                        </div>
                        <div class="col-lg-6 col-md-6 form-group">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" id="inputEmail" placeholder="${current_user.email}"  readonly="true">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-6 col-md-6 form-group" id="currentPasswordDiv">
                            <label for="inputCurrentPassword">当前密码</label>
                            <input type="password" class="form-control highlight" id="inputCurrentPassword" placeholder="*********************">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-6 col-md-6 form-group">
                            <label for="inputNewPassword">新密码</label>
                            <input type="password" class="form-control" id="inputNewPassword">
                        </div>
                        <div class="col-lg-6 col-md-6 form-group" id="confirmPasswordDiv">
                            <label for="inputConfirmNewPassword">确认密码</label>
                            <input type="password" class="form-control" id="inputConfirmNewPassword">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-12 form-group">
                            <label class="control-label" for="inputNote">个人描述</label>
                            <textarea class="form-control" id="inputNote" rows="3">${current_user.userDescribe}</textarea>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-6 col-md-6 form-group">
                            <label class="control-label templatemo-block">Single Selection Control</label>
                            <select class="form-control" id="sex">
                                <option value="man"<c:if test="${current_user.sex == 'man'}"> selected="selected" </c:if>>男</option>
                                <option value="woman"<c:if test="${current_user.sex == 'woman'}"> selected="selected" </c:if>>女</option>
                                <option value="secret"<c:if test="${current_user.sex == 'secret' || current_user.sex == '' || current_user.sex == null}"> selected="selected" </c:if>>保密</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group text-right">
                        <button onclick="updateMessage()" class="templatemo-blue-button">提交</button>
                        <button type="reset" class="templatemo-white-button">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- JS -->
<script src="/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script src="/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<script>
    <c:choose>
    <c:when test="${current_user.sex == 'men'}">

    </c:when>
    </c:choose>
    function updateMessage() {
        $.ajax({
            url:'/updateUser.do',
            type:'POST',
            data:{
                'nickname':document.getElementById('inputUsername').value,
                'currentPassword':document.getElementById('inputCurrentPassword').value,
                'newPassword':document.getElementById('inputNewPassword').value,
                'confirmPassword':document.getElementById('inputConfirmNewPassword').value,
                'userDescribe':document.getElementById('inputNote').value,
                'sex':document.getElementById('sex').value,
                'userId':${current_user.id}
            },
            success : function(data) {
                if(data.wrongId != 0) {
                    document.getElementById('currentPasswordDiv').setAttribute('class', 'col-lg-6 col-md-6 form-group')
                    document.getElementById('confirmPasswordDiv').setAttribute('class', 'col-lg-6 col-md-6 form-group')
                    document.getElementById('nicknameDiv').setAttribute('class', 'col-lg-6 col-md-6 form-group');
                    if(data.wrongId == data.CURRENT_PASSWORD_WRONG) {
                        alert('当前密码错误')
                        document.getElementById('currentPasswordDiv').setAttribute('class', 'col-lg-6 col-md-6 form-group has-error')
                    }
                    if(data.wrongId == data.PASSWORD_NOT_SAME){
                        alert('两次密码输入不一样')
                        document.getElementById('confirmPasswordDiv').setAttribute('class', 'col-lg-6 col-md-6 form-group has-error')
                    }
                    if(data.wrongId == data.NICK_NAME_EMPTY) {
                        alert('昵称不能为空')
                        document.getElementById('nicknameDiv').setAttribute('class', 'col-lg-6 col-md-6 form-group has-error');
                    }
                }
                else {
                    alert('修改成功');
                    window.location.reload();
                }
            },
            error : function() {
                alert('网络链接错误，请重试。')
            }
        })
    }
</script>
<script type="text/javascript" src="/js/templatemo-script.js"></script>      <!-- Templatemo Script -->

</body>
</html>