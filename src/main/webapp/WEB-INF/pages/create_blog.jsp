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
    <link rel="stylesheet" href="/editormd/css/editormd.css" type="text/css">
    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>${current_user.nickname}'s Blog</title>
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
    <script src="/js/css3-mediaqueries.js"></script>
    <![endif]-->

    <link href='images/home_favicon.ico' rel='icon' type='image/x-icon'/>
</head>
<body>
<div class="wrap-body">
    <!--------------Header--------------->
    <jsp:include page="head.jsp"></jsp:include>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">提交您的博客</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="blog-title" class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="blog-title"  <c:if test="${blog != null}"> value="${blog.title}"</c:if> placeholder="Title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blog-type" class="col-sm-2 control-label">博客类型</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="blog-type">
                                    <c:if test="${blog != null}">
                                        <option>${blog.type}</option>
                                    </c:if>
                                    <option>心情随笔</option>
                                    <option>技术分享</option>
                                    <option>情感剖析</option>
                                    <option>心灵鸡汤</option>
                                    <option>生活灵感</option>
                                </select>
                            </div>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                <%--<div class="checkbox">--%>
                                    <%--<label>--%>
                                        <%--<input type="checkbox"> Remember me--%>
                                    <%--</label>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                <%--<button type="submit" class="btn btn-default">Sign in</button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="submit()">确定</button>
                </div>
            </div>
        </div>
    </div>

    <div id="test-editormd">
        <textarea name="blogContent" id="blogContent"></textarea>
    </div>

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
<%--markdown编辑器--%>
<script type="text/javascript" src="/editormd/js/jquery.min.js"></script>
<script type="text/javascript" src="/editormd/js/editormd.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var testEditor;
    $(function() {
        var mk_url;
        $.get(
        <c:choose>
            <c:when test="${empty blog}">
                '/editormd/test.md',
            </c:when>
            <c:otherwise>
                '/${current_user.email}/getBlogContent.do?id=${blog.id}',
            </c:otherwise>
        </c:choose>function(md){
            testEditor = editormd("test-editormd", {
                width: "90%",
                height: 740,
                path : '/editormd/lib/',
                theme : "lignt",
                previewTheme : "light",
                editorTheme : "paraiso-light",
                toolbarIcons:function() {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return [
                                "undo", "redo", "|",
                                "bold", "del", "italic", "quote", "ucwords", "uppercase", "lowercase", "|",
                                "h1", "h2", "h3", "h4", "h5", "h6", "|",
                                "list-ul", "list-ol", "hr", "|",
                                "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime",  "html-entities", "pagebreak", "|",
                                "goto-line", "watch", "preview", "fullscreen", "clear", "search", "|",
                                "help", "info", "|", "submit"
                            ]
                },
                markdown : md,
                codeFold : true,
                //syncScrolling : false,
                saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
                searchReplace : true,
                //watch : false,                // 关闭实时预览
                htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                //toolbar  : false,             //关闭工具栏
                //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
                //emoji : true,
                toolbarIconTexts:{
                    submit : "提交博客"
                },
                taskList : true,
                tocm            : true,         // Using [TOCM]
                tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                flowChart : true,             // 开启流程图支持，默认关闭
                sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
                //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
                //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
                //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
                //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
                //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/${current_user.email}/uploadImage.do",
                onload : function() {
                    console.log('onload', this);
                    //this.fullscreen();
                    //this.unwatch();
                    //this.watch().fullscreen();

                    //this.setMarkdown("#PHP");
                    //this.width("100%");
                    //this.height(480);
                    //this.resize("100%", 640);
                },
                // 自定义工具栏按钮的事件处理
                toolbarHandlers : {
                    /**
                     * @param {Object}      cm         CodeMirror对象
                     * @param {Object}      icon       图标按钮jQuery元素对象
                     * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
                     * @param {String}      selection  编辑器选中的文本
                     */
                    submit : function(cm, icon, cursor, selection) {
                        $('#myModal').modal('show');
                        console.log("subminting", this);
                    }
                }
            })
        });
    });

    function submit(){
        console.log('right');
        <c:choose>
        <c:when test="${empty blog}">
            $.ajax({
                url: "/${current_user.email}/createBlog.do",
                type : "POST",
                data : {
                    'title':document.getElementById('blog-title').value,
                    'type':document.getElementById('blog-type').value,
                    'content':testEditor.getMarkdown()
                },
                success : function(data){
                    if(data == null) {
                        alert("提交失败");
                    }
                    else {
                        alert("提交成功");
                        window.location.href="/${current_user.email}/blog?id=" + data.id;
                    }
                },
                error : function(data) {
                    alert("提交失败");
                }
            });
        </c:when>
        <c:otherwise>
        $.ajax({
            url: "/${current_user.email}/editBlog.do",
            type : "POST",
            data : {
                'title':document.getElementById('blog-title').value,
                'type':document.getElementById('blog-type').value,
                'content':testEditor.getMarkdown(),
                'id':${blog.id}
            },
            success : function(data){
                if(data == null) {
                    alert("提交失败");
                }
                else {
                    alert("提交成功");
                    window.location.href="/${current_user.email}/blog?id=" + ${blog.id};
                }
            },
            error : function(data) {
                alert("提交失败");
            }
        });
        </c:otherwise>
        </c:choose>
    }
</script>
</body>
</html>