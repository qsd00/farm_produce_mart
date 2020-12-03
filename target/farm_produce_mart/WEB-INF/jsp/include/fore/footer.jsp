<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/2/8
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .modal-dialog{
        height: 1000px;
        width: 350px;
        position: relative;
        top: 100px;
    }

    div.loginInput {
        border: 1px solid #CBCBCB;
        margin: 20px 0px;
    }

    div.loginInput input {
        display: inline-block;
        border: 0px solid transparent;
        width: 244px;
        height: 30px;
        position: relative;
        left: 6px;
        top: 6px;
    }

    div.loginInput span, div.loginInput input {
        display: inline-block;
    }

    div.loginInput span.loginInputIcon {
        margin: 0px;
        background-color: #CBCBCB;
        width: 40px;
        height: 40px;
    }

    span.loginInputIcon span.glyphicon {
        font-size: 22px;
        position: relative;
        left: 9px;
        top: 9px;
        color: #606060;
    }

    button.redButton {
        color: white;
        background-color: #C40000;
        font-size: 14px;
        font-weight: bold;
    }
    .loginErrorMessageDiv{
        display: none;
        text-align: center
    }



</style>
<body>
<div id="footer" >
    <div id="f"> <ul >
        <li class="fu"><img class="fmg" src="img/3.png"><ul><li class="fm">新手指南</li><li class="fm">注册新用户</li></ul></li>
        <li class="fu"><img  class="fmg" src="img/4.png"><ul><li class="fm">采购商服务</li><li class="fm">找供应</li><li class="fm">发布供应</li></ul></li>
        <li class="fu"><img  class="fmg" src="img/5.png"><ul><li class="fm">供货商服务</li><li class="fm">找采购</li></ul></li>
        <li class="fu"><img  class="fmg" src="img/6.png"><ul><li class="fm">交易安全</li><li class="fm">营销推广</li></ul></li> <div class="clear"></div>
    </ul></div>
</div>
<div class="modal " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">账户登陆</h4>
            </div>
            <div class="modal-body"><div class="loginErrorMessageDiv" ><span class="errorMessage" style="color: red"></span></div>
                <div  class="loginInput " >
                            <span class="loginInputIcon ">
                                <span class=" glyphicon glyphicon-user"></span>
                            </span>
                    <input  id="name" name="name" placeholder="手机/会员名/邮箱" type="text">
                </div>
                <div  class="loginInput " >
                            <span class="loginInputIcon ">
                               <span class=" glyphicon glyphicon-lock"></span>
                            </span>
                    <input id="password" name="password"  type="password" placeholder="密码" type="text">
                </div><br>
                <div >
                    <a href="#nowhere">忘记登录密码</a>
                    <a href="register.jsp" class="pull-right">免费注册</a>
                </div>
                <div style="margin-top:20px">
                    <button id="loginButton" class="btn btn-block redButton loginSubmitButton" type="submit">登录</button>
                </div><br><br>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->


</div>
</body>
</html>
