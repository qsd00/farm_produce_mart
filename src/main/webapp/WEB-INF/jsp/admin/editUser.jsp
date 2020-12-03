<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/5/7
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function () {
        $("#name").blur(function () {
            var p=$("#name").val()
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

        $("#editForm").submit(function () {
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
<body>
<br><br><br>
<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_user_list?id=${u.id}">返回上一级</a></li>
        <li class="active">用户编辑</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑用户</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_user_update">
                <table class="editTable">
                    <tr>
                        <td>账号</td>
                        <td><input id="name" name="name" value="${u.name}" type="text" class="form-control">
                        <span class="info"></span></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input id="price" value="${u.pwd}" name="pwd" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input id="phone"  value="${u.phone}" name="phone" type="password"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td><input id="address"  value="${u.address}" name="address"  type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>支付宝</td>
                        <td><input id="zfb"  value="${u.zfb}" name="zfb" type="text"
                                   class="form-control"></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="type" value="${u.type}">
                            <input type="hidden" name="id" value="${u.id}">
                            <button type="submit" class="btn btn-success">提 交</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
