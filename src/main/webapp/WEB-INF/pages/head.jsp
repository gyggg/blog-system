<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2016/11/25
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="/css/buttons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/font-awesome/css/font-awesome.css">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="/css/templatemo_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/editormd/css/editormd.preview.css" />
<link rel="stylesheet" href="/css/home_zerogrid.css">
<link rel="stylesheet" href="/css/home_style.css">
<link rel="stylesheet" href="/css/home_component.css">
<link rel="stylesheet" href="/css/home_responsive.css">

<header>

        <c:choose>
            <c:when test="${empty current_user}">
                <div class="templatemo-header">
                    <div class="container">
                        <div class="col-md-12">
                                <%--<h1 class="logo pull-left">Logo</h1>--%>
                            <form:form action="/loginInPage.do" method="post" id = "head-login" class="form-inline pull-right" commandName="user" role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-envelope-o"></i></div>
                                        <input class="form-control" name="email" required="required" type="text" placeholder="Enter email">
                                    </div>
                                </div>
                                <div class="form-group">
                                        <%--<label class="sr-only" for="password">Password</label>--%>
                                    <input type="password" name="password" class="form-control" required="required" id="password" placeholder="Password">
                                    <div class="checkbox">
                                        <label class="font-size-small">
                                                <%--<input type="checkbox"> Remember me--%>
                                        </label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-default">Sign in</button>
                            </form:form>
                        </div> <!-- col-md-12 -->
                    </div> <!-- container -->
                </div>
            </c:when>
            <c:otherwise>
                <div class="top-header">
                    <div class="wrap-top zerogrid">
                        <div class="row">
                            <div class="top-social">
                                <a href="#"><img src="/images/home_facebook.png" title="facebook"/></a>
                                <a href="#"><img src="/images/home_twitter.png" title="twitter"/></a>
                                <a href="#"><img src="/images/home_google.png" title="google"/></a>
                                <a href="#"><img src="/images/home_pinterest.png" title="pinterest"/></a>
                                <a href="#"><img src="/images/home_instagram.png" title="instagram"/></a>
                            </div>
                            <div class="top-search">
                                <div class="head-menu">
                                    <a id="my-email" href="/personalPage">${current_user.email}</a>
                                    <a href="/">我的主页</a>
                                    <a id="head-logout" href="/logout.do?email=${user.email}">注销</a>
                                </div>
                                <form method="get" action="/search" id="search">
                                        <%--<input name="q" type="text" size="40" placeholder="Search..." />--%>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>


    <div id="main-head" class="wrap-header zerogrid">
        <div class="row">
            <div class="col-1-3">
                <div id="logo">
                    <a href="#">
                        <%--<img src="/images/home_logo.png"/></a>--%>
                        <p id="blog_title">${user.nickname}'s Blog</p>
                    </a>
                </div>
            </div>
            <div class="col-2-3">
                <nav>
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="menu">
                        <li><a href="/${user.email}" class="button button-glow button-rounded button-highlight" style="margin-right: 10px">主页</a></li>


                        <%--<li>--%>
                            <%--<a href="#" class="parent">Categories</a>--%>
                            <%--<ul>--%>
                                <%--<li>--%>
                                    <%--<a href="#" class="parent">Menu 0001</a>--%>
                                    <%--<ul>--%>
                                        <%--<li><a href="#">Menu 1001</a></li>--%>
                                        <%--<li><a href="#">Menu 1002</a></li>--%>
                                        <%--<li><a href="#">Menu 1003</a></li>--%>
                                    <%--</ul>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="#" class="parent">Menu 0002</a>--%>
                                    <%--<ul>--%>
                                        <%--<li><a href="#">Menu 1002</a></li>--%>
                                        <%--<li><a href="#">Menu 1002</a></li>--%>
                                    <%--</ul>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                        <%--<li><a href="single.html">About</a></li>--%>
                        <%--<li><a href="contact.html">Contact Us</a></li>--%>
                        <c:if test="${current_user != null && current_user.email == user.email}">
                            <li><a href="/${current_user.email}/createBlog" class="button button-glow button-rounded button-caution">创建博客</a></li>
                        </c:if>

                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
