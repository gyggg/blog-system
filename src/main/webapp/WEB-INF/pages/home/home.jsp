<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2017/12/16
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javax.persistence.Basic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
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

    <link rel="stylesheet" href="/editormd/css/editormd.preview.css" />

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>${user.nickname}的博客</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

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


    <!-- script
    ================================================== -->
    <script src="/home/js/modernizr.js"></script>
    <script src="/home/js/pace.min.js"></script>

    <!-- favicons
     ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="/home/image/x-icon">
    <link rel="icon" href="favicon.ico" type="/home/image/x-icon">

</head>

<body id="top">

<!-- header
================================================== -->
<header class="short-header">

    <jsp:include page="home_header.jsp"></jsp:include>

</header> <!-- end header -->

<section id="bricks">

<div class="row masonry">
<!-- brick-wrapper -->
<div class="bricks-wrapper">
<div class="grid-sizer"></div>

    <%--如果博客为空--%>
    <c:if test="${empty blogs}">\
    <article class="brick entry format-standard animate-this">
        <div class="entry-thumb">
            <c:choose>
                <c:when test="${current_user != null && user.id == current_user.id}">
                    <a href="/${current_user.email}/createBlog" class="thumb-link">
                        <img src="images/thumbs/featured/featured-3.jpg" alt="building">
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="thumb-link">
                        <img src="images/thumbs/featured/featured-3.jpg" alt="building">
                    </a>
                </c:otherwise>
            </c:choose>
            <a href="single-standard.html" class="thumb-link">
                <img src="images/thumbs/featured/featured-3.jpg" alt="building">
            </a>
        </div>
        <div class="entry-text">
            <div class="entry-header">
                <h1 class="entry-title"><a href="single-standard.html">这是个空空如也的博客</a></h1>
            </div>
            <div class="entry-excerpt">
                这里需要充实一大堆内容~~~~~~~~~~~~~~~~~~~~~~~~~
                <c:if test="${current_user != null && user.id == current_user.id}">
                    点击创建新博文
                </c:if>
            </div>
        </div>
    </article>
    </c:if>

    <c:forEach items="${blogs}" var="blog" varStatus="status">

    <article class="brick entry format-standard animate-this">
        <div class="entry-thumb">
            <a href="/${user.email}/blog?id=${blog.id}" class="thumb-link">
                <c:choose>
                    <c:when test="${blog.coverImage == null || blog.coverImage == \"#\"}">
                        <%--<img src="images/thumbs/featured/featured-3.jpg" alt="building">--%>
                    </c:when>
                    <c:otherwise>
                        <img src="${blog.coverImage}">
                    </c:otherwise>
                </c:choose>
            </a>
        </div>

        <div class="entry-text">
            <div class="entry-header">

                <%--<div class="entry-meta">--%>
               			<%--<span class="cat-links">--%>
               				<%--<a href="#">Design</a>--%>
               				<%--<a href="#">Photography</a>--%>
               			<%--</span>--%>
                <%--</div>--%>

                <h1 class="entry-title"><a href="/${user.email}/blog?id=${blog.id}">${blog.title}</a></h1>

            </div>
            <div class="entry-excerpt">
                <div id="preview-content${status.index}">
                    <textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
                </div>
                <%--Lorem ipsum Sed eiusmod esse aliqua sed incididunt aliqua incididunt mollit id et sit proident dolor nulla sed commodo est ad minim elit reprehenderit nisi officia aute incididunt velit sint in aliqua cillum in consequat consequat in culpa in anim.--%>
            </div>
        </div>

    </article> <!-- end article -->
    </c:forEach>
</div></div>

    <%--页面数字--%>
    <div class="row">
        <nav class="pagination">
            <c:if test="${now_page > 1}">
                <a class="page-numbers prev" href="/${user.email}?page=${now_page - 1}">Prev</a>
            </c:if>
            <c:forEach begin="1" end="${page_num}" var="page">
                <c:choose>
                    <c:when test="${page == now_page}">
                        <span class="page-numbers current">${page}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/${user.email}?page=${page}" class="page-numbers">${page}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${now_page < page_num}">
                <a href="/${user.email}?page=${now_page + 1}" class="page-numbers next">Next</a>
            </c:if>
        </nav>
    </div>

</section> <!-- end bricks -->


<div id="preloader">
    <div id="loader"></div>
</div>

<!-- Java Script
================================================== -->
<script src="/home/js/jquery-2.1.3.min.js"></script>
<script src="/home/js/plugins.js"></script>
<script src="/home/js/jquery.appear.js"></script>
<script src="/home/js/main.js"></script>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/navigation.js"></script>
<script src="/editormd/lib/marked.min.js"></script>
<script src="/editormd/lib/prettify.min.js"></script>

<script src="/editormd/lib/raphael.min.js"></script>
<script src="/editormd/lib/underscore.min.js"></script>
<script src="/editormd/lib/sequence-diagram.min.js"></script>
<script src="/editormd/lib/flowchart.min.js"></script>
<script src="/editormd/lib/jquery.flowchart.min.js"></script>

<script src="/editormd/js/editormd.js"></script>

<script type="text/javascript">
    window.onload = function() {
        document.getElementById("head-login") != null ?
                document.getElementById("head-login").setAttribute("action", "/loginInPage.do?nowUrl=" + window.location.href) :
                document.getElementById("head-logout").setAttribute("href", "/logout.do?nowUrl=" + window.location.href);
    }
    $(function(){
        var editormdView = [,,,];
        <c:forEach items="${blogs}" var="blog" varStatus="status">
        $.get("/${user.email}/getPreviewContent.do?id=" + ${blog.id}, function(mdContent) {
            editormdView[${status.index}] = editormd.markdownToHTML("preview-content${status.index}", {
                markdown        : mdContent ,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                htmlDecode      : "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm            : true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                //gfm             : false,
                //tocDropdown     : true,
                // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true,  // 默认不解析
            });
            //console.log("返回一个 jQuery 实例 =>", testEditormdView);
            // 获取Markdown源码
            //console.log(testEditormdView.getMarkdown());
            //alert(testEditormdView.getMarkdown());
        });
        </c:forEach>
    });
</script>
</body></html>
