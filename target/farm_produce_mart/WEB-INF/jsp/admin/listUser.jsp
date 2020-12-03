<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/14
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<style>
    #panel{
        width: 400px;
        height: 270px;
        position: absolute;
        left: 500px;
        bottom: 10px;
    }
</style>
<script>
    $(function () {
        $("#account").blur(function () {
            var p=$("#account").val()
            $.ajax({
                url:"checkName",
                type:"post",
                data:{"name":p},
                success:function (data) {
                    if ("fail"==data){
                       $(".info").text("账号已存在！")
                    }else{
                        $(".info").text("")
                    }
                }
            })
        })

        $("#pwd").blur(function () {
            var a=document.getElementById("pwd");
            if (a.value.length<6){
             alert("密码规则不符,至少6位！请重新输入！")
            }
        })

        $("#phone").blur(function () {
            var a=document.getElementById("phone");
            var reg=/^\d{11}$/;
            if (!reg.test(a.value)){
              alert("电话号码11位,请重新输入!")
            }
        })
        
        $("#addForm").submit(function () {
            if (!checkEmpty("name","账号"))
                return false;
            if (!checkEmpty("pwd", "密码"))
                return false;
            if (!checkEmpty("phone", "电话"))
                return false;
            if (!checkEmpty("address", "地址"))
                return false;
            if (!checkEmpty("zfb", "支付宝"))
                return false;
            return true;
        })
    })
</script>
<br><br><br>
<div class="workingArea">
    <h1 class="label label-info" >用户管理</h1>
    <br>
    <br>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>用户名称</th>
                <th>用户密码</th>
                <th>用户电话</th>
                <th>用户支付宝</th>
                <th>用户地址</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${us}" var="u" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${u.name}</td>
                    <td>${u.pwd}</td>
                    <td>${u.phone}</td>
                    <td>${u.zfb}</td>
                    <td>${u.address}</td>
                    <td><a href="admin_user_edit?id=${u.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_user_delete?id=${u.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>
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
            <form method="post" id="addForm" action="admin_user_add" >
                <table class="addTable">
                    <tr>
                        <td>账号</td>
                        <td><input  id="account" name="name" type="text" class="form-control"></td>
                        <span class="info"></span>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input  id="pwd" type="password" name="pwd" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input  id="phone" type="text" name="phone" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td><input  id="address" type="text" name="address" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>支付宝</td>
                        <td><input  type="text" name="zfb" class="form-control"></td>
                    </tr>
                    <input type="hidden" id="type" name="type" value="2">
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
