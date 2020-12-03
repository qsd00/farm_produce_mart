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
<body>
<style>
    div.reviewDate {
        width: 100px;
    }

    div.reviewDivlistReviewsEach div {
        display: inline-block;
    }

    div.reviewDate {
        color: #CCCCDD;
    }

    div.reviewContent {
        color: #333333;
        width: 698px;
    }

    div.reviewUserInfo {
        color: #333333;
    }

    div.reviewDivlistReviewsEach {
        padding: 20px;
        border-bottom: 1px solid #ECECEC;
    }
</style>
<div class="productDetail">
    <br><br><br>
    <div class="bar">
        <div class="sp">商品详情</div>
        <div class="pj">查看评价</div>
        <div class="kb">&nbsp;</div>
    </div>
    <div class="detailImg">
        <br>
        <p style="font-size: 20px">商品属性</p>
        <c:forEach items="${pvs}" var="pv">
            <div class="propertyAndValue">${pv.property.name}:&nbsp;${pv.value}</div>
        </c:forEach><br><br><br><br>
        <c:forEach items="${p.detailProductImage}" var="de">
            <img class="sImg" src="img/productDetail/${de.id}.jpg">
        </c:forEach>
    </div><br><br><br>
    <div class="review">
        <c:forEach items="${rs}" var="r">
            <div class="reviewDivlistReviewsEach">
                <div class="reviewDate"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
                <div class="reviewContent">${r.content}</div>
                <div class="reviewUserInfo pull-right">${r.user.name}</div>
            </div>
        </c:forEach>
        <br><br><br>
    </div>
</div>
</body>
</html>
