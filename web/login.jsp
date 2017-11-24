<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/4
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath = request.getContextPath();
    String path =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + basePath + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=path%>">
    <title>记者投稿系统登入</title>
    <link href="Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/jquery.ui.all.css">
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        function initBookAjax() {
            //发送请求给后台的接口,后台接口返回json数据
            //$.get({})只能发送get请求
            //$.post({})只能发送psot请求
            //$.ajax({}) post get
            $.ajax({
                type: "POST",//自定义请求 如果是POST发送post请求 如果是GET 发送Get请求
                url: "http://localhost:8083/User/loginByPhone",//发送请求到后台接口
                data: {user:$("#username").val(),pwd:$("#userpwd").val()},
                dataType: "text",//后台返回的数据类型
                success: function(abc){//如果请求后台的接口成功,会访问该方法.
                            location.href=abc;
                }

            });

        }


        $(function () {


            $("#button").click(function () {

                initBookAjax();
            })


        })
    </script>
</head>

<body class="login" mycollectionplug="bind">

<div class="login_m">
    <div class="login_logo"><h1 style="color:blue">记者投稿系统登入</h1></div>
    <div class="login_boder">


        <div class="login_padding" id="login_model">

            <h2>用户:</h2>
            <label>
                <input type="text" name="user" id="username" class="txt_input txt_input2"
                       onfocus="if (value ==&#39;邮箱/手机号&#39;){value =&#39;&#39;}"
                       onblur="if (value ==&#39;&#39;){value=&#39;邮箱/手机号&#39;}" value="邮箱/手机号">
            </label>
            <h2>密码:</h2>
            <label>
                <input type="password" name="pwd" id="userpwd" class="txt_input"
                       onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}"
                       onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
            </label>

            <p class="forgot"><a id="iforget" href="javascript:void(0);">还没有账号?</a>&nbsp;&nbsp;<a id="iforget"
                                                                                                  href="javascript:void(0);">忘记密码?</a>
            </p>
            <div class="rem_sub">
                <div class="rem_sub_l">
                    <input type="checkbox" name="checkbox" id="save_me">
                    <label for="checkbox">记住我</label>
                </div>
                <label>
                    <input type="button" class="sub_button" name="button" id="button" value="登入" style="opacity: 0.7;">
                </label>
            </div>
        </div>

        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/">企业网站模板</a></div>

        <div id="forget_model" class="login_padding" style="display:none">
            <br>

            <h1>Forgot password</h1>
            <br>
            <div class="forget_model_h2">(Please enter your registered email below and the system will automatically
                reset users’ password and send it to user’s registered email address.)
            </div>
            <label>
                <input type="text" id="usrmail" class="txt_input txt_input2">
            </label>


            <div class="rem_sub">
                <div class="rem_sub_l">
                </div>
                <label>
                    <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now"
                           style="opacity: 0.7;">
                    　　　
                    <input type="submit" class="sub_button" name="button" id="denglou" value="Return"
                           style="opacity: 0.7;">　　

                </label>
            </div>
        </div>


        <!--login_padding  Sign up end-->
    </div><!--login_boder end-->
</div><!--login_m end-->
<br> <br>
<p align="center"> More Templates <a href="http://www.cssmoban.com/" target="_blank" title="版权归">版权归</a> &copy;
    <a href="http://www.cssmoban.com/" title="紫荆新锐所有" target="_blank">紫荆新锐所有</a></p>


</body>
</html>