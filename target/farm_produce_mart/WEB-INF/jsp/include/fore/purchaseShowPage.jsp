<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/12
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    .a{
        font-size: 25px;
        color: #5cb85c;
        margin-left: 170px;
    }
    .b{
        margin-left: 30px;
    }
    .c{
        margin-left: 400px;
    }
    .d{
        width: 1200px;
        height:160px;
        border: 1px solid grey;
        margin-left: 170px;
    }
    .d1{
        height: 40px;
        width: 1200px;
        font-size: 15px;
        background-color: gainsboro;
    }
    .e{
        margin-left: 30px;
        position: relative;
        top: 10px;
        font-weight: bold;
    }
    .f{
        width: 1200px;
        height:160px;
        border: 1px solid grey;
        margin-left: 170px;
    }

</style>

<div>
    <p class="a">采购详情</p>
    <div class="d">
        <div class="d1"><span class="e">采购品种：${p.name}</span></div><br>
        <p><span class="b">采购数量：${p.num}${p.unit}</span> <span class="c">发布时间：<fmt:formatDate value="${p.date}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
        <p><span class="b">期望货源地：${p.saddress}</span> <span class="c">收货地：${p.user.address}</span></p>
    </div><br><br>
    <div class="f">
        <div class="d1"><span class="e">采购商信息</span></div><br>
        <p><span class="b">发布人：${p.user.name}</span> </p>
        <p><span class="b">电话:${p.user.phone}</span> </p>
    </div>
</div><br><br>
</body>
</html>
