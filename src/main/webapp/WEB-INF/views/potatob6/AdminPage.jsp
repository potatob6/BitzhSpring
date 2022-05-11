<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!--引入标签库-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <script src="${pageContext.request.contextPath}/static/potatob6/js/jquery-3.6.0.min.js"></script>
        <title>管理员个人页面</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-size: 1.1rem;
            }

            body {
                position: relative;
                width: 100vw;
                height: 100vh;
                background: url("${pageContext.request.contextPath}/static/potatob6/svg/AdminPage_bg.svg") center center no-repeat;
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-content: center;
            }

            #selfCenter {
                margin: 50px;
                left: 50px;
                top: 50px;
                width: 400px;
                bottom: 50px;
                backdrop-filter: blur(2rem);
                -webkit-backdrop-filter: blur(2rem);
                box-shadow: 0 0 18px rgba(70,70,70,0.2);
                border: 1px solid #dbe2ef;
                border-radius: 10px;
                flex-shrink: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                transition: all 0.3s;
            }

            #items {
                width: 100%;
                margin: 50px;
                margin-left: 0;
                min-width: 700px;
                flex-shrink: 1;
                display: grid;
                grid-template-columns: repeat(auto-fit, 202px);
                grid-template-rows: repeat(auto-fit, 202px);
                grid-gap: 30px;
                justify-items: center;
                align-items: center;
            }

            .item {
                width: 100%;
                height: 200px;
                backdrop-filter: blur(2rem);
                -webkit-backdrop-filter: blur(2rem);
                border: 1px solid #dbe2ef;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                position: relative;
                box-shadow: 0 0 30px rgba(70,70,70,0.2);
                border-radius: 10px;
                transition: all 0.3s;
                flex-shrink: 0;
            }

            .item:hover {
                box-shadow: 0 0 10px rgba(70,70,70,0.2);
                backdrop-filter: blur(0.3rem);
                -webkit-backdrop-filter: blur(0.3rem);
                cursor: pointer;
                transform: scale(0.97);
            }

            img {
                width: auto;
                height: 50%;
            }

            img:hover {
                cursor: pointer;
            }

            p {
                flex-shrink: 0;
            }

            .corner {
                border-radius: 30px;
                height: 30px;
                width: 30px;
                background-color: #f73859;
                position: absolute;
                right: 0;
                top: 0;
                transform: translate(15px, -15px);
                color: white;
                text-align: center;
                line-height: 30px;
                justify-content: center;
                align-items: center;
            }

            #avatar {
                width: 100px;
                height: 100px;
                border-radius: 50px;
            }

            hr {
                width: 60%;
                height: 4px;
                background-color: rgba(70,70,70,0.3);
                border-radius: 2px;
                border: none;
                margin: 40px 0;
            }

            p {
                margin: 20px 0;
            }

            #fold {
                position: absolute;
                width: 100%;
                height: 54px;
                background-color: #005691;
                top: 0; left: 0;
                display: flex;
                flex-direction: row;
                justify-content: flex-start;
                border-radius: 10px 10px 0 0;
            }
        </style>
    </head>

    <body>
        <div id="selfCenter">
            <div id="fold">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/fold.svg" onclick="fold()" style="margin: 12px ; margin-left: 20px;width: 30px; height: 30px" />
            </div>
            <c:if test="${admin.avatarPath == null || admin.avatarPath.equals(\"\")}">
                <img width="100" id="avatar" height="100" src="${pageContext.request.contextPath}/static/avatars/default.svg" />
            </c:if>

            <c:if test="${!(admin.avatarPath == null || admin.avatarPath.equals(\"\"))}">
                <img width="100" id="avatar" height="100" src="${pageContext.request.contextPath}/${admin.avatarPath}" />
            </c:if>
            <hr>
            <p>欢迎，${admin.adminName}</p>
            <p>管理员编号:${admin.adminId}</p>
            <p>图书管理后台系统</p>
            <hr>
        </div>
        <div id="items">
<%--            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/NotHandled'">--%>
<%--                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminPage1.svg" />--%>
<%--                <p>查看待办审核</p>--%>
<%--                <c:if test="${n1 != 0}">--%>
<%--                    <div class="corner">${n1}</div>--%>
<%--                </c:if>--%>
<%--            </div>--%>
<%--            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/Exams'">--%>
<%--                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminPage1.svg" />--%>
<%--                <p>查看所有的审核</p>--%>
<%--            </div>--%>
            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/Admins'">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminPage5.svg" />
                <p>查看所有管理员</p>
            </div>
            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/Borrow'">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminPage2.svg" />
                <p>管理用户借阅</p>
            </div>
            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/Users'">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminPage4.png" />
                <p>管理用户</p>
            </div>
            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/Books'">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminBooks.svg" />
                <p>管理图书</p>
            </div>
            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/toAdminNews'">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/news.svg" />
                <p>管理新闻</p>
            </div>
            <div class="item" onclick="window.location.href='${pageContext.request.contextPath}/Admin/Options'">
                <img src="${pageContext.request.contextPath}/static/potatob6/svg/AdminPage3.svg" />
                <p>设置中心</p>
            </div>
            <div class="item">
                <img onclick="window.location.href='${pageContext.request.contextPath}/admin/logout'"
                src="${pageContext.request.contextPath}/static/potatob6/svg/AdminLogout.svg" />
                <p>登出</p>
            </div>
        </div>

        <script lang="JavaScript">
            var folded = false;
            function fold() {
                if(folded) {
                    $("#selfCenter").css("width", "400px")
                    let chs = document.getElementById("selfCenter").children
                    for (var i = 1; i < chs.length; i++) {
                        chs[i].style.opacity = "1";
                    }
                } else {
                    $("#selfCenter").css("width", "70px")
                    let chs = document.getElementById("selfCenter").children
                    for (var i = 1; i < chs.length; i++) {
                        chs[i].style.opacity = "0";
                    }
                }
                folded = !folded
            }
        </script>
    </body>
</html>