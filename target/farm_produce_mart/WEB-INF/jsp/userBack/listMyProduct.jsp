<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/30
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/userBack/userHeader.jsp"%>
<%@include file="../include/userBack/userNavigator.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    #panelPd{
        width: 400px;
        height: 240px;
        position: absolute;
        left: 500px;
        bottom: 10px;
    }
</style>
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
        <li class="active">我的产品</li>
    </ol>

    <div class="listDataTableDiv">
        <table   width="500px" class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th width="80px">ID</th>
                <th>图片</th>
                <th>产品名称</th>
                <th width="80px">价格</th>
                <th width="80px">起批量</th>
                <th width="80px">库存数量</th>
                <th width="80px">图片管理</th>
                <th width="80px">设置属性</th>
                <th width="80px">编辑</th>
                <th width="80px">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>

                        <c:if test="${!empty p.firstProductImage}">
                            <img width="40px" src="img/productSingle/${p.firstProductImage.id}.jpg">
                        </c:if>

                    </td>
                    <td>${p.name}</td>
                    <td>${p.price}${p.unit}</td>
                    <td>${p.scount}</td>
                    <td>${p.stock}</td>
                    <td><a href="userBack_productImage_list?pid=${p.id}"><span
                            class="glyphicon glyphicon-picture"></span></a></td>
                    <td><a href="userBack_propertyValue_edit?pid=${p.id}"><span
                            class="glyphicon glyphicon-th-list"></span></a></td>

                    <td><a href="userBack_product_edit?id=${p.id}"><span
                            class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true"
                           href="userBack_product_delete?id=${p.id}"><span
                            class="     glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/userBack/userPage.jsp"%>
    </div>
</div>

<%@include file="../include/userBack/userFooter.jsp"%>
</body>
</html>
