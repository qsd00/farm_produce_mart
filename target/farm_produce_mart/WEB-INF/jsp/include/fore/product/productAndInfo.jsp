<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/21
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
$(function () {
    $(".addCartButton").removeAttr("disabled");
    $("#addCart").click(function () {
        $.ajax({
            type:"post",
            url:"foreCheckLogin",
            success:function (data) {
                if (data=="success"){
                    var pdid = ${p.id};
                    var num= $(".count").val();
                    var addCartpage = "foreAddCart";
                    $.get(
                        addCartpage,
                        {"pdid":pdid,"num":num},
                        function(data){
                            if("success"==data){
                                $("#addCart").html("已加入购物车");
                                $("#addCart").attr("disabled","disabled");
                                $("#addCart").css("background-color","lightgray")
                                $("#addCart").css("border-color","lightgray")
                                $("#addCart").css("color","black")
                                location.reload()

                            }
                            else{

                            }
                        }
                    );
                }else{
                    $("#myModal").modal("show")
                }
            }
        })
        return false;
    })

    $("#buy").click(function () {
        $.ajax({
            type:"post",
            url:"foreCheckLogin",
            success:function (data) {
                if ("success"==data){
                    var num=$(".count").val()
                    location.href= $("#buy").attr("href")+"&num="+num;
                }else{
                    $("#myModal").modal("show")
                }
            }
        })
        return false;
    })

    $("#loginButton").click(function () {
        var name=$("#name").val()
        var pwd=$("#password").val()
        if(0==name.length||0==password.length){
            $("span.errorMessage").html("请输入账号密码");
            $("div.loginErrorMessageDiv").show();
            return false;
        }
        $.ajax({
            type:"post",
            url:"foreLoginAjax",
            data:{"name":name,"pwd":pwd},
            success :function (data) {
                if ("success"==data){
                    $("#myModal").modal("hide")
                    location.reload()
                }
                else{
                    $("span.errorMessage").html("账号密码错误");
                    $("div.loginErrorMessageDiv").show();
                }
            }
        })
        return true;
    })
})
</script>
<body>
<div class="singleImgAndInfo">
    <div class="singleImg">
        <img class="showImg" src="img/productSingle/${p.firstProductImage.id}.jpg">
        <ul>
            <c:forEach items="${p.singleProductImage}" var="si">
                <li><img class="sImg" src="img/productSingle/${si.id}.jpg"></li>
            </c:forEach>
        </ul>
    </div>
    <div class="productInfo">
        <p style="font-size: 20px"><span class="youxuan">优选</span>&nbsp;&nbsp;${p.name}</p>
        <div class="priceAndScount"><br>
            <p>价格:<span class="price">${p.price}</span>${p.unit}</p><p>起批量:<span class="scount">${p.scount}</span></p>
        </div>
        <hr>
        <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            销量<span style="color: red" class="xl"> ${p.saleCount} </span> &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;累计评价<span style="color: red"> ${p.reviewCount}</span></p>
        <hr>
        <p>库存：<span class="stock">${p.stock}</span></p>
        购买数量:<input type="button" value="-" class="btn1"><input type="text" value=${p.scount} size="2"  class="count"> <input type="button" value="+" class="btn2">
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p><button id="buy" type="button"  href="foreBuyOne?pdid=${p.id}" class="btn btn-default" style="border-color: red"><span style="color: red">立即购买</span></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="addCart" type="button" href="foreAddCart"  class="btn btn-danger">加入购物车</button></p>
    </div>
</div>
</div>
<div class="clear"></div>
<br>
</body>
</html>
