<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/23
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的稿件</title>
</head>
<body>
<table id="dg" title="菜单管理" class="easyui-datagrid" style="width:1500px;height:500px"
       url="http://localhost:8083/words/getAllWord"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="false"
       pagination="true"
>
    <thead>
    <tr>
        <th field="id" width="50">稿件编号</th>
        <th field="uid" width="50">作者编号</th>
        <th field="title" width="100">标题</th>
        <th field="createtime" width="100">投稿日期</th>
        <th field="parentId" width="100">稿件状态</th>
        <th field="btid" width="100">稿件类型</th>
        <th field="xxxx" width="100">操作</th>
    </tr>
    </thead>
</table>
</body>
</html>
