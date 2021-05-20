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

	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="/css/templatemo_style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/editormd/css/editormd.preview.css" />

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
	<link rel="stylesheet" href="/css/home_zerogrid.css">
	<link rel="stylesheet" href="/css/home_style.css">
	<link rel="stylesheet" href="/css/home_component.css">
	<link rel="stylesheet" href="/css/home_responsive.css">

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
</head>
<body>
<div class="wrap-body">
	<!--------------Header--------------->

	<jsp:include page="head.jsp"></jsp:include>

	<%--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>--%>

	<!--------------Content--------------->
	<section class="container page-home">
		<div id="main-content" class="wrap-container zerogrid">
			<c:choose>
				<c:when test="${current_user != null && user.id == current_user.id}">
					<c:if test="${empty blogs}">
						<article>
							<div class="col-1-2 right">
								<img class="img-responsive center-block" src="/images/home_img01.jpg" />
							</div>
							<div class="col-1-2 left">
									<%--<a class="art-category left" href="#">Design</a>--%>
								<div class="clear"></div>
								<div class="art-content">
									<h2>创建您的博客</h2>
									<div class="info">
											<%--with <a href="#">01 Commnets</a>--%>
									</div>
									<div class="line"></div>
									<p>您还没有博客，点击创建一篇新博客，分享您的见闻与感受。</p>
									<a href="/${current_user.email}/createBlog" class="more">Create blog</a>
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
											<img class="img-responsive center-block" src="/images/home_img0${status.index + 1}.jpg">
										</c:when>
										<c:otherwise>
											<img class="img-responsive center-block" src="${blog.coverImage}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-1-2 left">
									<a class="art-category left" href="#">${blog.type}</a>
									<button  onclick="editBlog(${blog.id});" class="button button-large button-plain button-border button-square">
										<i class="icon-cog"></i>
									</button>
									<div class="clear"></div>
									<div class="art-content">
										<h2>${blog.title}</h2>
										<div class="info">
											By ${user.nickname} on ${blog.createTime.toLocaleString()}
												<%--with <a href="#">01 Commnets</a>--%>
										</div>
										<div class="line"></div>
										<div id="preview-content${status.index}">
											<textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
										</div>
										<a href="/${user.email}/blog?id=${blog.id}" class="more">Read More</a>
									</div>
								</div>
							</article>
						</c:if>
						<c:if test="${status.index %2 != 0}">
							<article>
								<div class="col-1-2 left">
									<c:choose>
										<c:when test="${blog.coverImage == null || blog.coverImage == \"#\"}">
											<img class="img-responsive center-block" src="/images/home_img0${status.index + 1}.jpg">
										</c:when>
										<c:otherwise>
											<img class="img-responsive center-block" src="${blog.coverImage}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-1-2 right">
									<a class="art-category right" href="#">${blog.type}</a>
									<button onclick="editBlog(${blog.id});"  class="right button button-large button-plain button-border button-square">
										<i class="icon-cog"></i>
									</button>
									<div class="clear"></div>
									<div class="art-content">
										<h2>${blog.title}</h2>
										<div class="info">
											By ${user.nickname} on ${blog.createTime.toLocaleString()}
												<%--<a href="#">01 Commnets</a>--%>
										</div>
										<div class="line"></div>
										<div id="preview-content${status.index}">
											<textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
										</div>
										<a href="/${user.email}/blog?id=${blog.id}" class="more">Read More</a>
									</div>
								</div>
							</article>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:if test="${empty blogs}">
						<article>
							<div class="col-1-2 right">
								<img class="img-responsive center-block" src="/images/home_img01.jpg" />
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
											<img class="img-responsive center-block" src="/images/home_img0${status.index + 1}.jpg">
										</c:when>
										<c:otherwise>
											<img class="img-responsive center-block" src="${blog.coverImage}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-1-2 left">
									<a class="art-category left" href="#">${blog.type}</a>
									<div class="clear"></div>
									<div class="art-content">
										<h2>${blog.title}</h2>
										<div class="info">
											By ${user.nickname} on ${blog.createTime.toLocaleString()}
												<%--with <a href="#">01 Commnets</a>--%>
										</div>
										<div class="line"></div>
										<div id="preview-content${status.index}">
											<textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
										</div>
										<a href="/${user.email}/blog?id=${blog.id}" class="more">Read More</a>
									</div>
								</div>
							</article>
						</c:if>
						<c:if test="${status.index %2 != 0}">
							<article>
								<div class="col-1-2 left">
									<c:choose>
										<c:when test="${blog.coverImage == null || blog.coverImage == \"#\"}">
											<img class="img-responsive center-block" src="/images/home_img0${status.index + 1}.jpg">
										</c:when>
										<c:otherwise>
											<img class="img-responsive center-block" src="${blog.coverImage}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-1-2 right">
									<a class="art-category right" href="#">${blog.type}</a>
									<div class="clear"></div>
									<div class="art-content">
										<h2>${blog.title}</h2>
										<div class="info">
											By ${user.nickname} on ${blog.createTime.toLocaleString()}
												<%--<a href="#">01 Commnets</a>--%>
										</div>
										<div class="line"></div>
										<div id="preview-content${status.index}">
											<textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
										</div>
										<a href="/${user.email}/blog?id=${blog.id}" class="more">Read More</a>
									</div>
								</div>
							</article>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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