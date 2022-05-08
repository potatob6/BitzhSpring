<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/dqy/css/base.css"/>
        <script type="text/javascript" language="javascript">
            function checkNews(){
                var title = form1.Ntitle.value;
                if ((title==null)||(title=="")){
                    alert("请填写标题！");
                    return false;
                }
                var createTime = form1.NcreateTime.value;
                if ((createTime==null)||(createTime=="")){
                    alert("请填写时间！");
                    return false;
                }
                var content = form1.Ncontent.value;
                if ((content==null)||(content=="")){
                    alert("请填写内容！");
                    return false;
                }
                var editor = form1.Neditor.value;
                if ((editor==null)||(editor=="")){
                    alert("请填写作者！");
                    return false;
                }
                var publisher = form1.Npublisher.value;
                if ((publisher==null)||(publisher=="")){
                    alert("请填写发布者！");
                    return false;
                }
                if(confirm("确定修改新闻？")){
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body class=" dashboard">
        <div id="container">
            <div id="header">
                <div id="branding">
                    <h1 >星星图书馆后台发布系统</h1>
                </div>
                <div id="user-tools">
                    <a href="${pageContext.request.contextPath}/toAdminNews">返回上一页</a>
                </div>
            </div>
            <div id="content" margin-right: 600px;>
                <div id="content-main">
                    <h1><b>编辑新闻</b></h1><br>
                    <div>
                        <form method="post" action="editNews" name="form1">
                            <table>
                                <tr>
                                    <td>标题:</td>
                                    <td><input type="text" name="Ntitle" size="50" value="${news.getNtitle()}"/></td>
                                </tr>
                                <tr>
                                    <td>时间:</td>
                                    <td><input type="text" name="NcreateTime" size="50" value="${news.getNcreateTime()}" readonly="readonly"/></td>
                                </tr>
                                <tr>
                                    <td>作者:</td>
                                    <td><input type="text" name="Neditor" size="50" value="${news.getNeditor()}"></td>
                                </tr>
                                <tr>
                                    <td>发布者:</td>
                                    <td><input type="text" name="Npublisher" size="50" value="${news.getNpublisher()}"></td>
                                </tr>
                                <tr>
                                    <td>内容:</td>
                                    <td><textarea name="Ncontent" rows="20" cols="50" >${news.getNcontent()}</textarea></td>
                                </tr>
                                <tr>
                                    <td>通知类型:</td>
                                    <td><select name="Ntype" >
                                        <c:if test="${!empty(list)}">
                                            <c:forEach var="type" items="${list}">
                                                <option value="${type.getTno()}">${type.getTtypeName()}</option>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty(list)}">
                                            对不起，没有数据
                                        </c:if>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td><input type="submit" value="提交" name="submit" onclick="return checkNews();"/></td>
                                    <td><input type="reset" value="重置" name="reset"/></td>
                                    <td><input type="hidden" name="Nno" value="${news.getNno()}"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
