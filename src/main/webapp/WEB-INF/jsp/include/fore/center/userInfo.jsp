<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/13
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    .userInfo{
        width: 400px;
        height: 250px;
        border: 2px solid sandybrown;
    }
</style>
<script>
    $(function () {
        $(".name").blur(function () {
           var p=$(".name").val()
            $.ajax({
                type:"post",
                url:"checkName",
                data:{"name":p},
                success:function (data) {
                    if ("fail"==data){
                        alert("用户名已存在！")
                    }
                    if("success"==data){
                        alert("用户名可以修改！")
                    }
                }
            })
        })
    })
</script>
<center>
    <br><br><br>
    <div class="userInfo"><br><p style="font-weight: bold"><span style="font-size: 20px">信息修改</span></p><br>
    <form action="updateUser" method="post">
    <table>
        <tr>
            <td>姓名：</td>
            <td><input type="text" value="${user.name}" name="name" class="name"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" value="${user.pwd}" name="pwd"></td>
        </tr>
        <tr>
            <td>电话：</td>
            <td><input type="text" value="${user.phone}" name="phone"></td>
        </tr>
        <tr>
            <td>支付宝账号：</td>
            <td><input type="text" value="${user.zfb}" name="zfb"></td>
        </tr>
        <tr>
            <td>地址：</td>
            <td><input type="text" value="${user.address}" name="address"></td>
        </tr>
    </table>
        <input type="hidden" value="${user.id}" name="id">
        <input type="hidden" value="${user.type}" name="type"><br>
        <button type="submit" class="btn btn-success">修改</button>
    </form>
</div><br><br><br><br>
</center>
</body>
</html>
