<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<link href="/css/register_style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		
</head>

<script>
	function check_password() {
		var pwd = document.getElementById("password").value;
		var c_pwd = document.getElementById("confirm_password").value;
		//alert("hahha");
		//alert(pwd + " " + c_pwd);
		if(pwd != c_pwd){
			alert("两次密码输入不一致");
			return false;
		}
		return true;
	}

</script>
 
<body>
	<div class="main">
				 <!-----start-main---->
				 <div class="inset">
				 	<div class="social-icons">
		    			 <div class="span"><a href="#"><img src="/images/register_fb.png" alt=""/><i>Connect with Facebook </i><div class="clear"></div></a></div>
    					 <div class="span1"><a href="#"><img src="/images/register_t-bird.png" alt=""/><i>Connect with Twitter</i><div class="clear"></div></a></div>
    					 <div class="clear"></div>
					</div>
				 </div>	
				 <h2>Sign up with</h2>
				 <form:form action="/register.do" commandName="user" method="post" role="form" onsubmit="return check_password();">
						<div class="lable">
							<input type="text" class="text" required="required" name="nickname" placeholder="输入昵称">
							<input name="email" type="email" class="text" required="required" placeholder="输入邮箱">
							<%--<input type="text" class="text" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}">--%>
						</div>
						<div class="clear"> </div>
						<div class="lable-2">
							<input type="password" id="password" name="password" required="required" class="text" placeholder="输入密码">
							<input type="password" id="confirm_password" required="required" onchange="check_password();" class="text" placeholder="输入确认密码">
						</div>
						<div class="clear"> </div>
						 <%--<h3>By creating an account, you agree to our <span><a href="#">Terms & Conditions</a> </span></h3>--%>
							 <div class="submit">
								<input id="submit_button" type="submit" value="创建您的账号" >
							</div>
								<div class="clear"> </div>
				 </form:form>
		<!-----//end-main---->
		</div>
		 <!-----start-copyright---->
   					<div class="copy-right">
						<%--<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></p> --%>
					</div>
	     <!-----//end-copyright---->
</body>
</html>