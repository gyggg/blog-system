<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2016/11/28
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="templatemo-sidebar">
    <header class="templatemo-site-header">
        <%--<div class="square"></div>--%>
        <h1 id='header_name'></h1>
    </header>
    <div class="profile-photo-container">
        <img src="/images/admin/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
        <div class="profile-photo-overlay"></div>
    </div>
    <!-- Search box -->
    <%--<form class="templatemo-search-form" role="search">--%>
        <%--<div class="input-group">--%>
            <%--<button type="submit" class="fa fa-search"></button>--%>
            <%--<input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">--%>
        <%--</div>--%>
    <%--</form>--%>
    <div class="mobile-menu-icon">
        <i class="fa fa-bars"></i>
    </div>
    <nav class="templatemo-left-nav">
        <ul>
            <li><a href="/personalPage" id="blog_manage"><i class="fa fa-home fa-fw"></i>博客管理</a></li>
            <c:if test="${current_user != null && current_user.privilege == 1}">
                <li><a href="/userManagePage" id="user_manage"><i class="fa fa-users fa-fw"></i>用户管理</a></li>
            </c:if>
            <li><a href="/informationPage" id="personal_manage"><i class="fa fa-sliders fa-fw"></i>个人信息管理</a></li>
            <li><a href="/"><i class="fa fa-eject fa-fw"></i>返回个人主页</a></li>
        </ul>
    </nav>
</div>

<script>
    var headerName = '${current_user.email}';
    var finalHeader = "";
    for(var i = 0; i < headerName.length; i++) {
        finalHeader += headerName[i];
        if(headerName[i] == '@') {
            finalHeader += '<br>';
        }
    }
    document.getElementById('header_name').innerHTML=finalHeader;
    <c:choose>
    <c:when test='${page == "blog_manage"}'>
    document.getElementById('blog_manage').setAttribute('class', 'active');
    </c:when>
    <c:when test='${page == "user_manage"}'>
    document.getElementById('user_manage').setAttribute('class', 'active');
    </c:when>
    <c:otherwise>
    document.getElementById('personal_manage').setAttribute('class', 'active');
    </c:otherwise>
    </c:choose>
</script>