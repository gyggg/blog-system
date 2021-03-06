<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2018/2/12
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: guyu
  Date: 2018/2/10
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Standard Format Post - Abstract</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="/home/css/base.css">
    <link rel="stylesheet" href="/home/css/vendor.css">
    <link rel="stylesheet" href="/home/css/main.css">
    <link rel="stylesheet" href="/editormd/css/editormd.preview.css"/>
    <link rel="stylesheet" href="/editormd/css/editormd.css" type="text/css">


    <!-- script
    ================================================== -->
    <script src="/home/js/modernizr.js"></script>
    <script src="/home/js/pace.min.js"></script>

    <!-- favicons
     ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- register model
        =============================================== -->
    <link href="/register/login-register.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <script src="/register/login-register.js" type="text/javascript"></script>

</head>

<body id="top">

<!-- header
================================================== -->
<header class="short-header">

    <jsp:include page="home_header.jsp"></jsp:include>

</header> <!-- end header -->


<!-- content
================================================== -->
<section id="content-wrap" class="blog-single">
    <div class="row">
        <div class="col-twelve">

            <article class="format-standard">

                <%--<div class="content-media">--%>
                    <%--<div class="post-thumb">--%>
                        <%--<img src="images/thumbs/single/single-01.jpg">--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="primary-content">

                    <h1 class="page-title">${blog.title}</h1>

                    <ul class="entry-meta">
                        <li class="date">${blog.createTime.toLocaleString()}</li>
                        <li class="cat"><a href="">Wordpress</a><a href="">Design</a></li>
                    </ul>

                    <div id="test-editormd-view">
                        <textarea  name="test-editormd-markdown-doc"></textarea>
                    </div>

                    <p class="tags">
                        <span>Tagged in :</span>
                        <a href="#">orci</a><a href="#">lectus</a><a href="#">varius</a><a href="#">turpis</a>
                    </p>

                    <div class="author-profile">
                        <%--<img src="images/avatars/user-05.jpg" alt="">--%>

                        <div class="about">
                            <h4><a href="#">${user.nickname}</a></h4>

                            <p>${user.userDescribe}</p>

                            </ul>
                        </div>
                    </div> <!-- end author-profile -->

                </div> <!-- end entry-primary -->

            </article>

        </div> <!-- end col-twelve -->
    </div> <!-- end row -->

    <div class="comments-wrap">
        <div id="comments" class="row">
            <div class="col-full">

                <h3>${message_size} Comments</h3>

                <!-- commentlist -->
                <c:forEach items="${message_list}" var="message" varStatus="index">
                    <ol class="commentlist">

                        <li class="depth-1">

                            <%--<div class="avatar">--%>
                                <%--<img width="50" height="50" class="avatar" src="images/avatars/user-01.jpg" alt="">--%>
                            <%--</div>--%>

                            <div class="comment-content">

                                <div class="comment-info">
                                    <cite>${message.user.nickname}</cite>

                                    <div class="comment-meta">
                                        <time class="comment-time" >${message.createTime.toLocaleString()}</time>
                                            <%--<span class="sep">/</span><a class="reply" href="#">Reply</a>--%>
                                    </div>
                                </div>

                                <div class="comment-text" id="message-${index.index}">
                                    <div style="font-size:14px">
                                            <%--<img class="left" style="margin-right: 15px; height: 50px; width: 50px;"src="/images/home_50x50.jpg">--%>
                                        <textarea name="test-editormd-markdown-doc"></textarea>
                                    </div>
                                </div>

                            </div>

                        </li>

                    </ol> <!-- Commentlist End -->
                </c:forEach>


                <!-- respond -->
                <div >

                    <h3>Leave a Comment</h3>

                    <div id="has-login" style="display:none">
                        <span>?????????????????????<br></span>
                        <div id="input-message">
                            <textarea name="blogContent" id="blogContent"></textarea>
                        </div>
                        <button type="submit" class="submit button-primary">Submit</button>
                    </div>
                    <div id="none-login" style="display:none">
                        <p>??????????????????,???<a href="" onclick="openLoginModal();">[??????]</a>???<a href="" onclick="openRegisterModal();">[??????]</a></p>
                    </div>

                </div> <!-- Respond End -->

            </div> <!-- end col-full -->
        </div> <!-- end row comments -->
    </div> <!-- end comments-wrap -->

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
                                <form:form method="post" action="/loginInPage.do" accept-charset="UTF-8" commandName="user" role="form">
                                    <input class="form-control" type="text" placeholder="Email" name="email">
                                    <input class="form-control" type="password" placeholder="Password" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="Login" onclick="loginAjax()">
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">
                                <form:form action="/register.do" commandName="user" method="post" role="form" onsubmit="return check_password();">
                                    <input id="name" class="form-control" type="text" placeholder="??????" name="nickname">
                                    <input id="email" class="form-control" type="text" placeholder="Email" name="email">
                                    <input id="password" class="form-control" type="password" placeholder="??????" name="password">
                                    <input id="password_confirmation" class="form-control" type="password" placeholder="????????????" onchange="check_password()">
                                    <input class="btn btn-default btn-register" type="submit" value="??????????????????" name="commit">
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section> <!-- end content -->



<!-- footer
================================================== -->
<div id="preloader">
    <div id="loader"></div>
</div>

<!-- Java Script
================================================== -->
<script src="/home/js/jquery-2.1.3.min.js"></script>
<script src="/home/js/plugins.js"></script>
<script src="/home/js/main.js"></script>
<script src="/editormd/lib/marked.min.js"></script>
<script src="/editormd/lib/prettify.min.js"></script>

<script src="/editormd/lib/raphael.min.js"></script>
<script src="/editormd/lib/underscore.min.js"></script>
<script src="/editormd/lib/sequence-diagram.min.js"></script>
<script src="/editormd/lib/flowchart.min.js"></script>
<script src="/editormd/lib/jquery.flowchart.min.js"></script>

<script src="/editormd/js/editormd.js"></script>
<script type="text/javascript">
    function add0(m){return m<10?'0'+m:m }
    function format(times){
        //times?????????????????????parseInt??????
        var time = new Date(parseInt(times));
        var y = time.getFullYear();
        var m = time.getMonth()+1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y+'???'+add0(m)+'???'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
    }
    function setMessage(id, pos) {
        $.get("/${blog.id}/getSingleMessage.do?messageId=" + id, function(data){
            editormd.markdownToHTML('message-' + pos, {
                markdown        : data,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // ?????? HTML ????????????????????????????????????????????????
                htmlDecode      : "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm            : true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // ????????? ToC ?????????
                //gfm             : false,
                //tocDropdown     : true,
                // markdownSourceCode : true, // ???????????? Markdown ??????????????????????????????????????? Textarea ??????
                emoji           : true,
                taskList        : true,
                tex             : true,  // ???????????????
                flowChart       : true,  // ???????????????
                sequenceDiagram : true,  // ???????????????
            });
        });
    }
    <c:forEach items="${message_list}" var="message" varStatus="index">
        setMessage(${message.id}, ${index.index})
    </c:forEach>
</script>
<script type="text/javascript">
    $(function () {
        var blogEditormdView;
        var messageEditormdView;
        $.get("/${user.email}/getBlogContent.do?id=${blog.id}", function (mdContent) {
            blogEditormdView = editormd.markdownToHTML("test-editormd-view", {
                markdown: mdContent,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // ?????? HTML ????????????????????????????????????????????????
                htmlDecode: "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm: true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // ????????? ToC ?????????
                //gfm             : false,
                //tocDropdown     : true,
                // markdownSourceCode : true, // ???????????? Markdown ??????????????????????????????????????? Textarea ??????
                emoji: true,
                taskList: true,
                tex: true,  // ???????????????
                flowChart: true,  // ???????????????
                sequenceDiagram: true,  // ???????????????
            });
            //console.log("???????????? jQuery ?????? =>", testEditormdView);
            // ??????Markdown??????
            //console.log(testEditormdView.getMarkdown());
            //alert(testEditormdView.getMarkdown());
        });
        function changeMessagePage(page_num) {
            if(page_num < 1){
                page_num = 1;
            }
            else {
                page_num = ${page_num};
            }
            window.location.href = window.location.href.replace(new RegExp('#.*', 'gi'), '') + '&submitMessage=1&page_num=' + page_num;
        }
        $(function () {
            var mk_url;
            $(function () {
                messageEditormdView = editormd("input-message", {
                    width: "100%",
                    height: 300,
                    path: '/editormd/lib/',
                    theme: "lignt",
                    previewTheme: "light",
                    editorTheme: "paraiso-light",
                    toolbarIcons: function () {
                        // Or return editormd.toolbarModes[name]; // full, simple, mini
                        // Using "||" set icons align right.
                        return [
                            "undo", "redo", "|",
                            "bold", "del", "italic", "quote", "|",
                            "h1", "h2", "h3", "h4", "h5", "h6", "|",
                            "list-ul", "list-ol", "hr", "|",
                            "link", "reference-link", "image", "code", "preformatted-text", "code-block", "|"
                            , "clear", "|",
                            "help", "info"
                        ]
                    },
                    codeFold: true,
                    //syncScrolling : false,
                    saveHTMLToTextarea: true,    // ?????? HTML ??? Textarea
                    searchReplace: true,
                    //watch : false,                // ??????????????????
                    htmlDecode: "style,script,iframe|on*",            // ?????? HTML ????????????????????????????????????????????????
                    //toolbar  : false,             //???????????????
                    //previewCodeHighlight : false, // ???????????? HTML ?????????????????????????????????
                    //emoji : true,
                    toolbarIconTexts: {
                        submit: "????????????"
                    },
                    taskList: true,
                    tocm: true,         // Using [TOCM]
                    tex: true,                   // ??????????????????TeX???????????????????????????
                    flowChart: true,             // ????????????????????????????????????
                    sequenceDiagram: true,       // ????????????/??????????????????????????????,
                    //dialogLockScreen : false,   // ????????????????????????????????????????????????????????????true
                    //dialogShowMask : false,     // ????????????????????????????????????????????????????????????????????????true
                    //dialogDraggable : false,    // ???????????????????????????????????????????????????????????????true
                    //dialogMaskOpacity : 0.4,    // ???????????????????????????????????????????????????????????????0.1
                    //dialogMaskBgColor : "#000", // ???????????????????????????????????????????????????????????????#fff
                    imageUpload: true,
                    imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                    imageUploadURL: "/${current_user.email}/uploadImage.do",
                    onload: function () {
                        console.log('onload', this);
                        if(${submitMessage == 0}) {
                            window.location.hash = "";
                            window.location.hash = "#main-content"
                        }
                        else {
                            window.location.hash = "";
                            window.location.hash = "#message-0"
                        }
                        //this.fullscreen();
                        //this.unwatch();
                        //this.watch().fullscreen();

                        //this.setMarkdown("#PHP");
                        //this.width("100%");
                        //this.height(480);
                        //this.resize("100%", 640);
                    },
                    // ???????????????????????????????????????
                    toolbarHandlers: {
                        /**
                         * @param {Object}      cm         CodeMirror??????
                         * @param {Object}      icon       ????????????jQuery????????????
                         * @param {Object}      cursor     CodeMirror???????????????????????????????????????????????????
                         * @param {String}      selection  ????????????????????????
                         */
                        submit: function (cm, icon, cursor, selection) {
                            $.ajax({
                                url : '/${blog.id}/sendMessage.do',
                                data : {
                                    'content' : messageEditormdView.getMarkdown()
                                },
                                success : function(data) {
                                    if(data == 'success') {
                                        alert('????????????');
                                        window.location.href = '/${email}/blog?id=${blog.id}' + '&submitMessage=1'
                                    }
                                    else
                                        alert('????????????');
                                },
                                error : function() {
                                    alert('????????????');
                                }
                            })
                            console.log("subminting", this);
                        }
                    }
                });
            });
        });
    });
    <%--window.onload = function() {--%>
        <%--if(${current_user == null}) {--%>
            <%--if(${submitMessage == 0}) {--%>
                <%--window.location.hash = "";--%>
                <%--window.location.hash = "#"--%>
            <%--}--%>
            <%--else {--%>
                <%--window.location.hash = "";--%>
                <%--window.location.hash = "#message-0"--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>
    function setComment(hasLogin) {
        if(hasLogin){
            document.getElementById("none-login").display = "none";
            document.getElementById("has-login").style.display = "";
        } else {
            document.getElementById("none-login").style.display = "";
            document.getElementById("has-login").style.display = "none";
        }
    }
    function login() {
        $.post("/loginInPage.do", function(result){
            if(result == null) {
                setComment(true)
            } else {
                shakeModal();
            }
        })
    }
    function register() {
        $.post("/registerInPage.do", function(result){
            if(result == null) {
             setComment(true)
            } else {
                shakeModal();
            }
        })
    }
    <c:choose>
    <c:when test="${current_user == null}">
        setComment(false);
    </c:when>
    <c:otherwise>
        setComment(true);
    </c:otherwise>
    </c:choose>
</script>
</body>

</html>
