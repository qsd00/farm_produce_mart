<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/14
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
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
    <h1 class="label label-info" >一级分类管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table  width="500px" class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th width="5%">ID</th>
                <th width="">图片</th>
                <th width="10%">分类名称</th>
                <th width="10%">二级分类管理</th>
                <th width="5%">编辑</th>
                <th width="5%">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c" varStatus="status">

                <tr>
                    <td>${status.count}</td>
                    <td><img height="40px" src="img/firstcategory/${c.id}.jpg"></td>
                    <td>${c.name}</td>

                    <td><a href="admin_secondcategory_list?fid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a href="admin_firstcategory_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_firstcategory_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
       <%@include file="../include/admin/adminPage.jsp" %>
    </div><div class="clear"></div>

    <div class="panel panel-warning addDiv" id="panel">
        <div class="panel-heading">新增分类</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_firstcategory_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分类圖片</td>
                        <td>
                            <input id="categoryPic" accept="image/*" type="file" name="image" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div><div class="clear"></div>

</div>
<%@include file="../include/admin/adminFooter.jsp"%>
</body>
</html>
