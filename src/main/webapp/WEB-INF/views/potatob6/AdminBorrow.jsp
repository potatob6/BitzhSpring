<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <script src="${pageContext.request.contextPath}/static/potatob6/js/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/potatob6/js/jquery-3.6.0.min.js"></script>
    <title>所有借阅</title>
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
            flex-shrink: 0;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            transition: all 0.3s;
            overflow: hidden;
        }

        #items {
            width: 100%;
            margin: 50px;
            margin-left: 0;
            min-width: 700px;
            flex-shrink: 1;
            backdrop-filter: blur(1.5rem);
            -webkit-backdrop-filter: blur(1.5rem);
            border: 1px solid #dbe2ef;
            border-radius: 10px;
            box-shadow: 0 0 18px rgba(70,70,70,0.2);
            display: flex;
            flex-direction: column;
            overflow: hidden;
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
            transform: scale(1.03);
        }

        img {
            width: auto;
            height: 50%;
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

        img:hover {
            cursor: pointer;
        }

        #items_top {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-shrink: 0;
            background-color: #005691;
            border-radius: 10px 10px 0 0;
        }

        #items_top > * {
            margin: 16px 0;
            color: white;
        }

        tr, tbody {
            width: 100%;
        }

        td, th {
            text-align: center;
            margin: 10px 0;
            word-break: keep-all;
        }

        table {
            width: 100%;
            padding: 20px;
        }

        button {
            width: 80px;
            height: 40px;
            border-radius: 7px;
            background-color: #17b978;
            outline: none;
            border: none;
            transition: all 0.3s;
            color: white;
            font-size: small;
        }

        button:hover {
            cursor: pointer;
        }

        .accept:hover {
            background-color: #086972;
        }

        .reject {
            background-color: #fa4659;
        }

        .reject:hover {
            background-color: #b80d57;
        }

        #page_bar {
            width: 100%;
            height: 50px;
            position: absolute;
            bottom: 0;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-shrink: 0;
        }

        .opera {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        .opera > button {
            margin: 0 2px;
        }

        .lists {
            flex-shrink: 1;
            overflow-y: scroll;
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
        <img src="${pageContext.request.contextPath}/static/potatob6/svg/fold.svg" onclick="fold()" style="margin: 12px 20px; width: 30px; height: 30px" />
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
    <div id="items_top">
        <div style="width: 20px; flex-shrink: 0"></div>
        <img onclick="window.location.href=${pageContext.request.contextPath}/Admin/" style="width: 22px; height: 22px; flex-shrink: 0" src="${pageContext.request.contextPath}/static/potatob6/svg/return.svg" />
        <p style="flex-shrink: 1; margin: 0;margin-left: 20px;margin-top: 16px;width: 100%;text-align: center">所有借阅</p>
        <div style="width: 20px; flex-shrink: 0"></div>
    </div>

    <div class="lists" style="width: 100%;">
        <table>
            <tbody id="tbody1">
            <tr>
                <th>借阅Id</th>
                <th>图书</th>
                <th>用户</th>
                <th>借阅时间</th>
                <th>期限</th>
                <th>归还时间</th>
                <th>操作</th>
            </tr>

            <c:forEach var="item" items="${list}">
                <tr id="trexam${item.borrowId}">
                    <td>${item.borrowId} </td>
                    <td>${item.bookId} </td>
                    <td>${item.userId} </td>
                    <td>${item.borrowDate} </td>
                    <td>${item.timeLimit} </td>
                    <td>${item.returnDate}</td>
                    <td class="opera">
                        <button class="reject" onclick="forceReturn(${item.borrowId})">强制归还</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="page_bar">
        <img src="${pageContext.request.contextPath}/static/potatob6/svg/loadmore.svg" onclick="loadPage()" style="width: 30px; height: 30px" />
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

<script>
    function forceReturn(n) {
        if (confirm("确认归还？") === false) {
            return;
        }
        axios({
            url: '${pageContext.request.contextPath}/admin/borrow/forceReturn',
            data: {
                Id: n
            },
            method: 'POST'
        }).then(response => {
            let resp = JSON.parse(response.data);
            if(resp.status !== undefined && resp.status === 'success') {
                document.getElementById("trexam"+n).remove();
                return;
            }

            alert("错误");
        })
    }
</script>
</body>
</html>