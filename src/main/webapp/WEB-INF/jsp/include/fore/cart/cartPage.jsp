<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/25
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<style>
    div.cartDiv {
        max-width: 1013px;
        margin: 10px auto;
        color: black;
    }

    span.cartTitlePrice {
        color: #C40000;
        font-size: 14px;
        font-weight: bold;
        margin-left: 5px;
        margin-right: 3px;
    }

    div.cartTitle button {
        background-color: #AAAAAA;
        border: 1px solid #AAAAAA;
        color: white;
        width: 53px;
        height: 25px;
        border-radius: 2px;
    }

    table.cartProductTable {
        width: 100%;
        font-size:12px;
    }

    table.cartProductTable th {
        font-weight: normal;
        color: #3C3C3C;
        padding: 20px 20px;
    }

    img.cartProductImg {
        padding: 1px;
        border: 1px solid #EEEEEE;
        width: 80px;
        height: 80px;
    }

    a.cartProductLink {
        color: #3C3C3C;
    }

    a.cartProductLink:hover {
        color: #C40000;
        text-decoration: underline;
    }

    div.cartProductLinkOutDiv {
        position: relative;
        height: 80px;
    }

    div.cartProductLinkInnerDiv {
        position: absolute;
        bottom: 0;
        height: 20px;
    }

    tr.cartProductItemTR td {
        padding: 20px 20px;
    }

    tr.cartProductItemTR {
        border: 1px solid #CCCCCC;
    }

    span.cartProductItemOringalPrice {
        text-decoration: line-through;
        color: #9C9C9C;
        display: block;
        font-weight: bold;
        font-size: 14px;
    }

    span.cartProductItemPromotionPrice {
        font-family: Arial;
        font-size: 14px;
        font-weight: bold;
        color: #C40000;
    }

    span.cartProductItemSmallSumPrice {
        font-family: Arial;
        font-size: 14px;
        font-weight: bold;
        color: #C40000;
    }

    div.cartProductChangeNumberDiv {
        border: solid 1px #E5E5E5;
        width: 80px;
    }

    div.cartProductChangeNumberDiv input {
        border: solid 1px #AAAAAA;
        width: 42px;
        display: inline-block;
    }

    div.cartProductChangeNumberDiv a {
        text-decoration: none;
    }

    div.cartProductChangeNumberDiv a {
        width: 14px;
        display: inline-block;
        text-align: center;
        color: black;
        text-decoration: none;
    }

    img.cartProductItemIfSelected, img.selectAllItem {
        cursor: pointer;
    }

    div.cartFoot {
        background-color: #E5E5E5;
        line-height: 50px;
        margin: 20px 0px;
        color: black;
        padding-left: 20px;
    }

    span.cartSumNumber {
        color: #C40000;
        font-weight: bold;
        font-size: 16px;
    }

    span.cartSumPrice {
        color: #C40000;
        font-weight: bold;
        font-size: 20px;
    }

    div.cartFoot button {
        background-color: #AAAAAA;
        border: 0px solid #AAAAAA;
        color: white;
        height: height%;
        width: 120px;
        height: 50px;
        font-size: 20px;
        text-align: center;
        /* 	border-radius: 2px; */
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


    table.orderListItemTable td {
        padding: 8px 10px;
    }

    div.deleteConfirmModalDiv {
        width: 350px;
        position: absolute;
        top: 50px;
        margin-left: 700px;
    }


</style>
<script>
    var deleteOrderItem = false;
    var deleteOrderItemid = 0;
    $(function(){

        $("a.deleteOrderItem").click(function(){//点击删除按钮弹出确认删除按钮
            deleteOrderItem = false;
            var oiid = $(this).attr("oiid")
            deleteOrderItemid = oiid;
            $("#deleteConfirmModal").modal('show');
        });
        $("button.deleteConfirmButton").click(function(){//点击确认删除，隐藏确认删除按钮
            deleteOrderItem = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {//ajax删除订单项并隐藏该订单项
            if(deleteOrderItem){
                var page="foreDeleteOrderItem";
                $.post(
                    page,
                    {"oiid":deleteOrderItemid},
                    function(result){
                        if("success"==result){
                            $("tr.cartProductItemTR[oiid="+deleteOrderItemid+"]").hide();
                        }
                        else{
                            location.href="loginPage";
                        }
                    }
                );

            }
        })

        $("img.cartProductItemIfSelected").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $(this).attr("src","img/site/cartNotSelected.png");
                $(this).attr("selectit","false")
                $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
            }
            else{
                $(this).attr("src","img/site/cartSelected.png");
                $(this).attr("selectit","selectit")
                $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });
        $("img.selectAllItem").click(function(){//全选按钮添加样式
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit","false")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","img/site/cartNotSelected.png");
                    $(this).attr("selectit","false");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
                });
            }
            else{
                $("img.selectAllItem").attr("src","img/site/cartSelected.png");
                $("img.selectAllItem").attr("selectit","selectit")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","img/site/cartSelected.png");
                    $(this).attr("selectit","selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();

        });

        $(".orderItemNumberSetting").keyup(function(){//修改订单数量和总价格
            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
            num = parseInt(num);
            if(isNaN(num))
                num= 1;
            if(num<=0)
                num = 1;
            if(num>stock)
                num = stock;

            syncPrice(pid,num,price);
        });

        $(".numberPlus").click(function(){//修改订单项数量

            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();

            num++;
            if(num>stock)
                num = stock;
            syncPrice(pid,num,price);
        });
        $(".numberMinus").click(function(){//修改订单项数量
            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
            --num;
            if(num<=0)
                num=1;
            syncPrice(pid,num,price);
        });

        $("button.createOrderButton").click(function(){//跳到处理器计算出总费用，将订单项和总费用显示在结算页面
            var params = "";
            $(".cartProductItemIfSelected").each(function(){
                if("selectit"==$(this).attr("selectit")){
                    var oiid = $(this).attr("oiid");
                    params += "&oiid="+oiid;
                }
            });
            params = params.substring(1);
            location.href="foreBuy?"+params;
        });

    })

    function syncCreateOrderButton(){//选中订单项，给结算按钮添加样式
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function(){
            if("selectit"==$(this).attr("selectit")){
                selectAny = true;
            }
        });

        if(selectAny){
            $("button.createOrderButton").css("background-color","#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }
        else{
            $("button.createOrderButton").css("background-color","#AAAAAA");
            $("button.createOrderButton").attr("disabled","disabled");
        }

    }
    function syncSelect(){//选中添加选中图片，没选中添加没选中图片
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function(){
            if("false"==$(this).attr("selectit")){
                selectAll = false;
            }
        });

        if(selectAll)
            $("img.selectAllItem").attr("src","img/site/cartSelected.png");
        else
            $("img.selectAllItem").attr("src","img/site/cartNotSelected.png");

    }
    function calcCartSumPriceAndNumber(){//计算出总价格
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
            var oiid = $(this).attr("oiid");
            var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
            price = price.replace(/,/g, "");
            price = price.replace(/￥/g, "");
            sum += new Number(price);

            var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
            totalNumber += new Number(num);

        });

        $("span.cartSumPrice").html("￥"+formatMoney(sum));
        $("span.cartTitlePrice").html("￥"+formatMoney(sum));
        $("span.cartSumNumber").html(totalNumber);
    }
    function syncPrice(pid,num,price){//修改总价格，并修改订单项的数量
        $(".orderItemNumberSetting[pid="+pid+"]").val(num);
        var cartProductItemSmallSumPrice = formatMoney(num*price);
        $(".cartProductItemSmallSumPrice[pid="+pid+"]").html("￥"+cartProductItemSmallSumPrice);
        calcCartSumPriceAndNumber();

        var page = "foreChangeOrderItem";
        $.post(
            page,
            {"pid":pid,"number":num},
            function(result){
                if("success"!=result){
                    location.href="login.jsp";
                }
            }
        );

    }
</script>
<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品  (不含运费)</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" disabled="disabled">结 算</button>
    </div>

    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
                    全选

                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ois }" var="oi">
                <tr oiid="${oi.id}" class="cartProductItemTR">
                    <td>
                        <img selectit="false" oiid="${oi.id}" class="cartProductItemIfSelected" src="img/site/cartNotSelected.png">
                        <a style="display:none" href="#nowhere"><img src="img/site/cartSelected.png"></a>
                        <img class="cartProductImg"  src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg">
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a href="foreProduct?pid=${oi.product.id}" class="cartProductLink">${oi.product.name}</a>
                            <div class="cartProductLinkInnerDiv">
                                <img src="img/site/creditcard.png" title="支持信用卡支付">
                                <img src="img/site/7day.png" title="消费者保障服务,承诺7天退货">
                                <img src="img/site/promise.png" title="消费者保障服务,承诺如实描述">
                            </div>
                        </div>

                    </td>
                    <td>
                        <span  class="cartProductItemPromotionPrice">￥${oi.product.price}</span>

                    </td>
                    <td>

                        <div class="cartProductChangeNumberDiv">
                            <span class="hidden orderItemStock " pid="${oi.product.id}">${oi.product.stock}</span>
                            <span class="hidden orderItemPromotePrice " pid="${oi.product.id}">${oi.product.price}</span>
                            <a  pid="${oi.product.id}" class="numberMinus" href="#nowhere">-</a>
                            <input pid="${oi.product.id}" oiid="${oi.id}" class="orderItemNumberSetting" autocomplete="off" value="${oi.number}">
                            <a  stock="${oi.product.stock}" pid="${oi.product.id}" class="numberPlus" href="#nowhere">+</a>
                        </div>

                    </td>
                    <td >
                            <span class="cartProductItemSmallSumPrice" oiid="${oi.id}" pid="${oi.product.id}" >
                            ￥<fmt:formatNumber type="number" value="${oi.product.price*oi.number}" minFractionDigits="2"/>
                            </span>

                    </td>
                    <td>
                        <a class="deleteOrderItem" oiid="${oi.id}"  href="#nowhere">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div class="cartFoot">
        <img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
        <span>全选</span>
        <!--         <a href="#">删除</a> -->

        <div class="pull-right">
            <span>已选商品 <span class="cartSumNumber" >0</span> 件</span>

            <span>合计 (不含运费): </span>
            <span class="cartSumPrice" >￥0.00</span>
            <button class="createOrderButton" disabled="disabled" >结  算</button>
        </div>

    </div>

    <div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
        <div class="modal-dialog deleteConfirmModalDiv">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">确认删除？</h4>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                    <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
