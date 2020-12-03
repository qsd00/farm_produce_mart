<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/8
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>农产品电商平台</title>
</head>
<body>
<div id="header"><span id="hello">
    <a href="foreHome">
		<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
		首页
	</a>
    欢迎来到农产品电商平台！
    <c:if test="${!empty user}">
        ${user.name}&nbsp;<a href="foreLogout">退出</a>
    </c:if>
    <c:if test="${empty user}">
        <a href="loginPage">登陆</a>
        <a href="registPage">注册</a>
    </c:if>
</span>
    <span class="pull-right">
            <a href="fore_firstcategory_list">供应商后台</a>
			<a href="foreBought">个人中心</a>
			<a href="foreCart">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			购物车<strong>${cartTotalItemNumber}</strong>件</a>
		</span>
</div>
<div><hr></div>
<div id="top"> <img id="bb"  height="100%" src="img/site/timg.png">
    <form action="foreSearch" method="post" >
        <div class="searchDiv">
            <input name="keyword" type="text" value="${param.keyword}" placeholder="  苹果 大米">
            <button  type="submit" class="searchButton">搜索</button>
        </div>
    </form>
</div>

</body>
</html>
