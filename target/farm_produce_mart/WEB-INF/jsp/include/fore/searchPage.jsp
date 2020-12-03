<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/16
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    .prodouctShow{
        width: 1150px;
        margin: auto;
    }

    .oneProduct{
        margin-top: 20px;
        margin-right: 30px;
        width: 200px;
        height: 300px;
        cursor: pointer;
        float: left;
    }

    .selNull{
        width:550px ;
        height: 350px;
    }
    .null{
        display: block;
        width: 250px;
        height: 250px;
        float: left;
    }
    .selFont{
        color: green;
        font-size: 20px;
    }

    .clear{clear: both}
   .pageDiv{
       margin-left: 600px;
   }

</style>
<script>
    $(function () {
        $(".oneProduct").click(function (id) {
            var pdid=$(".oneProduct").attr("id")
            $.ajax({
                type:"post",
                url:"foreProduct",
                dataType:"json",
                data:{"pdid":pdid}
            })
        })
    })
</script>
<div class="prodouctShow" >
    <c:if test="${empty pds}">
        <center>
            <div class="selNull">
                <img  class="null" src="img/11.jpg">
                <p class="selFont">啊哦，搜索为空！</p>
                <p>您可以尝试搜索其他的类目哦。</p>

            </div></center>
    </c:if>
    <c:forEach items="${pds}" var="p" varStatus="sta">
        <div id="${p.id}"  class="oneProduct" num="${sta.count}">
            <a href="foreProduct?pdid=${p.id}">
                <img width="200px" height="200px" src="img/productSingle/${p.firstProductImage.id}.jpg">
                <p>${p.price}${p.unit}</p>
                <p>${p.name}</p></a>
        </div>
    </c:forEach>
</div><div class="clear"></div>
<div class="pageDiv">
    <%@include file="../../include/admin/adminPage.jsp"%>
</div>
</body>
</html>
