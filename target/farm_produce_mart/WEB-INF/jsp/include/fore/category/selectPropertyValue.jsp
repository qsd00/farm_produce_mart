<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/3/19
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .selectProperty{
        margin-left: 185px;
    }
   /* a{
        text-decoration: none;
        pointer-events: none;
    }*/
    a:hover{
        color: green;
        text-decoration: none;
    }
    .gre{
        background-color: green;
    }
</style>
<script>
    $(function () {
        $(".screen").click(function () {
            var a=$(".sel").find("option:selected")
            var pvs=""
            for (i=0;i<a.length;i++){
                if (a[i].text!="请选择"){
                    pvs+=a[i].text
                    if (i+1<a.length){
                        pvs+=","
                    }
                }
            }
            location="foreSelectCategory?pvs="+pvs+"&cid="+${cid}
        })
    })

</script>
<body>
<div class="selectProperty">
    <hr>
<c:forEach items="${ps}" var="p">
    ${p.name}<select class="sel">
    <option selected>请选择</option>
    <c:forEach items="${p.pvs}" var="pv" varStatus="st">
        <option value=${pv.value}>${pv.value}</option>
    </c:forEach>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
    <button class="screen">筛选</button>
   <%-- <table  width="1150px" frame="box"  rules="none" cellspacing="0">
    <c:forEach items="${ps}" var="p">
     <tr>
         <td height="30px" width="20%"><span class="property">${p.name}</span></td>
         <td height="30px" width="10%"><span style="background: green" class=${p.name} id="${p.id}" pv="1"  val=""><a href="#" class="c"><span class="a" style="color: #e3e3e3">不限</span></a></span></td>
         <td height="30px">
             <c:forEach items="${p.pvs}" var="pv" varStatus="st">
                 <span class=${p.name}+${st.count} id="pv.pid">&nbsp;&nbsp;&nbsp;<a class="c" href="foreSelectCategory?cid=${cid}&value=${pv.value}, "><span class="b">${pv.value}</span></a> &nbsp;&nbsp;&nbsp;</span>
             </c:forEach>
         </td>
     </tr>
    </c:forEach>
    </table>--%>
</div>
</body>
</html>
