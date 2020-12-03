<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/23
  Time: 14:40
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
<script>
    $(function(){
        $("button.orderPageCheckOrderItems").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
        });
    });

</script>
<style>
    div.orderPageOrderItem{
        width:100%;
        padding:20px;
    }
    table.orderPageOrderItemTable td{
        padding:5px;
    }
    tr.orderPageOrderItemTR{
        display:none;
    }

    div.orderType div.selectedOrderType {
        border-bottom: 2px solid #C40000;
    }

    div.orderType div {
        border-bottom: 2px solid #E8E8E8;
        float: left;
    }

    table.orderListTitleTable td {
        padding: 12px 0px;
    }

    div.orderType a {
        border-right: 1px solid #E8E8E8;
        float: left;
        font-size: 16px;
        font-weight: bold;
        color: black;
        margin-bottom: 10px;
        padding: 0px 20px;
        text-decoration: none;
    }

    div.orderType div.selectedOrderType a {
        color: #C40000;
    }

    div.orderType a:hover {
        color: #C40000;
        text-decoration: none;
    }

    div.orderTypeLastOne {
        overflow: hidden;
        float: none !important;
        border-bottom: 2px solid #E8E8E8;
    }
</style>
<body>
<div class="workingArea">
    <br><br><br><br>
    <div class="orderType">
        <div class="selectedOrderType"><a orderStatus="all" href="out_order_list">所有订单</a></div>
        <div><a  orderStatus="waitDelivery" href="out_order_listByStatus?status=waitDelivery">待发货</a></div>
        <div><a  orderStatus="waitConfirm" href="out_order_listByStatus?status=waitConfirm">待收货</a></div>
        <div><a  orderStatus="waitPaid" href="out_order_listByStatus?status=waitPaid">待收款</a></div>
        <div><a  orderStatus="finish" href="out_order_listByStatus?status=finish" class="noRightborder">已完成</a></div>
        <div class="orderTypeLastOne"><a class="noRightborder"></a></div>
    </div>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover1  table-condensed">
            <thead>
            <tr class="success">
                <th >ID</th>
                <th >状态</th>
                <th >金额</th>
                <th  width="100px">商品数量</th>
                <th  width="100px">买家名称</th>
                <th  width="200px">买家地址</th>
                <th  width="200px">买家电话</th>
                <th >创建时间</th>
                <th >发货时间</th>
                <th >收款时间</th>
                <th  width="120px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${os}" var="o" varStatus="status">
                <tr>
                    <td >${status.count}</td>
                    <td >${o.statusDesc}</td>
                    <td >￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></td >
                    <td >${o.totalNumber}</td>
                    <td >${o.user.name}</td>
                    <td >${o.user.address}</td>
                    <td >${o.user.phone}</td>
                    <td ><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td ><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td ><fmt:formatDate value="${o.paidDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                    <td>
                        <button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>

                        <c:if test="${o.status=='waitDelivery'}">
                            <a href="out_order_delivery?id=${o.id}">
                                <button class="btn btn-primary btn-xs">发货</button>
                            </a>
                        </c:if>
                    </td>
                </tr>
                <tr class="orderPageOrderItemTR"  oid=${o.id} >
                    <td colspan="10" align="center">

                        <div  class="orderPageOrderItem">
                            <table width="800px" align="center" class="orderPageOrderItemTable">
                                <c:forEach items="${o.orderItems}" var="oi">
                                    <tr >
                                        <td align="left" >
                                            <img width="40px" height="40px" src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
                                        </td>

                                        <td>
                                            <a href="foreproduct?pid=${oi.product.id}">
                                                <span>${oi.product.name}</span>
                                            </a>
                                        </td>
                                        <td align="right">

                                            <span class="text-muted">${oi.number}个</span>
                                        </td>
                                        <td align="right">

                                            <span class="text-muted">单价：￥${oi.product.price}</span>
                                        </td>

                                    </tr>
                                </c:forEach>

                            </table>
                        </div>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/userBack/userPage.jsp" %>
    </div>

</div>

<%@include file="../include/userBack/userFooter.jsp"%>
</body>
</html>
