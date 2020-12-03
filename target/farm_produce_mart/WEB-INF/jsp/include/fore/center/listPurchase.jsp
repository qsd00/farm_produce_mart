<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/13
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<style>
    .listDataTableDiv{
        width: 70%;
        margin-left: auto;
        margin-right: auto;
    }

    #panel{
        width: 400px;
        height: 300px;
    }
</style>
<body>

<br>
<center>
<div class="workingArea">

    <div class="listDataTableDiv">
        <table  width="500px" class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th width="5%">ID</th>
                <th width="">采购品种</th>
                <th width="10%">采购数量</th>
                <th width="10%">期望货源地</th>
                <th width="5%">编辑</th>
                <th width="5%">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${p.name}</td>
                    <td>${p.num}${p.unit}</td>
                    <td>${p.saddress}</td>
                    <td><a href="edit_purchase?id=${p.id}"><span class="glyphicon glyphicon-edit" ></span></a></td>
                    <td><a deleteLink="true" href="delete_Purchase?id=${p.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../../../include/admin/adminPage.jsp" %>
    </div>
<br>
    <div class="panel panel-warning addDiv" id="panel">
        <div class="panel-heading">新增采购</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="add_purchase" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>采购分类</td>
                        <td><select name="fid">
                            <c:forEach items="${fs}" var="f">
                                <option value="${f.id}" >${f.name}</option>
                            </c:forEach>
                        </select></td>
                    </tr>
                    <tr>
                        <td>采购品种</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>采购数量</td>
                        <td>
                            <input id="num"  type="text" name="num"  class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>单位</td>
                        <td>
                            <input id="unit"  type="text" name="unit"  class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>期望货源地</td>
                        <td><input  id="saddress" name="saddress" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="uid" value="${user.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div></center><br><br>
</body>
</html>
