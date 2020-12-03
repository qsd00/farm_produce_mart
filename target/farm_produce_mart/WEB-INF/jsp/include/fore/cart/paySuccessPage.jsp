<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/27
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    div.payedDiv {
        border: 1px solid #D4D4D4;
        max-width: 1013px;
        margin: 10px auto 20px auto;
    }

    div.payedTextDiv {
        height: 61px;
        background-color: #ECFFDC;
        padding: 17px 0px 0px 25px;
    }

    div.payedTextDiv span {
        font-weight: bold;
        font-size: 14px;
        margin-left: 10px;
    }

    div.payedAddressInfo {
        padding: 26px 35px;
    }

    div.payedAddressInfo li {
        background-image: url("../../img/site/li_dot.png");
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: 0px 13px;
        list-style-type: none;
        color: #333333;
        padding-left: 15px;
        padding-top: 5px;
        /* 	background: rgba(0, 0, 0, 0) url("../../img/site/li_dot.png") no-repeat scroll 0 13px; */
    }

    span.payedInfoPrice {
        color: #B10000;
        font-weight: bold;
        font-size: 14px;
        font-family: arial;
    }

    a.payedCheckLink {
        color: #2D8CBA;
    }

    a.payedCheckLink:hover {
        color: #2D8CBA;
        text-decoration: underline;
    }

    div.paedCheckLinkDiv {
        margin-left: 38px;
    }

    div.payedSeperateLine {
        border-top: 1px dotted #D4D4D4;
        margin: 0px 31px;
    }

    div.warningDiv {
        margin: 23px 45px;
    }

    div.warningDiv {
        color: black;
    }

</style>
<body>
<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="img/site/paySuccess.png">
        <span>您已成功付款</span>

    </div>
    <div class="payedAddressInfo">
        <ul>
            <li>收货地址：${o.address} ${o.receiver} ${o.phone }</li>
            <li>实付款：<span class="payedInfoPrice">
            ￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/>
            </li>
            <li>预计一周内送达    </li>
        </ul>

        <div class="paedCheckLinkDiv">
            您可以
            <a class="payedCheckLink" href="foreBought">查看已买到的宝贝</a>
            <a class="payedCheckLink" href="foreBought">查看交易详情 </a>
        </div>

    </div>

    <div class="payedSeperateLine">
    </div>

    <div class="warningDiv">
        <img src="img/site/warning.png">
        <b>安全提醒：</b>下单后，<span class="redColor boldWord">用QQ给您发送链接办理退款的都是骗子！</span>平台不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
    </div>

</div><br><br><br>
</body>
</html>
