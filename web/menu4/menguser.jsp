<!DOCTYPE html>
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
    <link rel="stylesheet" href="../css/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="../js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ztree.excheck.js"></script>


    <script type="text/javascript">
        //获取被选中id
        function getid(e, treeId, treeNode) {
            var rid;
            //获取zTree
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo"),
                //获取当前选中节点
                nodes = treeObj.getCheckedNodes(true),
                v = "";
            //遍历当前选中节点
            for (var i = 0; i < nodes.length; i++) {
                v += nodes[i].name + ",";
                //获取该节点id
                rid = nodes[i].id;//获取选中节点的值
            }
            //返回id
            return rid;
        }


        var zNodes = [];
        var setting = {
            check: {
                enable: true,
                chkStyle: "radio"
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
                    pIdKey: "pId",//使用简单必须标明的的父节点对应字段
                    rootPId: null//根
                }
            },
            async: {
                enable: true,//异步加载
                //请求地址，可用function动态获取
                url: "http://localhost:8083/Role/getRole",
                contentType: "application/x-www-form-urlencoded",//按照标准的 Form 格式提交参数
                autoParam: ["id", "pId"],//提交的节点参数，可用“id=xx”取请求提交时的别名
                //otherParam:{"otherParam":"zTreeAsyncTest"},//提交的其他参数,json的形式
                dataType: "json",//返回数据类型
                type: "post",//请求方式
                dataFilter: null//数据过滤
            },
            callback: {
                onClick: reLoadOpenURL,//节点被点击时调用的函数
                onAsyncError: onAsyncError,//异步加载失败调用的函数
                //onExpand: zTreeOnExpand,//用于捕获节点被展开的事件回调函数
                beforeExpand: zTreeBeforeExpand,//用于捕获父节点展开之前的事件回调函数，并且根据返回值确定是否允许展开操作
            }
        };
        //如果是父节点不处理，如果是子节点，打开对应的连接
        function reLoadOpenURL(event, treeId, treeNode) {

            //alert(treeNode.tId + ", " + treeNode.name+","+treeNode.id);
            var zTree = $.fn.zTree.getZTreeObj(treeId);
            if (treeNode.isParent) {//如果是父节点
                //zTree.reAsyncChildNodes(treeNode, "refresh",false);//异步刷新，清空后加载，加载后打开
                if (treeNode.open) {//父节点为展开状态，折叠父节点
                    //alert(treeNode.open);
                    zTree.expandNode(treeNode, true, true, true, false);
                    //expandNode参数说明：节点，展开(true)/折叠(false)，是否影响子孙节点，是否设置焦点，是否触发beforeExpand/onExpand或beforeCollapse/onCollapse事件回调函数
                }
                else {//父节点是折叠的
                    if (treeNode.id != 1) zTreeBeforeExpand(treeId, treeNode);//如果不是根节点（本例根节点为1），则强制异步刷新子节点数据
                    else
                        zTree.expandNode(treeNode, true, false, true, false);//如果是根节点则展开
                }
                return false;
            } else {//不是父节点，打开对应链接
                $("#testIframe").attr("src", treeNode.file + ".html");
                return true;
            }


        }
        //用于捕获父节点展开之前的事件回调函数，并且根据返回值确定是否允许展开操作 ，false不代开
        function zTreeBeforeExpand(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj(treeId);
            if (treeNode.isParent && treeNode.id != "1") {
                zTree.reAsyncChildNodes(treeNode, "refresh");//异步刷新，清空后加载，加载后打开,需要不打开加参数true

                return false;//使用了异步强行加载，如果用true,节点展开将不会按照expandSpeed属性展开，false将按照设定速度展开
            }
            else {
                return true;
            }
        };
        //用于捕获节点被展开后的事件回调函数
        function zTreeOnExpand(event, treeId, treeNode) {
            alert(treeNode.tId + ", " + treeNode.name);
        };

        //数据过滤方法，如后台数据已确认无误可直接返回数据，不需注册此回调函数
        function filter(treeId, parentNode, childNodes) {
            if (!childNodes) return null;
            return childNodes;
        }
        //异步加载失败时调用的方法
        function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
            alert("加载失败！");
        }


        //获取被选中节点id

        //初始化树
        $(document).ready(function () {

            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

        //  格式化列
        function xxx(value, row, index) {
            return new Object(row["role"]).name;
        }

        //  格式化列
        function aut(value, row) {
            var id = row.id;//获取被选中id
            var rid = new Object(row["role"]).id;//获取当前用户角色id

            return '<a href="javascript:void(0)" onclick="auth1(' + id + "," + rid + ')">授权</a>';

        }

        //  格式化列
        function sta(value, row) {
            if (value == 0) {
                return '启用';
            } else if (value == 1) {
                return '冻结';
            }
        }
        //全局变量，用于传值
        var userids;
        //id-->用户id，rid--》角色id
        function auth1(id, rid) {
            userids = id;
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            //根据id属性获取节点
            var node = treeObj.getNodeByParam("id", rid);
            //使指定节点被选中
            treeObj.checkNode(node, true, true);
            //更新节点
            treeObj.updateNode(node);
            //弹出对话框
            $('#dlg1').dialog('open').dialog('setTitle', '角色授权');

        }
        function editCategory() {
            var row = $('#dg').datagrid('getSelected');//获取选中的一行数据
            if (row) {
                $('#dlg').dialog('open').dialog('setTitle', '编辑用户');
                $('#fm').form('load', row); //将数据加载到表单中即回显
                url = 'http://localhost:8083/User/saveUser?id=' + row.id;
            }
        }

        function newCategory() {
            //打开对话框
            $('#dlg').dialog('open').dialog('setTitle', '添加用户');//因为这个对话框添加 更新两用
            $('#fm').form('clear'); //清空fm表单

            url = 'http://localhost:8083/User/addUser'

        }
        //用于保存角色更改
        function saveRole() {
            //获取被选中角色id
            var ident = getid();
            $.ajax({
                type: "get",//自定义请求 如果是POST发送post请求 如果是GET 发送Get请求
                url: 'http://localhost:8083/User/upRole?id=' + userids + '&identityFlag=' + ident,//发送请求到后台接口
                dataType: "json",//后台返回的数据类型
                success: function (abc) {//如果请求后台的接口成功,会访问该方法.
                    if (abc) {
                        alert("成功");
                        $('#dlg1').dialog('close');// 关闭当前对话框,！！！注意你要关闭的是哪个窗口
                        $('#dg').datagrid('reload');// 重新加载数据

                    } else {
                        alert("失败");
                        $('#dlg1').dialog('close');// 关闭当前对话框
                        $('#dg').datagrid('reload');// 重新加载数据
                    }
                }
            });
        }
        //保存数据添加及更改方法
        function saveUser() {
            $('#fm').form('submit', {
                url: url,
                success: function (ds) {
                    if (ds) {
                        alert("成功");
                        $('#dlg').dialog('close');// 关闭当前对话框
                        $('#dg').datagrid('reload');// 重新加载数据
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
                    $.post('http://localhost:8083/User/delUser', {id: ids}, function (result) {
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
    <title>用户管理</title>
</head>
<body>
<table id="dg" title="用户管理" class="easyui-datagrid" style="width:1500px;height:500px"
       url="http://localhost:8083/User/getUser"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="false"
       pagination="true"
>
    <thead>
    <tr>
        <th field="id" width="50">类目编号</th>
        <th field="email" width="100">电子邮箱</th>
        <th field="phone" width="100">手机号</th>
        <th field="password" width="100">密码</th>
        <th field="operacteId" width="100">操作人ID</th>
        <th field="createTime" width="100">创建时间</th>
        <th field="status" width="50" formatter="sta">用户状态</th>
        <th field="xx" width="50" formatter="xxx">身份</th>
        <th field="qwe" width="50" formatter="aut">授权</th>


    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="newCategory()">添加用户</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="editCategory()">编辑用户</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
       onclick="destroyCategory()">移除用户</a>
</div>
<!--list end-->
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">Category Information</div>
    <form id="fm" method="post">

        <div class="fitem">
            <label>电子邮箱:</label>
            <input name="email" id="email" class="easyui-validatebox" required>

        </div>
        <div class="fitem">
            <label>手机号:</label>
            <input name="phone" id="phone" class="easyui-validatebox" required>
        </div>
        <div class="fitem">
            <label>密码</label>
            <input name="password" id="password" class="easyui-validatebox" required>
        </div>
        <div class="fitem">
            <label>操作人ID</label>
            <input name="operacteId" id="operacteId" class="easyui-validatebox" required>
        </div>
        <div class="fitem">
            <label>创建时间</label>
            <input name="createTime" id="createTime" type="date" class="easyui-validatebox" required>
        </div>
        <div class="fitem">
            <label>用户状态</label>
            <input name="status" type="radio" value="0" class="easyui-validatebox" required>启用
            <input name="status" type="radio" value="1" class="easyui-validatebox" required>禁用
        </div>
        <div class="fitem">
            <label>身份</label>
            <input name="identityFlag" type="radio" value="0" class="easyui-validatebox" required>记者
            <input name="identityFlag" type="radio" value="1" class="easyui-validatebox" required>编辑
        </div>

    </form>
    <div id="dlg1-buttons">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onClick="saveUser()">Save</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel"
           onClick="javascript:$('#dlg').dialog('close')">Cancel</a>
    </div>
</div>

<div id="dlg1" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">授权管理</div>
    <div class="content_wrap">
        <div class="zTreeDemoBackground left">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onClick="saveRole()">Save</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel"
           onClick="javascript:$('#dlg1').dialog('close')">Cancel</a>
    </div>
</div>


</body>
</html>