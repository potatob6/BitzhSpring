<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/static/Y0looo/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/static/potatob6/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/Y0looo/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
        <title>图书列表</title>
        <style type="text/css">
            body {
                width: 80%;
                margin: 0 auto;
                height: auto;
            }
        </style>
        <script>
            function form1Submit(){
                var bookName = form1.bookName.value;
                if(bookName == null || bookName == ""){
                    alert("请填写图书名称!");
                    return false;
                }
                var reg = new RegExp("^[A-Za-z0-9\u4e00-\u9fa5]+$");
                if(!reg.test(bookName)){
                    alert("请输入中文、数字或英文");
                    return false;
                }
                return true;
            }
            function form2Submit(){
                var author = form2.author.value;
                if(author == null || author == ""){
                    alert("请填写作者名称!");
                    return false;
                }
                var reg = new RegExp("^[A-Za-z0-9\u4e00-\u9fa5]+$");
                if(!reg.test(author)){
                    alert("请输入中文、数字或英文");
                    return false;
                }
                return true;
            }


        </script>
    </head>
    <body>
        <div id="nav">
            <nav class="navbar navbar-default" role="navigation" style="background-color:#fff">
                <div class="container-fluid">
                    <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
                        <a class="navbar-brand " href="#"><p class="text-primary">图书管理系统——用户</p></a>
                    </div>
                    <div class="collapse navbar-collapse" id="example-navbar-collapse">
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <a href="${pageContext.request.contextPath}/toBooks" >
                                    所有图书
                                </a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/toLastPage">返回上一页<span class="glyphicon glyphicon-log-in"></span></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <h2>图书信息</h2>
        <div>
            <form class="form-inline" action="${pageContext.request.contextPath}/queryBookByBookName" method="post" name="form1">
                <div class="form-group">
                    <label class="sr-only" for="exampleInputAmount1"></label>
                    <div class="input-group">
                        <div class="input-group-addon">图书名称</div>
                        <input type="text" class="form-control" id="exampleInputAmount1" name="bookName">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return form1Submit();">查询图书</button>
            </form>
            <form class="form-inline" action="${pageContext.request.contextPath}/queryBookByAuthor" method="post" name="form2">
                <div class="form-group">
                    <label class="sr-only" for="exampleInputAmount2"></label>
                    <div class="input-group">
                        <div class="input-group-addon">作者名称</div>
                        <input type="text" class="form-control" id="exampleInputAmount2" name="author">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return form2Submit();">查询图书</button>
            </form>
            <table class="table table-striped">
                <tr>
                    <th>图书编号</th>
                    <th>图书名称</th>
                    <th>图书作者</th>
                    <th>出版社</th>
                    <th>库存</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
                <c:if test="${!empty(books)}">
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.getBookId()}</td>
                            <td>${book.getBookName()}</td>
                            <td>${book.getAuthor()}</td>
                            <td>${book.getPublisher()}</td>
                            <td>${book.getStorageCount()}</td>
                            <td>${book.getPrice()}</td>
                            <td>
<%--                                <button id="borrow" type="button" class="btn btn-primary btn-lg" onclick="window.location.href='${pageContext.request.contextPath}/borrow?bookId=${book.getBookId()}'">借阅</button>--%>
                                <button type="button" class="btn btn-primary btn-lg" value="${book.getBookId()}" onclick="borrow(${book.getBookId()})">借阅</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </body>
    <script>
        function borrow(bookId){
            if(confirm("你确定要借阅吗？")){
                window.location.href="${pageContext.request.contextPath}/borrow?bookId=" + bookId;
            }
        }
    </script>
</html>
