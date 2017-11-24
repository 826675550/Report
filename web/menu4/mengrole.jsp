<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/9
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getContextPath();
    String path =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + basePath + "/";
%>
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
    <link rel="stylesheet" href="../css/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="../js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ztree.excheck.js"></script>


    <script type="text/javascript">
        function gend(e, treeId, treeNode) {
            //获取zTree
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo"),
                //获取当前选中节
                nodes = treeObj.getCheckedNodes(true);
            //返回id
            return nodes;
        }
        var rids;

        function saveRole1() {
            var nodes=gend();
            var ids = "";
            for (var i = 0; i < nodes.length; i++) {
                ids += nodes[i].id + ",";
            }
            $.ajax({
                type: "POST",//自定义请求 如果是POST发送post请求 如果是GET 发送Get请求
                url: "http://localhost:8083/Menu/upRole",//发送请求到后台接口
                data: {rid: rids,ids:ids},
                dataType: "json",//后台返回的数据类型
                success: function (abc) {//如果请求后台的接口成功,会访问该方法.
                    if (abc) {
                        alert("成功");
                        $('#dlg1').dialog('close');// 关闭当前对话框,！！！注意你要关闭的是哪个窗口


                    } else {
                        alert("失败");
                        $('#dlg1').dialog('close');// 关闭当前对话框

                    }
                }
            });

        }
        function aut(value, row) {
            var rid = row.id;//获取被选中id

//            var rid = new Object(row["role"]).id;//获取当前用户角色id
            return '<a href="javascript:void(0)" onclick="auth1(' + rid + ')">授权</a>';
        }
        function getSelect(rid) {
            $.ajax({
                type: "GET",//自定义请求 如果是POST发送post请求 如果是GET 发送Get请求
                url: "http://localhost:8083/Menu/getMid",//发送请求到后台接口
                data: {rid: rid},
                dataType: "json",//后台返回的数据类型
                success: function (abc) {//如果请求后台的接口成功,会访问该方法.

                    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                    var node;
                    $.each(abc, function (commentIndex, comment) {
                        //根据id属性获取节点
                        node = treeObj.getNodeByParam("id", comment.id);
                        alert(comment.id);
                        //使指定节点被选中
                        treeObj.checkNode(node, true);
                        treeObj.updateNode(node);
                    })
                }
            });
        }
        function auth1(rid) {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            rids=rid;
            getSelect(rid);
            $('#dlg1').dialog('open').dialog('setTitle', '角色授权');
        }
        //如果是父节点不处理，如果是子节点，打开对应的连接





        //异步加载失败时调用的方法
        function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
            alert("加载失败！");
        }


        //获取被选中节点id

        //初始化树
        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });
        var zNodes = [];
        var setting = {
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType:{ "Y": "", "N": "" }
            },
            view: {
                dblClickExpand: false,//双击节点时，是否自动展开父节点的标识
                showLine: true,//显示下划线
                selectedMulti: false,//设置是否允许同时选中多个节点。
                expandSpeed: 400//"slow"//节点展开速度
            },
            data: {
                simpleData: {//是否为简单数据类型JSON
                    enable: true,
                    idKey: "id",//使用简单必须标明的的节点对应字段
                    pIdKey: "parentId",//使用简单必须标明的的父节点对应字段
                    rootPId: 0//根
                }
            },
            async: {
                enable: true,//异步加载
                //请求地址，可用function动态获取
                url: "http://localhost:8083/Menu/getMenu",
                contentType: "application/x-www-form-urlencoded",//按照标准的 Form 格式提交参数
                autoParam: ["id", "pId"],//提交的节点参数，可用“id=xx”取请求提交时的别名
                //otherParam:{"otherParam":"zTreeAsyncTest"},//提交的其他参数,json的形式
                dataType: "json",//返回数据类型
                type: "post",//请求方式
                dataFilter: null//数据过滤
            },
            callback: {
                onAsyncError: onAsyncError,//异步加载失败调用的函数
                beforeCheck : function(treeId, treeNode) {
                    if (treeNode.isParent) {

                        return false;
                    }
                }
            }
        };
        function editCategory() {
            var row = $('#dg').datagrid('getSelected');//获取选中的一行数据
            if (row) {
                $('#dlg').dialog('open').dialog('setTitle', '编辑角色');
                $('#fm').form('load', row); //将数据加载到表单中即回显
                url = 'http://localhost:8083/Role/saveRole?id=' + row.id;
            }
        }

        function newCategory() {
            //打开对话框
            $('#dlg').dialog('open').dialog('setTitle', '添加角色');//因为这个对话框添加 更新两用
            $('#fm').form('clear'); //清空fm表单

            url = 'http://localhost:8083/Role/addRole'

        }
        function saveUser() {
            alert(url);
            $('#fm').form('submit', {

                url: url,
                success: function (ds) {
                    if (ds) {
                        alert("成功");
                        $('#dlg').dialog('close');		// 关闭当前对话框
                        $('#dg').datagrid('reload');	// 重新加载数据
                    } else {
                        alert("失败");
                    }


//                    var result = eval('('+result+')');
//                    if (result.errorMsg){
//                        $.messager.show({
//                            title: 'Error',
//                            msg: result.errorMsg
//                        });
//                    } else {
//                        $('#dlg').dialog('close');		// close the dialog
//                        $('#dg').datagrid('reload');	// reload the user data
//                    }
                }
            });
        }

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
                    $.post('http://localhost:8083/Role/delRole', {id: ids}, function (result) {
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
    </script>
    <title>角色管理</title>
</head>
<body>
<table id="dg" title="角色管理" class="easyui-datagrid" style="width:1500px;height:500px"
       url="http://localhost:8083/Role/getRole"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="false"
       pagination="true"
>
    <thead>
    <tr>
        <th field="id" width="50">角色编号</th>
        <th field="name" width="100">角色名称</th>
        <th field="aut" width="50" formatter="aut">授权</th>


    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="newCategory()">添加角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="editCategory()">编辑角色</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
       onclick="destroyCategory()">移除角色</a>
</div>
<!--list end-->
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">Category Information</div>
    <form id="fm" method="post">
        <div class="fitem">
            <label>角色名称:</label>
            <input name="name" id="name" class="easyui-validatebox" required>
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onClick="saveUser()">Save</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel"
       onClick="javascript:$('#dlg').dialog('close')">Cancel</a>
</div>

<div id="dlg1" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
     closed="true" buttons="#dlg1-buttons">
    <div class="ftitle">授权管理</div>
    <div class="content_wrap">
        <div class="zTreeDemoBackground left">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
    </div>
    <div id="dlg1-buttons">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onClick="saveRole1()" >Save</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel"
           onClick="javascript:$('#dlg1').dialog('close')">Cancel</a>
    </div>
</div>

</body>
</html>
