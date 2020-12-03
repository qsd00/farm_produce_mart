<%--
  Created by IntelliJ IDEA.
  User: 祁少东
  Date: 2020/4/14
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<Style>
    td{
        background-color: gainsboro;
        text-align: center;
        color: black;
    }
    a{
        color: black;
    }
    .selected{
        background-color: #5cb85c;
        color: gainsboro;
    }
    .t1{
        margin-left: 160px;
    }
</Style>
<%--<script>
    $(function () {
        $("a[fid]").click(function () {
            var fid=$(this).attr("fid")
            $("a[fid]").parent("td").removeClass("selected")
            $(this).parent("td").addClass("selected")
        })
    })
</script>--%>
<body>
<div class="t1">
    <table cellspacing="2px" border="1px">
        <tr>
            <td  width="150px" height="50px"><a  fid="all">全部分类</a></td>
            <c:forEach items="${fs}" var="f">
                <td width="150px"><a  href="foreFirstCategory?id=${f.id}" fid="${f.id}">${f.name}</a></td>
            </c:forEach>
        </tr>
    </table>
</div><br><br><br>
</body>
</html>
