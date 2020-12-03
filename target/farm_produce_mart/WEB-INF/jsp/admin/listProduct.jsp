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
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>产品管理</title>
</head>
<style>
    #panelPd{
        width: 400px;
        height: 270px;
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
        <li><a href="admin_category_list?sid=${c.sid}">返回上级分类</a></li>
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
                    <td>${p.price}</td>
                    <td>${p.scount}${p.unit}</td>
                    <td>${p.stock}</td>
                    <td><a href="admin_productImage_list?pid=${p.id}"><span
                            class="glyphicon glyphicon-picture"></span></a></td>
                    <td><a href="admin_propertyValue_edit?pid=${p.id}"><span
                            class="glyphicon glyphicon-th-list"></span></a></td>

                    <td><a href="admin_product_edit?id=${p.id}"><span
                            class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true"
                           href="admin_product_delete?id=${p.id}"><span
                            class="     glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv" id="panelPd" >
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_product_add">
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

<%@include file="../include/admin/adminFooter.jsp"%>
</body>
</html>
