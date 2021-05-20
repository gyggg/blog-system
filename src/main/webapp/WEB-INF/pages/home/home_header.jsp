<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2018/2/10
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <%--<title>Inline Login</title>--%>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">--%>
    <%--<link href="/css/templatemo_style.css" rel="stylesheet" type="text/css">--%>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <%--<link rel="stylesheet" href="/css/home_zerogrid.css">--%>
    <%--<link rel="stylesheet" href="/css/home_style.css">--%>
    <%--<link rel="stylesheet" href="/css/home_component.css">--%>
    <%--<link rel="stylesheet" href="/css/home_responsive.css">--%>

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="/js/html5.js"></script>
    <script src="/js/css3-mediaqueries.js"></script>
    <![endif]-->
    <link href='/images/home_favicon.ico' rel='icon' type='image/x-icon'/>
    <script type="application/javascript">
        function editBlog(id) {
            window.location.href = "/${current_user.email}/editBlog?id=" + id;
        }
    </script>

    <!--- basic page needs
    ================================================== -->

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="/home/css/base.css">
    <link rel="stylesheet" href="/home/css/vendor.css">
    <link rel="stylesheet" href="/home/css/main.css">
    <link rel="stylesheet" href="/editormd/css/editormd.preview.css" />


    <!-- script
    ================================================== -->
    <script src="/home/js/modernizr.js"></script>
    <script src="/home/js/pace.min.js"></script>

    <!-- favicons
     ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="/home/image/x-icon">
    <link rel="icon" href="favicon.ico" type="/home/image/x-icon">

</head>
<header>
    <div class="gradient-block"></div>

    <div class="row header-content">

        <div class="logo">
            <a href="index.html">Author</a>
        </div>

        <nav id="main-nav-wrap">
            <ul class="main-navigation sf-menu">
                <li <c:if test="${page_flag == 0}">  class="current" </c:if>><a href="/${user.email}" title="">主页</a></li>
                <c:forEach items="${blog_types}" var="blogType" varStatus="status">
                    <c:choose>
                        <c:when test="${empty blogType.childBlogTypes}">
                            <li><a href="" title="">${blogType.name}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="has-children">
                                <a href="#" title="">${blogType.name}</a>
                                <ul class="sub-menu">
                                    <c:forEach items="${blogType.childBlogTypes}" var="childBlogType">
                                        <li><a href="#">${childBlogType.name}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li><a href="about.html" title="">About</a></li>
                <li><a href="contact.html" title="">Contact</a></li>
            </ul>
        </nav> <!-- end main-nav-wrap -->

        <div class="search-wrap">

            <form role="search" method="get" class="search-form" action="#">
                <label>
                    <span class="hide-content">Search for:</span>
                    <input type="search" class="search-field" placeholder="Type Your Keywords" value="" name="s" title="Search for:" autocomplete="off">
                </label>
                <input type="submit" class="search-submit" value="Search">
            </form>

            <a href="#" id="close-search" class="close-btn">Close</a>

        </div> <!-- end search wrap -->

        <div class="triggers">
            <a class="search-trigger" href="#"><i class="fa fa-search"></i></a>
            <a class="menu-toggle" href="#"><span>Menu</span></a>
        </div> <!-- end triggers -->

    </div>
</header>
<script src="/home/js/jquery-2.1.3.min.js"></script>
<script src="/home/js/plugins.js"></script>
<script src="/home/js/jquery.appear.js"></script>
<script src="/home/js/main.js"></script>
