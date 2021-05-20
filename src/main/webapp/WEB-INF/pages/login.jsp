<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>登陆博客</title>
    <link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="./Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="./Wopop_files/jquery.ui.all.css">

    <link href="/bootstrap3/css/bootstrap.css" rel="stylesheet" />

    <link href="/register/login-register.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <script src="/register/login-register.js" type="text/javascript"></script>

</head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
<%--<div class="login_logo"><img src="./Wopop_files/logo.png" width="196" height="46"></div>--%>
<div class="login_boder">

<div class="login_padding" id="login_model">
    <form:form action="/login.do" method="post" commandName="user" role="form">
        <h2>USERNAME</h2>
        <label>
            <input type="text" id="username" name="email" class="txt_input txt_input2" onfocus="if (value ==&#39;Your Email&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;Your Email&#39;}" value="Your Email">
        </label>
        <h2>PASSWORD</h2>
        <label>
            <input type="password" name="password" id="userpwd" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
        </label>

        <p class="forgot"><a id="iforget" href="javascript:void(0);" onclick="openRegisterModal();">没有账号，注册一个?</a></p>
        <div class="rem_sub">
            <%--<div class="rem_sub_l">--%>
                <%--&lt;%&ndash;<input type="checkbox" name="checkbox" id="save_me">&ndash;%&gt;--%>
                <%--<label >开始你的旅途-------------------></label>--%>
            <%--</div>--%>
            <label>
              <input type="submit" class="sub_button" name="button" id="button" value="SIGN-IN" style="opacity: 0.7;">
            </label>
        </div>
    </form:form>
</div>

    <div class="modal fade login" id="loginModal">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Login with</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                            <div class="error"></div>
                            <div class="form loginBox">
                                <form method="post" action="/login.do" accept-charset="UTF-8">
                                    <input class="form-control" type="text" placeholder="Email" name="email">
                                    <input class="form-control" type="password" placeholder="Password" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="Login" onclick="loginAjax()">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">
                                <form:form action="/register.do" commandName="user" method="post" role="form" onsubmit="return check_password();">
                                    <input id="name" class="form-control" type="text" placeholder="昵称" name="nickname">
                                    <input id="email" class="form-control" type="text" placeholder="Email" name="email">
                                    <input id="password" class="form-control" type="password" placeholder="密码" name="password">
                                    <input id="password_confirmation" class="form-control" type="password" placeholder="重复密码" onchange="check_password()">
                                    <input class="btn btn-default btn-register" type="submit" value="创建您的账号" name="commit">
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    function check_password() {
        var pwd = document.getElementById("password").value;
        var c_pwd = document.getElementById("confirm_password").value;
        //alert("hahha");
        //alert(pwd + " " + c_pwd);
        if(pwd != c_pwd){
            alert("两次密码输入不一致");
            return false;
        }
        return true;
    }

</script>


</html>


