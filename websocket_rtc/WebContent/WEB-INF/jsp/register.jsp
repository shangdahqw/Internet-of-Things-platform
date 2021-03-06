<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link href="css/webnet_rtc.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/layer.css" >
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
</head>
<body>
	<div class="top1">
		<div class="wrap top1_in">
			您好，欢迎访问物联网平台!
				<c:if test="${empty sessionScope.user}">
				     <a href="index.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
               		 <a href="servlet/RegisterUIServlet">注册</a> 		 		 	 
				</c:if>
				<c:if test="${!empty sessionScope.user}">
				     <font color="red" style="font-size:14px;font-weight:bold">${sessionScope.user.username}</font>&nbsp;&nbsp;|&nbsp;&nbsp;
	 		 	 	 <a href="servlet/LoginOutServlet">退出</a>
				</c:if>
			

        </div>
    </div>
    <div class="clear"></div>
    
<!-- *******************************************************-->
    <div class="bggray">
  		<div class="wrap">
  			<div class="login wrap">
	    			<div class="login_R fr">
	    				<h1><img src="css/reg.png"></h1>
  						<div class="login_k">
  							<form name="myform" >
  								<div class="tb4">
  									<ul>
  										<li class="tb41"><i>*</i>登陆账号：</li>
  										<li class="tb43"><input name="username" type="text" class="tb3"></li>
  									</ul>
  								</div>								
  								<div class="tb4">
  									<ul>
  										<li class="tb41"><i>*</i>用户密码：</li>
  										<li class="tb43"><input name="password" type="password" class="tb3"></li>
  									</ul>
  								</div>
  								<div class="tb4">
  									<ul>
  										<li class="tb41"><i>*</i>密码确认：</li>
  										<li class="tb43"><input name="repass" type="password" class="tb3"></li>
  									</ul>
  								</div>
  								<div class="tb5">
  									<ul>
  										<li class="tb44">&nbsp;&nbsp;&nbsp;&nbsp;</li>
  										<li class="tb45"><a href="index.jsp" style="color:#e20439;">有账号，去登陆！</a></li>
  									</ul>
  								</div>
  								<div class="tb4">
  									<input type="button" name="button" onclick="return register()" value="注册" class="tb21">
  								</div>
  							</form>

  						</div>
	    			
	    			</div>
	    			<div class="fl login_L">
  						<a href="index.jsp"><img src="css/sdd1.png"></a>
  				    </div>
  			</div>
  			<script type="text/javascript">
					function check(){				
						if(document.myform.username.value==""){						
							layer.msg('请填写账户');							
							document.myform.username.focus();							
							return false;    							
						}		
						if(document.myform.password.value==""){
							layer.msg('请确认密码');					
							document.myform.password.focus();							
							return false;							
						}
						if(document.myform.password.value!=document.myform.repass.value){							
							
							layer.msg('两次输入的密码不一致');
							document.myform.repass.focus();												
							return false;							
						}
						
						return true;
					}
					
					function createXMLHttpRequest() {
				      	try {
				      		return new XMLHttpRequest();//大多数浏览器
				      	} catch (e) {
							alert("浏览器不支持!");
							throw e;
				      	}	
				 	}
		
					function register(){ 
						if(check()){
							var username=document.myform.username.value;
							var password=document.myform.password.value;
							var xmlHttp = createXMLHttpRequest();
							xmlHttp.open("POST", "<c:url value='/servlet/RegisterServlet'/>", true);
							xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					   		xmlHttp.send('username='+username+'&password='+password);
					   		xmlHttp.onreadystatechange = function() {
					   			if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					   				
					   				var jsonMsg = xmlHttp.responseText;
					   				var jsonMsg = JSON.parse(jsonMsg);  
					   				if(jsonMsg.username_error!=null){
					   					document.myform.username.value="";
					   					document.myform.password.value="";
					   					document.myform.repass.value="";
				      					layer.msg(jsonMsg.username_error);
				      					document.myform.username.focus();
				      					return;
				
				      				} else if(jsonMsg.password_error!=null){
				      					document.myform.password.value="";
				      					document.myform.repass.value="";
				      					document.myform.username.value=jsonMsg.username;
				      					layer.msg(jsonMsg.password_error);
				      					document.myform.password.focus();
				      					return;
				      				}
				      				else{
				      					layer.msg(jsonMsg.success);
				      					window.setTimeout("window.location.href = 'index.jsp'",2000); 
				      				}					     				
					   			}
					   		};			
						}				 	
					}					
					
									
				</script>
  		
  		</div>
  	</div>
  
<!-- foot*******************************************************-->			
	<div class="foot">
		<div class="wrap">
			<div class="friendlink">
				<div class="tit3"><img src="css/index_53.png">
				</div>
				<div class="clear">
				</div>			
				<ul><li><a href="http://www.shu.edu.cn/IndexPage.html">上海大学官网</a></li><li>|</li></ul>
				<ul><li><a href="http://www.jwc.shu.edu.cn/jwc.html">上海大学教务处</a></li><li>|</li></ul>
				<ul><li><a href="http://www.xgb.shu.edu.cn/Default.aspx">上海大学学生办公室</a></li><li>|</li></ul>
			</div>
			<div class="clear"></div>						
		</div>
	</div>
	<div class="foot2">
		<div class="wrap">
			版权所有   物联网平台     小琳科技
		</div>
	</div>
	
</body>
</html>