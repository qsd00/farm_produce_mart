<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/14
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    .editPurchase{
        border: 2px solid bisque;
        width: 350px;
        height: 300px;
    }
    .clear{
        clear: both;
    }
</style>
<br>
<center>
    <div class="editPurchase"><br><br><br><p style="font-weight: bold"><span style="font-size: 20px">采购编辑</span></p><br>
    <form action="update_Purchase" method="post">
    <table>
        <tr>
            <td>采购品种：</td>
            <td><input type="text" name="name" value="${p.name}"></td>
        </tr>
        <tr>
            <td>采购数量：</td>
            <td><input type="text" name="num" value="${p.num}"></td>
        </tr>
        <tr>
            <td>期望货源地：</td>
            <td><input type="text" name="saddress" value="${p.saddress}"></td>
        </tr>
        <tr>
            <td>单位：</td>
            <td><input type="text" name="unit" value="${p.unit}"></td>
        </tr>
    </table>
        <input type="hidden" name="id" value="${p.id}">
        <input type="hidden" name="uid" value="${p.uid}">
        <input type="hidden" name="fid" value="${p.fid}">
        <input type="hidden" name="date" value="${p.date}"><br>
        <button type="submit" class="btn btn-success">修改</button>
    </form><br></div><div class="clear"></div>
</center><br><br><br>
</body>
</html>
