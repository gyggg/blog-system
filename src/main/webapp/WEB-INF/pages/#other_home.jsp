<%@ page import="javax.persistence.Basic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>


	<%--<title>Inline Login</title>--%>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>${user.nickname}'s Blog</title>
	<meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
	<meta name="author" content="www.zerotheme.com">

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="css/home_zerogrid.css">
	<link rel="stylesheet" href="css/home_style.css">
	<link rel="stylesheet" href="css/home_component.css">
	<link rel="stylesheet" href="css/home_responsive.css">

	<!--[if lt IE 8]>
	<div style=' clear: both; text-align:center; position: relative;'>
		<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
			<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
		</a>
	</div>
	<![endif]-->
	<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->

	<link href='images/home_favicon.ico' rel='icon' type='image/x-icon'/>
</head>
<body>
<div class="wrap-body">
	<!--------------Header--------------->
	<c:choose>
		<c:when test="${empty current_user}">
			<div class="templatemo-header">
				<div class="container">
					<div class="col-md-12">
							<%--<h1 class="logo pull-left">Logo</h1>--%>
						<form:form action="/loginInPage.do?${user.email}" method="post" class="form-inline pull-right" commandName="user" role="form">
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
                            <a href="#"><img src="images/home_facebook.png" title="facebook"/></a>
                            <a href="#"><img src="images/home_twitter.png" title="twitter"/></a>
                            <a href="#"><img src="images/home_google.png" title="google"/></a>
                            <a href="#"><img src="images/home_pinterest.png" title="pinterest"/></a>
                            <a href="#"><img src="images/home_instagram.png" title="instagram"/></a>
                        </div>
                        <div class="top-search">
							<div class="head-menu">
								<a id="my-email" href="#">${current_user.email}</a>
								<a href="/">我的主页</a>
								<a href="/login.do?email=${user.email}">注销</a>
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
	<header>
		<div class="wrap-header zerogrid">
			<div class="row">
				<div class="col-1-3">
					<div id="logo">
						<a href="#">
							<%--<img src="images/home_logo.png"/></a>--%>
							<p id="blog_title">${user.nickname}'s Blog</p>
						</a>
					</div>
				</div>
				<div class="col-2-3">
					<nav>
						<a class="toggleMenu" href="#">Menu</a>
						<ul class="menu">
							<li><a href="/${user.email}">Home</a></li>
							<li>
								<a href="#" class="parent">Categories</a>
								<ul>
									<li>
										<a href="#" class="parent">Menu 0001</a>
										<ul>
											<li><a href="#">Menu 1001</a></li>
											<li><a href="#">Menu 1002</a></li>
											<li><a href="#">Menu 1003</a></li>
										</ul>
									</li>
									<li>
										<a href="#" class="parent">Menu 0002</a>
										<ul>
											<li><a href="#">Menu 1002</a></li>
											<li><a href="#">Menu 1002</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li><a href="single.html">About</a></li>
							<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</nav>
				</div>

			</div>
		</div>
	</header>


	<%--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>--%>

	<!--------------Content--------------->
	<section class="container page-home">
		<div id="main-content" class="wrap-container zerogrid">
			<c:if test="${empty blogs}">
				<article>
					<div class="col-1-2 right">
						<img src="images/home_img01.jpg" />
					</div>
					<div class="col-1-2 left">
							<%--<a class="art-category left" href="#">Design</a>--%>
						<div class="clear"></div>
						<div class="art-content">
							<h2>这个人没有任何博客</h2>
							<div class="info">
									<%--with <a href="#">01 Commnets</a>--%>
							</div>
							<div class="line"></div>
							<p>你可以走了……</p>
							<a href="#" class="more">Good bye~</a>
						</div>
					</div>
				</article>
			</c:if>
			<c:forEach items="${blogs}" var="blog" varStatus="status">
				<c:if test="${status.index %2 == 0}">
					<article>
						<div class="col-1-2 right">
							<c:choose>
								<c:when test="${blog.coverImage == null || blog.coverImage == \"#\"}">
									<img src="images/home_img0${status.index + 1}.jpg" />
								</c:when>
								<c:otherwise>
									<img src="${blog.coverImage}"
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-1-2 left">
							<%--<a class="art-category left" href="#">Design</a>--%>
							<div class="clear"></div>
							<div class="ar t-content">
								<h2>${blog.title}</h2>
								<div class="info">
									By ${user.nickname} on ${blog.createTime.toLocaleString()}
									<%--with <a href="#">01 Commnets</a>--%>
								</div>
								<div class="line"></div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus.</p>
								<a href="#" class="more">Read More</a>
							</div>
						</div>
					</article>
				</c:if>
				<c:if test="${status.index %2 != 0}">
					<article>
						<div class="col-1-2 left">
							<c:choose>
								<c:when test="${blog.coverImage == null}">
									<img src="images/home_img0${status.index + 1}.jpg" />
								</c:when>
								<c:otherwise>
									<img src="${blog.coverImage}"
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-1-2 right">
							<%--<a class="art-category right" href="#">Design</a>--%>
							<div class="clear"></div>
							<div class="art-content">
								<h2>${blog.title}</h2>
								<div class="info">
									By ${user.nickname} on ${blog.createTime.toLocaleString()}
									<%--<a href="#">01 Commnets</a>--%>
								</div>
								<div class="line"></div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus.</p>
								<a href="#" class="more">Read More</a>
							</div>
						</div>
					</article>
				</c:if>
			</c:forEach>
		</div>

		<div id="pagination" class="clearfix">
			<ul>
				<c:if test="${now_page > 1}">
					<li><a href="/${user.email}?page=${now_page - 1}">last</a></li>
				</c:if>
				<c:forEach begin="1" end="${page_num}" var="page">
					<c:choose>
						<c:when test="${page == now_page}">
							<li><a class="current" href="/${user.email}?page=${page}">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/${user.email}?page=${page}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${now_page < page_num}">
					<li><a href="/${user.email}?page=${now_page + 1}">next</a></li>
				</c:if>
			</ul>
		</div>

	</section>
	<!--------------Footer--------------->
	<footer>
		<div class="wrap-footer zerogrid">
			<div class="row">
				<div class="col-full">
					<div class="wrap-col">
						<%--<h1>zSarah</h1>--%>
						<%--<p>Free Html5 Templates - Zerotheme.com</p>--%>
						<div class="menu-bottom">
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">About</a></li>
								<li><a href="#">Contact</a></li>

							</ul>
							<div class="clear"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<%--<p>Copyright © 2015 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>--%>
		</div>
	</footer>

</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/navigation.js"></script>
</body></html>