<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/21
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .imgAndInfo{
        margin: auto;
        width: 1200px;
    }
    .singleImg{
        width: 400px;
        float: left;
    }
    .showImg{
        width: 100%;
        display: block;
        height: 400px;
    }
    .sImg{
        width:70px ;
        height: 70px;
        display: block;
        margin-left: 10px;
        margin-top: 10px;
        cursor: pointer;
    }
    .priceAndScount{
        width: 100%;
        height: 150px;
        background-color: lightgray;
    }
    li{
        float: left;
        list-style: none;
    }
    .productInfo{
        margin-left: 500px;
    }
    .price{
        color: red;
        font-size: 40px;
    }
    .youxuan{
        color: #f9f9f9;
        background-color: red;
    }

    .productDetail{
        width: 70%;
        margin: auto;
    }

    .bar{
        width: 100%;
        background-color: gainsboro;
        height: 30px;
        font-size: 20px;
    }

    .sp{
        float: left;
        background-color: red;
        color: #f9f9f9;
        width: 20%;
        height: 100%;
        text-align: center;
        cursor: pointer;
    }

    .pj{
        float: left;
        width: 20%;
        height: 100%;
        text-align: center;
        cursor: pointer;
    }
    .clear{clear: both}

    .detailImg{
        width: 100%;
    }
    .detailImg>img{
        display: block;
        width: 70%;
        height: 700px;
        margin: auto;
    }

    .propertyAndValue{
        float: left;
        width: 30%;
        text-align: left;
    }

    .review{
        display: none;
    }

</style>
<script>
    $(function () {
        $(".sImg").click(function () {
            var src=$(this).attr("src")
            $(".showImg").attr("src",src)
        })

        $(".sp").click(function () {
            $(this).css({"background-color":"red","color":"#f9f9f9"})
            $(".pj").css({"background-color":"gainsboro","color":"black"})
            $(".detailImg").css("display","block")
            $(".review").css("display","none")
        })

        $(".pj").click(function () {
            $(this).css({"background-color":"red","color":"#f9f9f9"})
            $(".sp").css({"background-color":"gainsboro","color":"black"})
            $(".detailImg").css("display","none")
            $(".review").css("display","block")
        })

        $(".btn1").click(function () {
            var val=parseInt($(".count").val())
            var scount=parseInt($(".scount").text())
            if(val>scount){
                $(".count").val(val-1)
            }
        })

        $(".btn2").click(function () {
            var val=parseInt($(".count").val())
            var kc=parseInt($(".stock").text())
            if(val<kc){
                $(".count").val(val+1)
            }
        })
        $(".count").blur(function () {
            var val=parseInt($(".count").val())
            var kc=parseInt($(".stock").text())
            var scount=parseInt($(".scount").text())
            if (val>kc){
                $(".count").val(kc)
            }
            if(val<scount||$(".count").val()=="")
                $(".count").val(scount)
            if(!(/(^[1-9]\d*$)/.test(val))){
                alert("请输入正确的数值");
                $(".count").val(scount)
            }
        })
    })
</script>
<body>
<div class="imgAndInfo">
<%@ include file="product/productAndInfo.jsp"%>
<%@ include file="product/detailAndReview.jsp"%>
</div>
</body>
</html>
