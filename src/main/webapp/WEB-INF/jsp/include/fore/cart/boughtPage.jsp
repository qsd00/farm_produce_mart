<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/27
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    div.boughtDiv {
        max-width: 1013px;
        margin: 10px auto;
    }

    div.orderType div.selectedOrderType {
        border-bottom: 2px solid #C40000;
    }

    div.orderType div {
        border-bottom: 2px solid #E8E8E8;
        float: left;
    }

    table.orderListTitleTable {
        border: 1px solid #E8E8E8;
        width: 100%;
        margin: 20px 0px;
        background-color: #F5F5F5;
        text-align: center;
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

    a.noRightborder {
        border-right-width: 0px !important;
    }

    table.orderListItemTable {
        border: 2px solid #ECECEC;
        width: 100%;
        margin: 20px 0px;
    }

    table.orderListItemTable:hover {
        border: 2px solid #aaa !important;
    }

    tr.orderListItemFirstTR {
        background-color: #F1F1F1;
        font-size:12px;
    }

    table.orderListItemTable td {
        padding: 8px 10px;
    }

    div.orderItemWangWangGif {
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

    span.orderListItemDelete {
        display: inline-block;
        margin: 0px 10px;
        color: #999999;
        font-size: 16px;
    }

    div.orderListItemProductLinkOutDiv {
        position: relative;
        height: 80px;
        font-size:12px;
    }

    div.orderListItemProductLinkInnerDiv {
        position: absolute;
        bottom: 0px;
    }

    div.orderListItemProductOriginalPrice {
        color: #999999;
        font-size: 14px;
    }

    div.orderListItemProductPrice {
        color: #3C3C3C;
        font-size: 14px;
    }

    div.orderListItemProductRealPrice {
        color: #3C3C3C;
        font-size: 14px;
        font-weight: bold;
    }

    div.orderListItemPriceWithTransport {
        color: #6C6C6C;
        font-size: 12px;
    }

    td.orderListItemProductRealPriceTD {
        text-align: center;
    }

    button.orderListItemConfirm {
        background-color: #66B6FF;
        border-radius: 2px;
        color: white;
        font-size: 12px;
        font-weight: bold;
        border-width: 0px;
        padding: 6px 12px;
    }

    button.orderListItemConfirm:hover {
        background-color: #118ADB;
    }

    button.orderListItemReview {
        border: 1px solid #DCDCDC;
        background-color: #fff;
        border-radius: 2px;
        color: #3C3C3C;
        font-size: 12px;
        font-weight: bold;
        padding: 6px 12px;
    }

    button.orderListItemReview:hover {
        border-color: #C40000;
        color: #C40000;
    }

    td.orderItemDeleteTD {
        text-align: right;
    }

    td.orderListItemButtonTD {
        text-align: center;
    }

    span.orderListItemNumber {
        color: #3C3C3C;
    }

    td.orderListItemNumberTD {
        text-align: center;
    }

    .number{
        position: relative;
        left: 85px;
    }




</style>
<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function(){
        $("a[orderStatus]").click(function(){//根据点击的订单状态，隐藏所有订单，显示该状态的订单
            var orderStatus = $(this).attr("orderStatus");
            if('all'==orderStatus){
               location.reload();
            }
            else{
                $("table[orderStatus]").hide();
                $("table[orderStatus="+orderStatus+"]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });

        $("a.deleteOrderLink").click(function(){//点击删除，弹出确认框
            deleteOrderid = $(this).attr("oid");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });

        $("button.deleteConfirmButton").click(function(){//点击确认，隐藏该确认框
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {//使用ajax删除订单，隐藏该订单
            if(deleteOrder){
                var page="foreDeleteOrder";
                $.post(
                    page,
                    {"oid":deleteOrderid},
                    function(result){
                        if("success"==result){
                            $("table.orderListItemTable[oid="+deleteOrderid+"]").hide();
                        }
                        else{
                            location.href="index.jsp";
                        }
                    }
                );

            }
        })

        $(".ask2delivery").click(function(){
            var link = $(this).attr("link");
            $(this).hide();
            page = link;
            $.ajax({
                url: page,
                success: function(result){
                    alert("卖家已秒发，刷新当前页面，即可进行确认收货")
                }
            });

        });
    });

</script>
<body>
<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a orderStatus="all" href="#nowhere">所有订单</a></div>
        <div><a  orderStatus="waitPay" href="#nowhere">待付款</a></div>
        <div><a  orderStatus="waitDelivery" href="#nowhere">待发货</a></div>
        <div><a  orderStatus="waitConfirm" href="#nowhere">待收货</a></div>
        <div><a  orderStatus="waitReview" href="#nowhere" class="noRightborder">待评价</a></div>
        <div class="orderTypeLastOne"><a class="noRightborder"></a></div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tr>
                <td>宝贝</td>
                <td width="100px">单价</td>
                <td width="100px">数量</td>
                <td width="120px">实付款</td>
                <td width="100px">交易操作</td>
            </tr>
        </table>

    </div>

    <div class="orderListItem">
        <c:forEach items="${os}" var="o">
            <table class="orderListItemTable" orderStatus="${o.status}" oid="${o.id}">
                <tr class="orderListItemFirstTR">
                    <td colspan="2">
                        <b><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                        <span>订单号: ${o.orderCode}
                    </span>
                    </td>
                    <td  colspan="2"><img width="13px" src="img/site/timg.png">农产品平台</td>
                    <td colspan="1">
                        <a class="wangwanglink" href="#nowhere">
                            <div class="orderItemWangWangGif"></div>
                        </a>

                    </td>
                    <td class="orderItemDeleteTD">
                        <a class="deleteOrderLink" oid="${o.id}" href="#nowhere">
                            <span  class="orderListItemDelete glyphicon glyphicon-trash"></span>
                        </a>

                    </td>
                </tr>
                <c:forEach items="${o.orderItems}" var="oi" varStatus="st">
                    <tr class="orderItemProductInfoPartTR" >
                        <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
                        <td class="orderItemProductInfoPartTD">
                            <div class="orderListItemProductLinkOutDiv">
                                <a href="foreProduct?pid=${oi.product.id}">${oi.product.name}</a>
                                <div class="orderListItemProductLinkInnerDiv">
                                    <img src="img/site/creditcard.png" title="支持信用卡支付">
                                    <img src="img/site/7day.png" title="消费者保障服务,承诺7天退货">
                                    <img src="img/site/promise.png" title="消费者保障服务,承诺如实描述">
                                </div>
                            </div>
                        </td>
                        <td  class="orderItemProductInfoPartTD" width="100px">
                            <div class="orderListItemProductOriginalPrice">￥<fmt:formatNumber type="number" value="${oi.product.price}" minFractionDigits="2"/>
                                <span class="number">${oi.number}</span></div>
                        </td>

                        <c:if test="${st.count==1}">

                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="100px">
                                <span class="orderListItemNumber">${o.totalNumber}</span>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
                                <div class="orderListItemProductRealPrice">￥<fmt:formatNumber  minFractionDigits="2"  maxFractionDigits="2" type="number" value="${o.total}"/></div>
                                <div class="orderListItemPriceWithTransport">(含运费：￥0.00)</div>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
                                <c:if test="${o.status=='waitConfirm' }">
                                    <a href="foreConfirmPay?oid=${o.id}">
                                        <button class="orderListItemConfirm">确认收货</button>
                                    </a>
                                </c:if>
                                <c:if test="${o.status=='waitPay' }">
                                    <a href="foreAlipay?oid=${o.id}&total=${o.total}">
                                        <button class="orderListItemConfirm">付款</button>
                                    </a>
                                </c:if>

                                <c:if test="${o.status=='waitDelivery' }">
                                    <span>待发货</span>
                                    <%--                                     <button class="btn btn-info btn-sm ask2delivery" link="admin_order_delivery?id=${o.id}">催卖家发货</button> --%>

                                </c:if>

                                <c:if test="${o.status=='waitReview' }">
                                    <a href="foreReview?oid=${o.id}">
                                        <button  class="orderListItemReview">评价</button>
                                    </a>
                                </c:if>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>

            </table>
        </c:forEach>

    </div>

</div>
</body>
</html>
