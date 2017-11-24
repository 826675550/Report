<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/11/22
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getContextPath();
    String path =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + basePath + "/";
%>
<html>
<head>
    <base href="<%=path%>">
    <title>记者投稿</title>

    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="ckeditor/plugins/image/dialogs/image.js" type="text/javascript"></script>
    <script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>


    <script type="text/javascript">
        window.onload = function () {
            initSample();

        };


    </script>
</head>
<body id="main">
标题：<input id="titles" type="text"/>请选择类型 <select><option></option></select>
<textarea rows="10" cols="30" class="ckeditor" name="Text" id="Text"></textarea>


<input type="button" id="save" value="提交" onclick="OnSubmit()"/>
<input type="button" id="save1" value="保存" onclick="OnSave()"/>
<script type="text/javascript"></script>
<script type="text/javascript">
    var jQuery=$;
    var editor = CKEDITOR.replace('Text');

    jQuery(function () {
        alert("1123123");


    });
    function OnSubmit() {

    }

    function OnSave() {
        var text1=jQuery('#titles');
        var context=CKEDITOR.instances.Text.getData();
        alert(text1);
        if (CKEDITOR.instances.Text.getData() == "") {
            alert("内容不能为空！");
            return false;
        } else {
            alert(CKEDITOR.instances.Text.getData());
        }
    }

</script>

</body>
</html>
