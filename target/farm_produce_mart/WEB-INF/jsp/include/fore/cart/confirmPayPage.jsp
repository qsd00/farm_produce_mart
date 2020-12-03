<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/27
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    div.confirmPayPageDiv {
        max-width: 1013px;
        margin: 10px auto;
    }

    div.confirmPayImageDiv {
        margin: 40px auto 80px auto;
        width: 900px;
        position: relative;
    }

    div.confirmPayImageDiv div {
        color: #999999;
    }

    div.confirmPayTime1 {
        position: absolute;
        top: 100px;
        left: -20px;
    }

    div.confirmPayTime2 {
        position: absolute;
        top: 100px;
        left: 190px;
    }

    div.confirmPayTime3 {
        position: absolute;
        top: 100px;
        left: 400px;
    }

    div.confirmPayOrderInfoText {
        margin: 10px 10px 0px 10px;
        font-size: 16px;
        font-weight: bold;
        color: black;
        padding-bottom: 15px;
        border-bottom: 1px solid #ADC8E6;
    }

    div.confirmPayOrderItemDiv {
        margin: 0px 20px;
    }

    div.confirmPayOrderItemText {
        margin: 20px 10px;
        font-size: 14px;
        font-weight: bold;
        color: black;
    }

    table.confirmPayOrderItemTable thead {
        background-color: #E8F2FF;
        height: 33px;
    }

    table.confirmPayOrderItemTable tr {
        border: 1px solid #DDDDDD;
    }

    table.confirmPayOrderItemTable {
        border: 1px solid #DDDDDD;
        width: 100%;
    }

    span.conformPayProductPrice {
        font-size: 18px;
        font-weight: bold;
        color: #666666;
    }

    table.confirmPayOrderItemTable th, table.confirmPayOrderItemTable td {
        text-align: center;
    }

    table.confirmPayOrderItemTable td {
        padding: 20px;
    }

    td.confirmPayOrderItemProductLink {
        text-align: left !important;
    }

    div.confirmPayOrderItemText {
        color: black;
        font-weight: normal;
    }

    span.confirmPayOrderItemSumPrice {
        color: #C40000;
    }

    table.confirmPayOrderDetailTable {
        width: 100%;
        border-top: 1px solid #DDDDDD;
    }

    table.confirmPayOrderDetailTable td {
        padding: 8px;
        color: black;
        font-size: 14px;
    }

    div.confirmPayOrderDetailDiv {
        margin: 40px;
    }

    span.confirmPayOrderDetailWangWangGif {
        display: inline-block;
        width: 67px;
        height: 22px;
        background-image: url(../../img/site/wangwang.gif);
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: -0px -0px;
        position: relative;
        top: 0px;
        left: 2px;
    }

    div.confirmPayButtonDiv {
        border: 1px solid #F58B0F;
        margin: 20px;
    }

    div.confirmPayWarning {
        margin: 20px 80px;
        font-size: 18px;
        color: red;
        font-weight: bold;
    }

    button.confirmPayButton:hover {
        background-color: #F6AE30;
    }

    button.confirmPayButton {
        margin: 20px 80px;
        width: 67px;
        height: 30px;
        border: 1px solid #E67C00;
        background-color: #F4A21D;
        border-radius: 4px;
        color: white;
    }
</style>
<div class="confirmPayPageDiv">
    <div class="confirmPayImageDiv">
        <img src="img/site/comformPayFlow.png">
        <div  class="confirmPayTime1">
            <fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </div>
        <div  class="confirmPayTime2">
            <fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </div>
        <div class="confirmPayTime3">
            <fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </div>

    </div>
    <div class="confirmPayOrderInfoDiv">
        <div class="confirmPayOrderInfoText">我已收到货，同意支付宝付款</div>
    </div>
    <div class="confirmPayOrderItemDiv">
        <div class="confirmPayOrderItemText">订单信息</div>
        <table class="confirmPayOrderItemTable">
            <thead>
            <th colspan="2">宝贝</th>
            <th width="120px">单价</th>
            <th width="120px">数量</th>
            <th width="120px">商品总价 </th>
            <th width="120px">运费</th>
            </thead>
            <c:forEach items="${o.orderItems}" var="oi">
                <tr>
                    <td><img width="50px" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
                    <td class="confirmPayOrderItemProductLink">
                        <a href="#nowhere">${oi.product.name}</a>
                    </td>
                    <td>￥<fmt:formatNumber type="number" value="${oi.product.price}" minFractionDigits="2"/></td>
                    <td>${oi.number}</td>
                    <td><span class="conformPayProductPrice">￥<fmt:formatNumber type="number" value="${oi.product.price*oi.number}" minFractionDigits="2"/></span></td>
                    <td><span>快递 ： 0.00 </span></td>
                </tr>
            </c:forEach>
        </table>

        <div class="confirmPayOrderItemText pull-right">
            实付款： <span class="confirmPayOrderItemSumPrice">￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></span>
        </div>

    </div>
    <div class="confirmPayOrderDetailDiv">

        <table class="confirmPayOrderDetailTable">
            <tr>
                <td>订单编号：</td>
                <td>${o.orderCode} <img width="23px" src="img/site/confirmOrderTmall.png"></td>
            </tr>
            <tr>
                <td>卖家昵称：</td>
                <td>天猫商铺 <span class="confirmPayOrderDetailWangWangGif"></span></td>
            </tr>
            <tr>
                <td>收货信息： </td>
                <td>${o.address}，${o.receiver}， ${o.phone} </td>
            </tr>
            <tr>
                <td>成交时间：</td>
                <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
        </table>

    </div>
    <div class="confirmPayButtonDiv">
        <div class="confirmPayWarning">请收到货后，再确认收货！否则您可能钱货两空！</div>
        <a href="foreOrderConfirmed?oid=${o.id}"><button class="confirmPayButton">确认支付</button></a>
    </div>
</div>
</body>
</html>
