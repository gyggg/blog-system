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
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <link href="/css/templatemo_style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/editormd/css/editormd.preview.css"/>
    <link rel="stylesheet" href="/editormd/css/editormd.css" type="text/css">


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
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
                 height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="/js/html5.js"></script>
    <script src="/js/css3-mediaqueries.js">
    <![endif]-->
    <script type="text/javascript">
        if(${now_page < 1}){
            ${now_page == 1}
        }
        if(${now_page > page_num}){
            ${now_page == page_num}
        }
    </script>

    <link href='/images/home_favicon.ico' rel='icon' type='image/x-icon'/>
</head>
<body>
<header>
    <!--------------Header--------------->
    <%--<c:import url="home/home_header.jsp"></c:import>--%>

</header>
<div class="wrap-body">

    <!--------------Content--------------->
    <section class="container page-single">
        <div class="wrap-container zerogrid">
            <div class="col-full">
                <div id="main-content" class="wrap-col">
                    <article>

                        <div class="art-header">
                            <h2>${blog.title}</h2>
                            <div class="info">By ${user.email} on ${blog.createTime.toLocaleString()}</div>
                            <div class="line"></div>
                        </div>
                        <div id="test-editormd-view">
                            <textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
                        </div>
                        <%--<div class="tag">--%>
                            <%--<span>Tag : </span>--%>
                            <%--<ul>--%>
                                <%--<li><a href="#">${blog.typeId}</a></li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    </article>
                    <c:if test="${current_user == null}">
                        <div class="art-related">
                            <p>您还没有登录,请<a href="#">[登录]</a>或<a href="/registerPage">[注册]</a></p>
                        </div>
                    </c:if>
                    <div id="messages-div">
                        <div class="art-related" id="none-message">
                            <p>暂时没有任何评论</p>
                        </div>
                        <c:forEach begin="0" end="7" varStatus="index">
                            <div class="art-related" id="message-${index.index}" style="display: none" >
                                <p id="name-${index.index}" style="font-weight:bold; font-size:12px;color:dimgray;background-color:lightgray"></p>
                                <div style="font-size:14px">
                                    <%--<img class="left" style="margin-right: 15px; height: 50px; width: 50px;"src="/images/home_50x50.jpg">--%>
                                    <textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
                                </div>
                            </div>
                        </c:forEach>
                        <div id="pagination" class="clearfix">
                            <ul>
                                <c:if test="${now_page > 1}">
                                    <li><a  href="/${email}/blog?id=${blog.id}&submitMessage=1&now_page=${now_page - 1}">last</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${page_num}" var="page">
                                    <c:choose>
                                        <c:when test="${page == now_page}">
                                            <li><a id="page-${page}" href="/${email}/blog?id=${blog.id}&submitMessage=1&now_page=${page}"class="current">${page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a id="page-${page}" href="/${email}/blog?id=${blog.id}&submitMessage=1&now_page=${page}">${page}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${now_page < page_num}">
                                    <li><a href="/${email}/blog?id=${blog.id}&submitMessage=1&now_page=${now_page + 1}">next</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="art-related">
                        <c:if test="${current_user != null}">
                            <span>写下您的留言：<br></span>
                            <div id="input-message">
                                <textarea name="blogContent" id="blogContent"></textarea>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
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
        <%--<div class="copyright">--%>
            <%--&lt;%&ndash;<p>Copyright © 2015 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>&ndash;%&gt;--%>
        <%--</div>--%>
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
    var editormdView = [null,null,null,null,null,null,null,null];
    function add0(m){return m<10?'0'+m:m }
    function format(times){
        //times是整数，否则要parseInt转换
        var time = new Date(parseInt(times));
        var y = time.getFullYear();
        var m = time.getMonth()+1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y+'年'+add0(m)+'月'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
    }
    function clearMessageDiv() {
        for(var i = 0; i < 8; i++) {
            document.getElementById('message-' + i).style.display = 'none'
        }
        document.getElementById('none-message').style.display = 'none';
    }
    function outputMessages(messages) {
        clearMessageDiv()
        if(messages.length == 0)
            document.getElementById('none-message').style.display = 'block';
        for(var i = 0; i < messages.length; i++) {
            document.getElementById('message-' + i).style.display = 'block'
        }
        for(var i = 0; i < messages.length; i++) {
            document.getElementById('name-' + i).innerHTML = messages[i].floor + '楼&nbsp;<a style="font-style:italic; color:dodgerblue;" href="/' + messages[i].user.email + '">' +  messages[i].user.nickname + '</a>&nbsp;' + format(messages[i].message.createTime) + '发表';
            $(function() {
                console.log(messages[i].content);
                editormdView[i] = editormd.markdownToHTML('message-' + i, {
                    markdown        : messages[i].message.content ,//+ "\r\n" + $("#append-test").text(),
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
            });
        }
    }
    $(function () {
        document.getElementById("head-login") != null ?
                document.getElementById("head-login").setAttribute("action", "/loginInPage.do?nowUrl=" + window.location.href) :
                document.getElementById("head-logout").setAttribute("href", "/logout.do?nowUrl=" + window.location.href);
        $.get("/${blog.id}/getMessages.do?page=${now_page - 1}", function(data){
            outputMessages(data);
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        var testEditormdView;
        var messageEditormdView;
        $.get("/${user.email}/getBlogContent.do?id=${blog.id}", function (mdContent) {
            testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                markdown: mdContent,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                htmlDecode: "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm: true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                //gfm             : false,
                //tocDropdown     : true,
                // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                emoji: true,
                taskList: true,
                tex: true,  // 默认不解析
                flowChart: true,  // 默认不解析
                sequenceDiagram: true,  // 默认不解析
            });
            //console.log("返回一个 jQuery 实例 =>", testEditormdView);
            // 获取Markdown源码
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
                            "help", "info", "|", "submit"
                        ]
                    },
                    codeFold: true,
                    //syncScrolling : false,
                    saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
                    searchReplace: true,
                    //watch : false,                // 关闭实时预览
                    htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                    //toolbar  : false,             //关闭工具栏
                    //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
                    //emoji : true,
                    toolbarIconTexts: {
                        submit: "提交评论"
                    },
                    taskList: true,
                    tocm: true,         // Using [TOCM]
                    tex: true,                   // 开启科学公式TeX语言支持，默认关闭
                    flowChart: true,             // 开启流程图支持，默认关闭
                    sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
                    //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
                    //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
                    //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
                    //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
                    //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
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
                    // 自定义工具栏按钮的事件处理
                    toolbarHandlers: {
                        /**
                         * @param {Object}      cm         CodeMirror对象
                         * @param {Object}      icon       图标按钮jQuery元素对象
                         * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
                         * @param {String}      selection  编辑器选中的文本
                         */
                        submit: function (cm, icon, cursor, selection) {
                            $.ajax({
                                url : '/${blog.id}/sendMessage.do',
                                data : {
                                    'content' : messageEditormdView.getMarkdown()
                                },
                                success : function(data) {
                                    if(data == 'success') {
                                        alert('提交成功');
                                        window.location.href = '/${email}/blog?id=${blog.id}' + '&submitMessage=1'
                                    }
                                    else
                                            alert('提交失败');
                                },
                                error : function() {
                                    alert('提交失败');
                                }
                            })
                            console.log("subminting", this);
                        }
                    }
                });
            });
        });
    });
    window.onload = function() {
        if(${current_user == null}) {
            if(${submitMessage == 0}) {
                window.location.hash = "";
                window.location.hash = "#main-content"
            }
            else {
                window.location.hash = "";
                window.location.hash = "#message-0"
            }
        }
    }
</script>

</body>
</html>