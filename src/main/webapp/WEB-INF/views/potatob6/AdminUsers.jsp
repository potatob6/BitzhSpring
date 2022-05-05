<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!--引入标签库-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <script src="${pageContext.request.contextPath}/static/potatob6/js/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/potatob6/js/jquery-3.6.0.min.js"></script>
    <title>管理用户</title>
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

        input {
            max-width: 150px;
            height: 40px;
            border-radius: 7px;
            outline: none;
            border: 1px solid #52616b;
            text-align: center;
            background: transparent;
        }

        #toolbar {
            padding: 10px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        #addbook_btn {
            height: 30px;
            border: 1px solid #52616b;
            background: transparent;
            color: black;
            transition: all 0.3s;
        }

        #addbook_btn:hover {
            color: white;
            background: #07689f;
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
        <p style="flex-shrink: 1; margin: 0;margin-left: 20px;margin-top: 16px;width: 100%;text-align: center">用户</p>
        <div style="width: 20px; flex-shrink: 0"></div>
    </div>

    <div id="toolbar">
        <c:if test="${searchWord == null}">
            <input id="searchInput" style="height: 30px; min-width: 30%; max-width: 50%" placeholder="搜索用户登录名 / 用户名">
        </c:if>
        <c:if test="${searchWord != null}">
            <input id="searchInput" style="height: 30px; min-width: 30%; max-width: 50%" placeholder="搜索用户登录名 / 用户名" value="${searchWord}">
        </c:if>
        <img onclick="search()" src="${pageContext.request.contextPath}/static/potatob6/svg/search.svg" style="margin: 0 10px;width: 24px; height: 24px; padding: 2px; border-radius: 7px; border: 1px solid #52616b" />
        <button id="addbook_btn" onclick="addBook()">添加用户</button>
    </div>

    <div class="lists" style="width: 100%;">
        <table>
            <tbody id="tbody1">
            <tr>
                <th>用户Id</th>
                <th>用户登录名</th>
                <th>用户名</th>
                <th>用户密码</th>
                <th>操作</th>
            </tr>

            <c:forEach var="item" items="${list}">
                <tr id="trbook${item.userId}">
                    <td>${item.userId}</td>
                    <td>${item.userLogin}</td>
                    <td>${item.userName}</td>
                    <td>${item.userPassword}</td>
                    <td class="opera">
                        <button class="reject" onclick="deleteBook(${item.userId})">删除</button>
                        <button class="accept" onclick="editBook(${item.userId})">编辑</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="page_bar">
        <img src="${pageContext.request.contextPath}/static/potatob6/svg/loadmore.svg" onclick="bookLoadPage()" style="width: 30px; height: 30px" />
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

<script lang="JavaScript">
    // 搜索图书
    function search() {
        let words = document.getElementById("searchInput").value;
        if(words !== '') {
            document.location.href='${pageContext.request.contextPath}/Admin/Users?words='+words;
        } else {
            document.location.href='${pageContext.request.contextPath}/Admin/Users';
        }
    }
</script>

<script lang="JavaScript">
    var page = ${page};
    function bookLoadPage() {
        axios({
            url: '${pageContext.request.contextPath}/admin/users/pageUsers',
            method: 'POST',
            data: {
                page: page + 1
            }
        }).then(response=>{
            const json = JSON.parse(response.data)
            if(json.status === 'success') {
                console.log(json)
                if(json.list.length !== 0) {
                    for(let i = 0; i < json.list.length; i++) {
                        let l = json.list[i]
                        let varNew = $("<tr id=\"trbook"+l.userId+"\"></tr>")
                        varNew.append($("<td>"+l.userId+"</td>"))
                        varNew.append($("<td>"+l.userLogin+"</td>"))
                        varNew.append($("<td>"+l.userName+"</td>"))
                        varNew.append($("<td>"+l.userPassword+"</td>"))

                        let n1 = $("<td class=\"opera\"></td>")
                        n1.append($("<button class=\"reject\" onclick=\"deleteBook("+l.userId+")\">删除</button>"))
                        n1.append($("<button class=\"accept\" onclick=\"editBook("+l.userId+")\">编辑</button>"))
                        varNew.append(n1)

                        $("#tbody1").append(varNew)
                    }

                    page ++;
                }
                else {
                    alert("没有更多内容了")
                }
            }
        })
    }
</script>

<script lang="JavaScript">
    var prevstatus = {};
    // 编辑
    function editBook(n) {
        if(prevstatus[n.toString()] !== undefined)
            return
        let tr = document.getElementById("trbook"+n);
        let children = tr.children;

        // 保存当前状态，以便取消
        prevstatus[n.toString()] = {
            userId: children[0].innerHTML,
            userLogin: children[1].innerHTML,
            userName: children[2].innerHTML,
            userPassword: children[3].innerHTML,
        };

        children[0].innerHTML = ""
        children[1].innerHTML = ""
        children[2].innerHTML = ""
        children[3].innerHTML = ""
        children[4].children[0].innerHTML = "确认"
        children[4].children[0].className = "accept"
        children[4].children[1].innerHTML = "取消"
        children[4].children[1].className = "reject"
        children[4].children[0].onclick = (e) => { commitEdit(n) }
        children[4].children[1].onclick = (e) => { cancelEdit(n, true) }


        let bookId_input = document.createElement("input");
        bookId_input.value = prevstatus[n.toString()].userId;
        bookId_input.readOnly = true;
        let bookName_input = document.createElement("input");
        bookName_input.value = prevstatus[n.toString()].userLogin;
        let author_input = document.createElement("input");
        author_input.value = prevstatus[n.toString()].userName;
        let publisher_input = document.createElement("input");
        publisher_input.value = prevstatus[n.toString()].userPassword;

        children[0].append(bookId_input);
        children[1].append(bookName_input);
        children[2].append(author_input);
        children[3].append(publisher_input);
    }

    // 提交更改
    function commitEdit(n) {
        let tr = document.getElementById("trbook"+n).children;
        let bookId = tr[0].children[0].value;
        let bookName = tr[1].children[0].value;
        let author = tr[2].children[0].value;
        let publisher = tr[3].children[0].value;

        axios({
            url: '${pageContext.request.contextPath}/admin/users/edit',
            method: 'POST',
            data: {
                userId: bookId,
                userLogin: bookName,
                userName: author,
                userPassword: publisher,
            }
        }).then(response => {
            console.log(response)
            let resp = JSON.parse(response.data);
            if(resp.status !== undefined && resp.status === 'success') {
                cancelEdit(n, false)
            } else {
                console.log(response);
            }
        })
    }

    // 撤销更改
    function cancelEdit(n, y) {
        if(prevstatus[n.toString()] === undefined)
            return

        let tr = document.getElementById("trbook"+n).children;
        let bookId, bookName, author, publisher, storageCount, price;
        if( y ) {
            bookId = prevstatus[n.toString()].userId;
            bookName = prevstatus[n.toString()].userLogin;
            author = prevstatus[n.toString()].userName;
            publisher = prevstatus[n.toString()].userPassword;
        } else {
            bookId = tr[0].children[0].value;
            bookName = tr[1].children[0].value;
            author = tr[2].children[0].value;
            publisher = tr[3].children[0].value;
        }

        tr[0].innerHTML = bookId;
        tr[1].innerHTML = bookName;
        tr[2].innerHTML = author;
        tr[3].innerHTML = publisher;
        tr[4].children[0].className = "reject"
        tr[4].children[0].innerHTML = "删除"
        tr[4].children[0].onclick = (e) => { deleteBook(n) }
        tr[4].children[1].className = "accept"
        tr[4].children[1].innerHTML = "编辑"
        tr[4].children[1].onclick = (e) => { editBook(n) }

        Reflect.deleteProperty(prevstatus, n.toString());
    }

    // 删除Tr条目
    function deleteTr(n) {
        let tr = document.getElementById("trbook"+n);
        tr.remove();
    }

    // 删除
    function deleteBook(n) {
        let t = confirm("确定要删除用户吗?");
        if(!t) {
            return ;
        }
        axios({
            url: '${pageContext.request.contextPath}/admin/users/delete',
            method: 'POST',
            data: {
                "userId": n
            }
        }).then(response => {
            let resp = JSON.parse(response.data);
            if(resp.status !== undefined && resp.status === 'success') {
                deleteTr(n);
            }
        })
    }

    var newBook = 1;

    // 添加图书
    function addBook() {
        let tb = document.getElementById("tbody1");
        let tr = document.createElement("tr");
        tr.id = "trnew" + newBook;
        tr.innerHTML += "<td><div /></td>";

        tr.innerHTML += "<td><input placeholder='用户登录名'></td>";
        tr.innerHTML += "<td><input placeholder='用户昵称'></td>";
        tr.innerHTML += "<td><input placeholder='用户密码'></td>";
        tr.innerHTML += "<td class='opera'><button class='accept' onclick='commitAdd("+newBook+")'>提交</button><button class='reject' onclick='cancelAdd("+newBook+")'>取消</button>";

        tb.append(tr);

        newBook ++;
    }

    function cancelAdd(n) {
        let tr = document.getElementById("trnew"+n);
        tr.remove();
    }

    function commitAdd(n) {
        let tr = document.getElementById("trnew"+n);
        console.log(tr);
        let trChildren = tr.children;
        console.log(trChildren);
        let bookName = trChildren[1].children[0].value;
        let author = trChildren[2].children[0].value;
        let publisher = trChildren[3].children[0].value;

        // 检查
        if (/^[ ]*$/.test(bookName)) {
            alert("图书名称不能为空");
            return;
        }

        let myData = {
            userLogin: bookName,
            userName: author,
            userPassword: publisher,
        };

        axios({
            url: '${pageContext.request.contextPath}/admin/users/add',
            method: 'POST',
            data: myData
        }).then(response => {
            let resp = JSON.parse(response.data);
            if(resp.status === 'success') {
                tr.className = 'trbook' + resp.userId;

                // bookId
                tr.children[0].innerHTML = resp.userId;
                // bookName
                tr.children[1].innerHTML = bookName;
                // bookName
                tr.children[2].innerHTML = author;
                // bookName
                tr.children[3].innerHTML = publisher;
                // buttons
                tr.children[4].children[0].className = "reject"
                tr.children[4].children[0].innerHTML = "删除"
                tr.children[4].children[0].onclick = (e) => { deleteBook(resp.bookId) }
                tr.children[4].children[1].className = "accept"
                tr.children[4].children[1].innerHTML = "编辑"
                tr.children[4].children[1].onclick = (e) => { editBook(resp.bookId) }
            } else {
                alert("错误")
            }
        })
    }
</script>
</body>
</html>