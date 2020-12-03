<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/1
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function(){
        $("button.orderPageCheckOrderItems").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
            return false;
        });

        $("button").click(function () {
            var acount=$(this).attr("account")
            var amount=$(this).attr("amount")
            var id=$(this).attr("id")
            $.ajax({
                type:"post",
                url:"transferAccounts",
                data:{"account":acount,"amount":amount,"id":id},
                success  : function (data) {
                    if (data=="success"){
                        alert("转账成功")
                        location.reload()
                    }
                    else {
                        alert("转账失败")
                    }
                }
            })
            return true;
        })
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
</style>
<body>
<div class="workingArea">
    <br><br><br><br>
    <h1 class="label label-info" >订单管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover1  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>状态</th>
                <th>金额</th>
                <th width="100px">商品数量</th>
                <th width="100px">商家名称</th>
                <th width="100px">商家支付宝账号</th>
                <th>创建时间</th>
                <th>发货时间</th>
                <th>收款时间</th>
                <th width="120px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${os}" var="o" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${o.statusDesc}</td>
                    <td>￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></td>
                    <td align="center">${o.totalNumber}</td>
                    <td align="center">${o.sellUser.name}</td>
                    <td align="center">${o.sellUser.zfb}</td>
                    <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${o.paidDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>

                        <c:if test="${o.status=='waitPaid'}">
                            <button type="button" id=${o.id} account=${o.sellUser.zfb} amount=${o.total} class="btn btn-primary btn-xs">转账</button>
                            <%--<a href="transferAccounts?account=${o.sellUser.zfb}&amount=${o.total}">
                                <button class="btn btn-primary btn-xs">转账</button>
                            </a>--%>
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
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>
</body>
</html>
