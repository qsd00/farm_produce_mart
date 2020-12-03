<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/16
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    .sel{
        width: 1000px;
        height: 160px;
        margin-left: 200px;
    }
    .price{
        display: none;
    }
    .c{
        display: none;
    }
    .priceCount{
        display: none;
    }
    #myChart{
        font-size: 20px;
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
</style>
<br>
<div class="sel">
    <c:forEach items="${cs}" var="c" varStatus="sta">
        <a href="foreSearchProductQuotation?cid=${c.id}">${c.name}</a>|
    </c:forEach>
</div>
<c:if test="${empty pds}">
    <center>
        <div class="selNull">
            <img  class="null" src="img/11.jpg">
            <p class="selFont">啊哦，搜索为空！</p>
            <p>您可以尝试搜索其他的类目哦。</p>

        </div></center>
</c:if>
<div>
    <c:if test="${not empty pds}">
    <c:forEach items="${pds}" var="p">
        <span class="price">价格：${p.price},</span>
        <span class="priceCount">${p.priceCount},</span>
    </c:forEach>  <span class="c">${c.name}</span>
    <div style="width:800px;margin:0px auto">
        <canvas id="myChart" ></canvas>
    </div>
    </c:if>
</div><br><br>
<script>
  $(function () {
      var label=$(".c").text()+"市场价格统计表"//表名
        var a=$(".price").text()
      var pc=$(".priceCount").text()
         b=a.slice(0,a.length-1)
      pc1=pc.slice(0,pc.length-1)
         price=b.split(",")//价格数组
      priceCount=pc1.split(",")//价格个数数组
      var ctx = document.getElementById('myChart').getContext('2d');
      var myChart = new Chart(ctx, {
          type: 'line',
          data: {
              labels: price,
              datasets: [{
                  label: label,
                  data: priceCount,
                  borderColor:'blue',
                  borderWidth: 1,
                  fill: false,
              }]
          },
          options: {
              tooltips: {
                  intersect: false,
                  mode: 'index'
              }
          }
      });
  });
</script>
</body>
</html>
