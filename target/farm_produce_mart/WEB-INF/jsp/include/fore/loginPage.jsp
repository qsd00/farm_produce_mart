<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/8
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    #d{
        text-align: center;
        border: 1px;
        position: absolute;
        top: 200px;
        right: 200px;
        height: 350px;
        width: 320px;
        background-color: white;
    }

    .msg{
        color: red;
    }
</style>
<script>
    $(function () {
        $("#loginPage").submit(function () {
            if ($("#uname").val()==""){
                alert("账号不能为空")
                return false
            }
            if ($("#pwd").val()==""){
                alert("密码不能为空")
                return false
            }
            return  true
        })

    })
</script>
<body>
<div id="loginPage" ><img id="aa" height="100%" src="img/1.jpg">
    <div id="d"><br>
        <span class="login">账户登陆</span><br><br>
        <form action="foreLogin" method="post">
            <p>账号：<input  type="text" id="uname" name="uname"></p>
            <p>密码：<input type="password" id="pwd" name="pwd"></p><br><br><br><br>
            <div class="sButton">  <br><span class="msg">${msg}</span>
                <button class="btn btn-block greenButton" type="submit" >登录</button>
            </div>
        </form>

    </div>
</div>
</body>
</html>
