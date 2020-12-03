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
<script type="text/javascript">
    function showProduct(cid){
        $("div.product[cid="+cid+"]").show();
    }

    function hideProduct(cid){
        $("div.product[cid="+cid+"]").hide();
    }
    $(function(){
        $(".menu1").mouseenter(function () {
            $(".pic-list").hide()
        })
        $(".menu1").mouseleave(function () {
            $(".pic-list").show()
        })
        $("div.eachCategory").mouseenter(function(){
            $(this).addClass("green");
            var cid = $(this).attr("cid");
            showProduct(cid);
        });
        $("div.eachCategory").mouseleave(function(){
            $(this).removeClass("green");
            var cid = $(this).attr("cid");
            hideProduct(cid);
        });
        $("div.product").mouseenter(function(){
            var cid = $(this).attr("cid");
            showProduct(cid);
        });
        $("div.product").mouseleave(function(){
            var cid = $(this).attr("cid");
            hideProduct(cid);
        });
        var timer = null; //声明一个全局定时器
        var index = 0;
        $(".next").click(function(){ //下一张
            next();
        });
        $(".prev").click(function(){ //上一张
            prev();
        })
        function next(){
            index++;
            if(index > 2){
                /*
                当图片到最后一张时跳回第一张，本例中在最后一张中放入了第一张的图片，为实现无缝切换图片的效果。
                */
                $(".pic-list").animate({left:-(index)*1000},500);
                index = 0;
                $(".pic-list").animate({left:0},0); //
            }
            $(".pic-list").animate({left:-index*1000},500);
            iconHover(index);
        }
        function prev(){
            index--;
            if(index < 0 ){
                index = 2;
                $(".pic-list").animate({left:-(index+1)*1000},0);
            }
            $(".pic-list").animate({left:-index*1000},500);
            iconHover(index);
        }
        function auto(){
            timer = setInterval(function(){ //设置自动播放的定时器
                next();
                iconHover(index);
            },4000)
        }
        auto();
        $(".menu2").mouseover(function(){ //鼠标移入 定时器取消
            clearInterval(timer);
            $('.btn').css("opacity",0.5)
        })
        $(".menu2").mouseleave(function(){ //鼠标离开 定时器开启
            auto();
            $('.btn').css("opacity",0)
        })
        //鼠标碰触圆点图标实现图片左右轮播
        $(".icon-list li").mouseover(function(){
            var index = $(this).index();
            $(".pic-list").animate({left:-index*1000},500);
            iconHover(index);
        })
        //实现被选图片对应圆点图标索引更新
        function iconHover(index){
            $(".icon-list li").eq(index).addClass("active").siblings().removeClass("active");
        }

    })
</script>
<style>
    .head{
        width: 200px;
        height: 30px;
        background-color: limegreen;
        margin-left: 150px;
        float: left;
    }
    .head1{
        width: 1000px;
        height: 30px;
        margin-left: 350px;
        background-color: yellowgreen;

    }
    .menu{
        margin-left: 150px;
        width: 1200px;
        height: 430px;
        /*background-color: #31b0d5;*/
    }
    .menu1{
        height: 100%;
        width: 200px;
        background-color: #f9f9f9;
        float: left;
    }
    .menu2{
        height: 100%;
        /*background-color: blue;*/
        position: relative;
        overflow: hidden;
    }
    .pic-list{
        width: 4000px;
        height: 500px;
        position: absolute;
        top: 0px;
        left: 0px;
    }
    .pic-list li{
        float: left;
    }
    .pic-list li img{
        width: 1000px;
        height: 500px;
    }
    .btn{
        opacity: 0;
        position: absolute;
        top: 50%;
        height: 50px;
        width: 50px;
        /*opacity: 0.5;*/
        border-radius: 5px;
        cursor: pointer;
        user-select: none;
        background: white;
        font-size: 25px;
        line-height: 50px;
        text-align: center;
        transition: all 1s;
        transform: translateY(-50%);
    }
    .next{
        right: 0;
    }
    .icon-list{
        position: absolute;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%);
    }
    .icon-list li{
        float: left;
        margin: 0 5px;
        height: 10px;
        width: 10px;
        border-radius: 50%;
        background: #ccc;
        cursor: pointer;
    }
    .icon-list .active{
        background: #fff;
    }
    ul,li{
        list-style-type: none;

    }
    .product{
        position: absolute;
        top: 0px;
        left: 0px;
        background-color: #f9f9f9;
        border: 2px solid limegreen;
        width: 1000px;
        height: 500px;
        display: none;
    }
    .eachCategory{
        height: 14.3%;
        text-align: center;
        border-bottom: 1px solid darkgray;
    }
    *{
        margin: 0px;
        padding: 0px;
    }
    .ca{
        position: relative;
        top:20px;
    }
    .green{
        background: limegreen;
    }

</style>
<body>
<div class="head">
    <span style="margin-left:10px" class="glyphicon glyphicon-th-list"></span>
    <span style="margin-left:10px" >商品分类</span></div>
</div>
<div class="head1">
    <span style="margin-left: 30px" id="gg"><a href="foreProductQuotation">产品行情</a></span>
    <span style="margin-left: 30px"><a href="forePurchase">采购大厅</a></span>
</div>
<div class="menu">
    <div class="menu1">
        <c:forEach items="${fcs}" var="c" varStatus="vs">
            <div cid="${c.id}" class="eachCategory"  >
               <span class="ca"> <span   class="glyphicon glyphicon-link"></span></span>
                <a class="ca" href="foreFirstCategory?id=${c.id}">
                        ${c.name}
                </a>
            </div>
        </c:forEach>
    </div>

    <div class="menu2">
        <ul class="pic-list">
            <li><img src="img/7.jpg"></li>
            <li><img src="img/8.jpg"></li>
            <li><img src="img/9.jpg"></li>
            <li><img src="img/7.jpg"></li>
        </ul>
        <div class="btn next">&gt;</div>
        <div class="btn prev">&lt;</div>
        <ul class="icon-list">
            <li class="active"></li>
            <li></li>
            <li></li>
        </ul>
        <div cid="1" class="product">
            <c:forEach items="${scs0}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        <div cid="2" class="product">
            <c:forEach items="${scs1}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        <div cid="3" class="product">
            <c:forEach items="${scs2}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        <div cid="4" class="product">
            <c:forEach items="${scs3}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        <div cid="5" class="product">
            <c:forEach items="${scs4}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        <div cid="6" class="product">
            <c:forEach items="${scs5}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        <div cid="7" class="product">
            <c:forEach items="${scs6}" var="sc">
                &nbsp;&nbsp;&nbsp;&nbsp;${sc.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${sc.lc}" var="cc">
                    |&nbsp;<a href="foreCategory?cid=${cc.id}">${cc.name}</a>&nbsp;
                </c:forEach><br><br>
            </c:forEach>
        </div>
        </div>
</div>

</body>
</html>
