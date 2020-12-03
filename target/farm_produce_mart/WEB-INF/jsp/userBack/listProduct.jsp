<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/29
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/userBack/userHeader.jsp"%>
<%@include file="../include/userBack/userNavigator.jsp"%>
<html>
<head>
    <title>产品管理</title>
</head>
<style>
    #panelPd{
        width: 400px;
        height: 270px;
        position: relative;
        left: 500px;
        bottom: 0px;
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
        <li><a href="userBack_category_list?sid=${c.sid}">返回上级分类</a></li>
        <li class="active">${c.name}</li>
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
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/userBack/userPage.jsp"%>
    </div><br><br><br>

    <div class="panel panel-warning addDiv" id="panelPd" >
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="userBack_product_add">
                <table class="addTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input id="name" name="name" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>价格</td>
                        <td><input id="price"  name="price" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>单位</td>
                        <td><input id="unit"  name="unit" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                    <td>起批量</td>
                    <td><input id="scount"   name="scount" type="text"
                               class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input id="stock"  name="stock" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="cid" value="${c.id}">
                            <input type="hidden" name="sid" value="${user.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>

<%@include file="../include/userBack/userFooter.jsp"%>
</body>
</html>
