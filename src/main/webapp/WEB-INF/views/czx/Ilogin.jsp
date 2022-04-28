<%--
  Created by IntelliJ IDEA.
  User: 星包客
  Date: 2022/4/28
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <!--BootStrap设计的页面支持响应式的 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Y0looo/bootstrap-3.4.1-dist/css/bootstrap.min.css" type="text/css"/>
    <!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/potatob6/js/jquery-3.6.0.min.js" ></script>
    <!--引入BootStrap的JS的文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/Y0looo/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/czx/css/login.css" />
    <script>

    </script>
    <style>
        #logo{width:100%;background-color: #f9fafa;}
        .row{margin-left: 0px;margin-right: 0px;}
        #logo ul{float:right;}
        #logo ul li{list-style: none;float:left;padding: 5px 10px;line-height: 40px;}
        .logoI{float:left;}
    </style>
</head>
<body style="background:url(${pageContext.request.contextPath}/static/czx/img/gds.jpg) no-repeat;">
<div class="container">
    <div id="logo" class="row">
        <div class="col-xs-6 col-sm-6" class="logoI">
        </div>
    </div>
    <!--导航条-->
    <div class="login">
        <div class="header">
            <div class="switch">
                <a href="#" class="switch_login" id="switch_login">后台登录</a>
                <div class="switch_bottom" id="switch_bottom" style="position: absolute;width:70px;left:0px;">
                </div>
            </div>
        </div>
        <!--登录-->
        <div class="qlogin" id="qlogin">
            <div class="web_login" align="center">
                <form action="${pageContext.request.contextPath}/login.action" method="post"  onsubmit="return checkValue()">
                    <font style="color:#ff0000;font-size:16px;">${msg }</font>
                    <div style="height:10px;"></div>
                    <div class="uname" class="input-group">
								<span class="input-group-addon">
									<img src="${pageContext.request.contextPath}/static/czx/img/username.png" />
								</span>
                        <input type="text" name="loginName" id="loginName" class="form-control" placeholder="请输入登录账号"/>
                    </div>
                    <div class="upwd" class="input-group">
								<span class="input-group-addon">
									<img src="${pageContext.request.contextPath}/static/czx/img/password.png" />
								</span>
                        <input type="password" name="password" id="password" class="form-control" placeholder="密码"/>
                    </div>
                    <div style="padding-left: 100px; margin-top: 20px;">
                        <button class="btn btn-primary btn-lg" style="width:150px">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function checkValue() {
            var str = document.getElementById("loginName").value;
            if (str.length < 1) {
                alert("请输入账号");
                document.getElementById("loginName").focus();
                return false;
            }
            str = document.getElementById("password").value;
            if (str.length < 1) {
                alert("请输入密码");
                document.getElementById("password").focus();
                return false;
            }
            return true;
        }
        window.onload=function(){
            var oSwitch_login=document.getElementById('switch_login');
            var oSwitch_regist=document.getElementById('switch_regist');
            var oQlogin=document.getElementById('qlogin');
            var oQregist=document.getElementById('qregist');
            var oSwitch_bottom=document.getElementById('switch_bottom');
            oSwitch_login.onclick=function(){
                oSwitch_login.style.color='#333';
                oSwitch_regist.style.color='#999';
                oQlogin.style.display='block';
                oQregist.style.display='none';
                oSwitch_bottom.style.left='0px';
                oSwitch_login.style.textDecoration='none';
            }
            oSwitch_regist.onclick=function(){
                oSwitch_login.style.color='#999';
                oSwitch_regist.style.color='#333';
                oQlogin.style.display='none';
                oQregist.style.display='block';
                //oSwitch_bottom.animate({left:'154px',width:'70px'});
                oSwitch_bottom.style.left='150px';
                oSwitch_regist.style.textDecoration='none';
            }
        };
    </script>
</div>
</body>
</html>
