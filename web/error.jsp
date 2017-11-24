<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/6
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var err=$("#err").val()+"";
            alert(err);
            location.href="login.jsp";
        })

    </script>
    <title>登入失败</title>
</head>
<body>
<input type="hidden" id="err" value="${err}"/>
</body>
</html>
