<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/14
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/userBack/userHeader.jsp"%>
<%@include file="../include/userBack/userNavigator.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","分类名称"))
                return false;
            if(!checkEmpty("categoryPic","分类图片"))
                return false;
            return true;
        });
    });

</script>
<body>

<br><br><br><br>

<div class="workingArea">
    <h1 class="label label-info" >一级分类</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table  width="500px" class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th width="5%">ID</th>
                <th width="">图片</th>
                <th width="10%">分类名称</th>
                <th width="10%">二级分类</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><img height="40px" src="img/firstcategory/${c.id}.jpg"></td>
                    <td>${c.name}</td>
                    <td><a href="userBack_secondcategory_list?fid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
       <%@include file="../include/userBack/userPage.jsp" %>
    </div><div class="clear"></div>

</div>
<%@include file="../include/userBack/userFooter.jsp"%>
</body>
</html>
