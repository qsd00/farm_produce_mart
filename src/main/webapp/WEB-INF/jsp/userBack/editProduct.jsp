<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/29
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/userBack/userHeader.jsp"%>
<%@include file="../include/userBack/userNavigator.jsp"%>
<html>
<head>
    <title>编辑产品</title>
</head>
<script>
    $(function() {
        $("#addForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
            if (!checkEmpty("scount", "起批量"))
                return false;
            if (!checkNumber("price", "价格"))
                return false;
            if (!checkNumber("unit", "单位"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });
</script>
<body>
<br><br><br>
<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="user_product_list">返回上一级</a></li>
        <li class="active">${c.name}</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑产品</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="userBack_product_update">
                <table class="editTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input id="name" name="name" value="${p.name}"
                                   type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>价格</td>
                        <td><input id="price" value="${p.price}" name="price" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>起批量</td>
                        <td><input id="scount"  value="${p.scount}" name="scount" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>单位</td>
                        <td><input id="unit"  name="unit" type="text" value="${p.unit}"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input id="stock"  value="${p.stock}" name="stock" type="text"
                                   class="form-control"></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${p.id}">
                            <input type="hidden" name="sid" value="${p.sid}">
                            <input type="hidden" name="cid" value="${c.id}">
                            <button type="submit" class="btn btn-success">提 交</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
