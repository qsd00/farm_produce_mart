<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/19
  Time: 21:36
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
    ul{
        list-style: none;
    }
    li{
        float: left;
    }
    #ul{
        margin-left: 600px;

    }

    .cur{
        color: black;
    }
</style>
<script>
    $(function () {
        $(".oneProduct").hide()
        $(".oneProduct").slice(0,10).show()
        $(".oneProduct").click(function (id) {
            var pdid=$(".oneProduct").attr("id")
           $.ajax({
               type:"post",
               url:"foreProduct",
               dataType:"json",
               data:{"pdid":pdid}
           })
        })
        var t=1
        $("a[pageNo=1]").children("span").addClass("cur")
        $("a[pageNo]").click(function () {
            $("a[pageNo="+t+"]").children("span").removeClass("cur")
            $(this).children("span").addClass("cur")
            var pageNo=$(this).attr("pageNo");
            t=pageNo
            var start=pageNo*10-10
            var end=pageNo*10
            $(".oneProduct").hide()
            $(".oneProduct").slice(start,end).show()
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

    <ul class="pagination" id="ul">
        <li ><a class="current" pageNo="1"><<</a></li>
        <c:forEach begin="1" end="${total}"  var="i">
            <li ><a class="current" pageNo="${i}"><span><c:out value="${i}"></c:out></span></a></li>
        </c:forEach>
        <li ><a class="current" pageNo="${total}">>></a></li>
    </ul><br><br>

</body>
</html>
