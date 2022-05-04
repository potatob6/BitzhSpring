<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传</title>
    <script>
        // 判断是否填写上传人并已选择上传文件
        function check() {
            var name = document.getElementById("username").value;
            var file = document.getElementById("file").value;
            if (name == "") {
                alert("填写上传人");
                return false;
            }
            if (file.length == 0 || file == "") {
                alert("请选择上传文件");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<form action="<c:url value='/fileUpload'/>"
      method="post" enctype="multipart/form-data" onsubmit="return check()">
    上传人：<input id="username" type="text" name="username" /><br />
    请选择文件：<input id="file" type="file" name="uploadfile" multiple="multiple" /><br />
    <input type="submit" value="上传" />
</form>
</body>
</html>
