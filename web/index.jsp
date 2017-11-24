<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/3
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getContextPath();
    String path =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + basePath + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <base href="<%=path%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>记者管理系统</title>
    <link href="css/default.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css"/>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/outlook2.js"></script>
    <script type="text/javascript">

        var _menus = {
            "menus": [
                {
                    "menuid": "1", "icon": "icon-sys", "menuname": "记者投稿",
                    "menus": [
                        {"menuid": "12", "menuname": "投稿", "icon": "icon-page", "url": "menu1/contribute.jsp"},
                        {
                            "menuid": "13", "menuname": "修改稿件" +
                        "", "icon": "icon-class", "url": "menu1/class.html"
                        },
                        {"menuid": "14", "menuname": "菜单", "icon": "icon-role", "url": "demo2.html"},
                        {"menuid": "15", "menuname": "菜单", "icon": "icon-set", "url": "demo.html"},
                        {"menuid": "16", "menuname": "菜单", "icon": "icon-log", "url": "demo1.html"}
                    ]
                },
                {
                    "menuid": "8", "icon": "icon-sys", "menuname": "稿件管理",
                    "menus": [{"menuid": "21", "menuname": "我的投稿", "icon": "icon-nav", "url": "menu2/myword.jsp"},
                        {"menuid": "22", "menuname": "稿件审核", "icon": "icon-nav", "url": "demo1.html"}
                    ]
                }, {
                    "menuid": "56", "icon": "icon-sys", "menuname": "统计查询",
                    "menus": [{"menuid": "31", "menuname": "记者投稿量", "icon": "icon-nav", "url": "demo1.html"},
                        {"menuid": "32", "menuname": "菜单", "icon": "icon-nav", "url": "demo2.html"}
                    ]
                }, {
                    "menuid": "28", "icon": "icon-sys", "menuname": "系统设置",
                    "menus": [{"menuid": "41", "menuname": "用户管理", "icon": "icon-nav", "url": "menu4/menguser.jsp"},
                        {"menuid": "42", "menuname": "角色管理", "icon": "icon-nav", "url": "menu4/mengrole.jsp"},
                        {"menuid": "43", "menuname": "稿件附件设置", "icon": "icon-nav", "url": "demo2.html"},
                        {"menuid": "44", "menuname": "菜单管理", "icon": "icon-nav", "url": "menu4/mengmenu.jsp"},
                    ]
                }, {
                    "menuid": "39", "icon": "icon-sys", "menuname": "菜单",
                    "menus": [{"menuid": "51", "menuname": "菜单", "icon": "icon-nav", "url": "demo.html"},
                        {"menuid": "52", "menuname": "菜单", "icon": "icon-nav", "url": "demo1.html"},
                        {"menuid": "53", "menuname": "菜单", "icon": "icon-nav", "url": "demo2.html"}
                    ]
                }
            ]
        };
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable: false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }


        $(function () {

            openPwd();


            $('#btnEp').click(function () {
                serverLogin();
            })

            $('#btnCancel').click(function () {
                closePwd();
            })

            $('#loginOut').click(function () {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function (r) {

                    if (r) {
                        alert("退出成功");
                        location.href = 'login.jsp';
                    }
                });
            })
        });


    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<noscript>
    <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
        <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！'/></div>
</noscript>
<div region="north" split="true" border="false"
     style="overflow: hidden; height: 30px;background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
    <span style="float:right; padding-right:20px;" class="head">欢迎 <shiro:principal/>
        <a href="javascript:void(0)" id="loginOut">安全退出</a></span> <span style="padding-left:10px; font-size: 16px; ">
    <img src="images/blocks.gif" width="20" height="20" align="absmiddle"/>记者投稿系统</span></div>
<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
    <div class="footer">版权归紫荆新锐所有，翻版必究</div>
</div>
<div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
    <div id="nav" class="easyui-accordion" fit="true" border="false">
        <!--  导航内容 -->

    </div>
</div>
<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
        <div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; ">
            <h1 style="font-size:24px;">记者投稿系统</h1>
        </div>
    </div>
</div>
<div region="east" title="其他" split="true" style="width:180px;overflow:hidden;">
    <div class="easyui-calendar"></div>
</div>

<!--修改密码窗口-->

<div id="mm" class="easyui-menu" style="width:150px;">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseall">全部关闭</div>
    <div id="mm-tabcloseother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright">当前页右侧全部关闭</div>
    <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-exit">退出</div>
</div>
</body>
</html>
