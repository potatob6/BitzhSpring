<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/static/Y0looo/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/static/potatob6/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/Y0looo/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
        <title>借阅信息</title>
        <style type="text/css">
            body {
                width: 80%;
                margin: 0 auto;
                height: auto;
            }

        </style>
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
                                <a href="${pageContext.request.contextPath}/toAllBorrows" >
                                    所有借阅
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/toNotReturnBorrows" >
                                    未归还借阅
                                </a>
                            </li>
                            <li >
                                <a href="${pageContext.request.contextPath}/toIsReturnBorrows" >
                                    已归还借阅
                                </a>
                            </li>
                            <li >
                                <a href="${pageContext.request.contextPath}/toWillOverTimeBorrows" >
                                    即将到期
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
        <h2>借阅信息</h2>
        <div>
            <table class="table table-striped">
                <tr>
                    <th>借阅编号</th>
                    <th>图书名称</th>
                    <th>借阅日期</th>
                    <th>归还期限（天）</th>
                    <th>归还日期</th>
                    <th>操作</th>
                </tr>
        <c:if test="${!empty(borrow)}">
            <c:forEach var="borrow" items="${borrow}">
                <tr>
                    <td>${borrow.getBorrowId()}</td>
                    <td>${borrow.getBookName()}</td>
                    <td>${borrow.getBorrowDate()}</td>
                    <td>${borrow.getTimeLimit()}</td>
                    <td>${borrow.getReturnDate()}</td>
                <c:if test="${empty(borrow.getReturnDate())}">
                    <td>
<%--                        <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='${pageContext.request.contextPath}/return?bookId=${borrow.getBookId()}&borrowId=${borrow.getBorrowId()}'">归还</button>--%>
                        <button type="button" class="btn btn-primary btn-lg" onclick="returnBook(${borrow.getBookId()},${borrow.getBorrowId()})">归还</button>
                    </td>
                </c:if>
                </tr>
            </c:forEach>
        </c:if>
            </table>
        </div>
    </body>
    <script>
        function returnBook(bookId,borrowId){
            if(confirm("你确定要归还吗？")){
                window.location.href="${pageContext.request.contextPath}/return?bookId=" + bookId + "&borrowId=" + borrowId ;
            }
        }
    </script>
</html>
