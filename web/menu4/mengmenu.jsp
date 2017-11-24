<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/12
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getContextPath();
    String path =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + basePath + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <base href="<%=path%>">
    <meta charset="UTF-8">
    <!--因为我们要用easyUI的界面,所以需要easyui的样式支持-->
    <link rel="stylesheet" type="text/css"
          href="../easyui/themes/default/easyui.css">
    <!--因为我们需要要看的界面,界面中需要图标,因此引用icon.css-->
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <!--因为easyUI是基于JQ写的,因此应用jq的js-->
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <!--因为easyUI拥有自己的事件,因此把jq.easyUI引用-->
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <!--因为分页是英文的,因此导入中文的js-->
    <script type="text/javascript"
            src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="../css/zdemo.css" type="text/css">


    <script type="text/javascript">
        //批量删除
        function destroyCategory() {
            var ids = "";
            var rows = $('#dg').datagrid('getSelections');//获取选中的多行数据
            for (var i = 0; i < rows.length; i++) {
                ids += rows[i].id + ",";
            }
            $.messager.confirm('Confirm', '确定要删除吗?', function (r) {
                if (r) {
                    //$.post 第一个参数 请求的url,第二个参数是 请求的时候传给后台的参数
                    //       第三个参数 回调函数 第四个参数 服务器端返回的数据类型
                    $.post('http://localhost:8083/Menu/delMenus', {id: ids}, function (result) {
                        if (result) {
                            alert("删除成功");
                            $('#dg').datagrid('reload');
                        } else {
                            alert("删除失败");
                        }
                    }, 'json');
                }
            });

        }


        function editCategory() {
            var row = $('#dg').datagrid('getSelected');//获取选中的一行数据
            if (row) {
                $('#dlg').dialog('open').dialog('setTitle', '编辑菜单');
                $('#fm').form('load', row); //将数据加载到表单中即回显
                url = 'http://localhost:8083/Menu/upMenus?id=' + row.id;
            }
        }

        function newCategory() {
            //打开对话框
            $('#dlg').dialog('open').dialog('setTitle', '添加菜单');//因为这个对话框添加 更新两用
            $('#fm').form('clear'); //清空fm表单
            url = 'http://localhost:8083/Menu/addMenus'

        }


        function saveMenu() {
            $('#fm').form('submit', {
                url:url,
                success: function (ds) {
                    if (ds) {
                        alert("成功");
                        $('#dlg').dialog('close');// 关闭当前对话框
                        $('#dg').datagrid('reload');// 重新加载数据
                    } else {
                        alert("失败");
                    }
                }
            });
        }

    </script>

    <title>菜单管理</title>

</head>
<body>
<table id="dg" title="菜单管理" class="easyui-datagrid" style="width:1500px;height:500px"
       url="http://localhost:8083/Menu/getMenu"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="false"
       pagination="true"
>
    <thead>
    <tr>
        <th field="id" width="50">菜单编号</th>
        <th field="name" width="100">菜单名称</th>
        <th field="url" width="100">路径</th>
        <th field="parentId" width="100">父级id</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="newCategory()">添加菜单</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="editCategory()">编辑菜单</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
       onclick="destroyCategory()">移除菜单</a>
</div>
<!--list end-->
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">Category Information</div>
    <form id="fm" method="post">

        <div class="fitem">
            <label>菜单名称:</label>
            <input name="name" class="easyui-validatebox" required>
        </div>
        <div class="fitem">
            <label>路径</label>
            <input name="url"  class="easyui-validatebox" >
        </div>
        <div class="fitem">
            <label>父级id</label>
            <input name="parentId" class="easyui-validatebox" >
        </div>
    </form>
    <div id="dlg1-buttons">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onClick="saveMenu()">Save</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel"
           onClick="javascript:$('#dlg').dialog('close')">Cancel</a>
    </div>
</div>

</body>
</html>
