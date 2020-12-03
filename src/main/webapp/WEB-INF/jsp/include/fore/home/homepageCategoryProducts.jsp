<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/15
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    .info{
        background-color: gainsboro;
        width: 1200px;
        margin-left: 150px;
    }
    .tj{
        display: inline;
      /*  position: relative;
        top: 10px;*/
    }
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

    .clear{clear: both}
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
</script><br><br>
<div class="info">
    <center>
        ========================================<img src="img/12.png" class="tj"><span style="font-size: 24px;font-weight: bold">热门推荐</span>========================================
    </center>
</div>
<div class="prodouctShow" >
    <c:forEach items="${pds}" var="p">
        <div id="${p.id}"  class="oneProduct">
            <a href="foreProduct?pdid=${p.id}">
                <img width="200px" height="200px" src="img/productSingle/${p.firstProductImage.id}.jpg">
                <p>${p.price}${p.unit}</p>
                <p>${p.name}</p></a>
        </div>
    </c:forEach>
</div>
<div class="clear"></div>
</body>
</html>
