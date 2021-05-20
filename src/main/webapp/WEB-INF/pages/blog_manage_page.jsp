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
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td>博客名</td>
                            <td>博客类型</td>
                            <td>创建时间</td>
                            <td>浏览量</td>
                            <td>Edit</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="blog" items="${blogs}" varStatus="status">
                            <tr>
                                <td><a href="/${current_user.email}/blog?id=${blog.id}">${blog.title}</a></td>
                                <td>${blog.type}</td>
                                <td>${blog.createTime.toLocaleString()}</td>
                                <td>${blog.views}</td>
                                <td><a href="/${current_user.email}/editBlog?id=${blog.id}" class="templatemo-edit-btn">Edit</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script src="/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script src="/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<script type="text/javascript" src="/js/templatemo-script.js"></script>      <!-- Templatemo Script -->

</body>
</html>