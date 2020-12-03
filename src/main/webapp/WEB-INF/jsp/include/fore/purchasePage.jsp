<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/11
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    td{
        background-color: gainsboro;
        text-align: center;
        color: black;
    }
   /* a{
        color: black;
    }*/
    .selected{
        background-color: #5cb85c;
        color: gainsboro;
    }
    .t1{
        margin-left: 160px;
    }
    .t2{
        margin-left: 160px;
    }
    .show{
        border-style: solid;
        border-width: 1px;
    }
    .pageDiv{
        margin-left: 600px;
    }
    .green{
        color: green;
    }
    .selNull{
        width:550px ;
        height: 350px;
        display: none;
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
</style>
<script>
    $(function () {
        $("a[fid]").click(function () {
            var fid=$(this).attr("fid")
            if ($("tr[fid="+fid+"]").length==0){
                $(".t2").hide()
                $(".selNull").show()
            }else{
                $(".selNull").hide()
                $(".t2").show()
            }
            if(fid=="all"){
                location.reload()
            }else{
                $(".show tr[fid]").hide()
                $("tr[fid="+fid+"]").show()
            }
            $("a[fid]").parent("td").removeClass("selected")
            $(this).parent("td").addClass("selected")
        })

        $("tr[fid]").mouseenter(function () {
            $(this).children("td").addClass("green")
        })
        $("tr[fid]").mouseleave(function () {
            $(this).children("td").removeClass("green")
        })
    })
</script>
<body>
<div class="t1">
    <table cellspacing="2px" border="1px">
        <tr>
            <td class="selected" width="150px" height="50px"><a fid="all">全部分类</a></td>
            <c:forEach items="${fs}" var="f">
                <td width="150px"><a fid="${f.id}">${f.name}</a></td>
            </c:forEach>
        </tr>
    </table>
</div><br><br><br>
<div class="t2">
    <table class="show">
        <tr>
            <td width="240px" height="40px" >采购品种</td>
            <td width="240px" height="40px" >采购数量</td>
            <td width="240px" height="40px" >期望货源地</td>
            <td width="240px" height="40px" >发布人</td>
            <td width="240px" height="40px" >操作</td>
        </tr>

        <c:forEach items="${ps}" var="p">
            <tr fid="${p.fid}">
                <td width="240px" height="40px" style="background-color: white">${p.name}</td>
                <td width="240px" height="40px" style="background-color: white">${p.num}</td>
                <td width="240px" height="40px" style="background-color: white">${p.saddress}</td>
                <td width="240px" height="40px" style="background-color: white">${p.user.name}</td>
                <td width="240px" height="40px" style="background-color: white"><a href="forePurchaseShow?id=${p.id}"><span style="color: green">查看详情</span></a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<center>
    <div class="selNull">
        <img  class="null" src="img/11.jpg">
        <p class="selFont">啊哦，搜索为空！</p>
        <p>您可以尝试搜索其他的类目哦。</p>
    </div></center>
<div class="clear"></div>
<div class="pageDiv">
    <%@include file="../admin/adminPage.jsp" %>
</div><br><br><br>
</body>
</html>
