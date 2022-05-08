<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>星星图书馆新闻后台系统</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/dqy/css/base.css"/>
    </head>
    <body class="dashboard">
      <div id="container">
        <div id="header">
          <div id="branding">
            <h1 id="site-name">星星图书馆新闻后台系统</h1>
          </div>
          <div id="user-tools">
            <a href="${pageContext.request.contextPath}/toAddNews">发布新闻</a>
            <a href="${pageContext.request.contextPath}/Admin">返回主页</a>
          </div>
        </div>
        <div id="content" class="colMS">
          <div class="tab-main mx-auto">
            <input id="tab1" type="radio" name="tabs">
            <label for="tab1" style="text-align: center"><a style="text-decoration: none" href="${pageContext.request.contextPath}/toAdminNewsByType?typeId=1">综合新闻</a></label>
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2" style="text-align: center"><a style="text-decoration: none" href="${pageContext.request.contextPath}/toAdminNewsByType?typeId=2">通知公告</a></label>
            <input id="tab3" type="radio" name="tabs">
            <label for="tab3" style="text-align: center"><a style="text-decoration: none" href="${pageContext.request.contextPath}/toAdminNewsByType?typeId=3">媒体关注</a></label>
            <hr>
<%--            <section id="content1">--%>
              <div>
                <table>
                    <c:if test="${!empty(news)}">
                      <c:forEach var="news" items="${news}">
                      <tr>
                        <th scope="row" colspan="3">新闻标题</th>
                        <th scope="row" colspan="3">发布时间</th>
                        <th scope="row" colspan="3">新闻类型</th>
                        <th colspan="3">操作</th>
                      </tr>
                      <tr>
                        <td colspan="3">${news.getNtitle()}</td>
                        <td colspan="3">${news.getNcreateTime()}</td>
                        <td colspan="3">${news.getTtypeName ()}</td>
                        <td colspan="3">
                            <button style="background-color: #79aec8; color: #fff" onclick="window.location.href='${pageContext.request.contextPath}/toEditNews?newsId=${news.getNno()}'">编辑</button>
<%--                          <button style="background-color: #f5dd5d; color: #fff" onclick="window.location.href='${pageContext.request.contextPath}/deleteNews?newsId=${news.getNno()}'">删除</button>--%>\
                            <button style="background-color: #f5dd5d; color: #fff" onclick="deleteNews(${news.getNno()})">删除</button>
                        </td>
                      </tr>
                      </c:forEach>
                    </c:if>
                </table>
              </div>
<%--            </section>--%>
          </div>
          <br class="clear">
          </div>
        </div>
      </div>
    </body>
    <script>
        function deleteNews(newsId) {
            if(confirm("你确定要删除这条新闻吗？")){
                window.location.href="${pageContext.request.contextPath}/deleteNews?newsId=" + newsId;
            }
        }
    </script>
</html>
