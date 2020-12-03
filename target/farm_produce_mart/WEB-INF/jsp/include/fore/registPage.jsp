<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/13
  Time: 11:34
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
        height: 410px;
        width: 400px;
        background-color: white;
    }
    .apc,.c,.apd,.info{
        color: red;
    }
</style>
<script>
    $(function () {
        $(".account").blur(function () {
            var p=$(".account").val()
            $.ajax({
                url:"checkName",
                type:"post",
                data:{"name":p},
                success:function (data) {
                    if ("fail"==data){
                        $(".info").text("账号已存在！")
                    }
                    if ("success"==data){
                        $(".info").text("")
                    }
                }
            })
        })
    })

    function f1() {
        var a=document.getElementById("pwd");
        if (a.value.length<6){
            $(".apc").text("密码规则不符,至少6位！请重新输入！")
            // document.getElementById("a").innerHTML="密码规则不符,至少6位！请重新输入！";
        }
        else {
            $(".apc").text("")
            // document.getElementById("a").innerHTML="";
        }
    }

    function f2() {
        var a=document.getElementById("phone");
        var reg=/^\d{11}$/;
        if (!reg.test(a.value)){
            $(".c").text("电话号码11位,请重新输入!")
            // document.getElementById("c").innerHTML="电话号码11位,请重新输入!";

        }else {
            $(".c").text("")
            // document.getElementById("c").innerHTML="";
        }
    }

    function f3() {
        var a=$("#pwd").val()
        var b=$("#pwd1").val()
        if (a!=b){
            $(".apd").text("密码不相同")
        }
        else{
            $(".apd").text("")
        }
    }

</script>
<body>
<div id="registPage" ><img id="aa" height="100%" src="img/1.jpg">
    <div id="d"><br>
        <span class="login">账户注册</span><br><br>
        <form action="foreRegist" method="post">
            <p>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" id="name" name="name" class="account" ></p><span id="info" class="info"></span>
            <p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" id="pwd" name="pwd" onblur="f1()"></p><p><span id="apc" class="apc"></span></p>
            <p>确认密码：<input type="password" id="pwd1" name="pwd1" onblur="f3()"></p><p><span id="apd" class="apd"></span></p>
            <p>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" id="phone" name="phone" onblur="f2()"></p><p><span id="c" class="c"></span></p>
            <p>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<input type="text" id="address" name="address"></p>
            <p>支&nbsp;&nbsp;付&nbsp;&nbsp;宝：<input type="text" id="zfb" name="zfb"></p><br>
            <input type="hidden" id="type" name="type" value="2">
            <div class="sButton">
                <button class="btn btn-block greenButton" type="submit" >注册</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
