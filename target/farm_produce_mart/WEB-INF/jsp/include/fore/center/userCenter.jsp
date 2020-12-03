<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/13
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .a{
        width: 100px;
        height: 100px;
        text-align: center;
        float: left;
        margin-left: 250px;
    }
    .u{
        display: block;
        width: 70px;
        height: 70px;
        margin-left: 15px;
    }
    .b{
        height: 100px;
        width: 800px;
    }
    .clear{
        clear: both;
    }
</style>
<body>
<div class="a">
    <img src="img/10.jpg" class="u">
    ${user.name}
</div>
<div class="b">
    <span style="font-weight: bold">个人中心</span>
    <hr>
    &nbsp;&nbsp;&nbsp;&nbsp;<a  class="a1" href="foreBought">我的订单</a>&nbsp;&nbsp;&nbsp;&nbsp;|
    &nbsp;&nbsp;&nbsp;&nbsp;<a  class="a2"href="list_purchase">我的采购</a>&nbsp;&nbsp;&nbsp;&nbsp;|
    &nbsp;&nbsp;&nbsp;&nbsp;<a class="a3" href="foreUserInfoPage">我的信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<div class="clear"></div>
</body>
</html>
