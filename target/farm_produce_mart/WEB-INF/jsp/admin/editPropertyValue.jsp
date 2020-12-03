<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/11
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function() {
        $("input.pvValue").blur(function(){
            var value = $(this).val();
            value= value.replace(/[ ]/g,""); //替换所有空格！
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            $.post(
                page,
                {"value":value,"id":pvid},
                function(result){
                    if("success"==result){
                        parentSpan.css("border","1px solid green");
                    }
                    else
                        parentSpan.css("border","1px solid red");
                }
            );
        });
    });
</script>
<body>
<br><br><br>
<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_product_list?cid=${p.cid}">返回上一级</a></li>
        <li class="active">${p.name}</li>
    </ol>

    <div class="editPVDiv">
        <c:forEach items="${pvs}" var="pv">
            <div class="eachPV">
                <span class="pvName" >${pv.property.name}</span>
                <span class="pvValue"><input class="pvValue" pvid="${pv.id}" type="text" value="${pv.value}"></span>
            </div>
        </c:forEach>

        <div style="clear:both"></div>
    </div>

</div>
</body>
</html>
