<%--
  Created by IntelliJ IDEA.
  User: 39740
  Date: 2020/10/8
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="/static/js/jquery-1.12.4.js"></script>
<form action="/" method="post">
    <table border="1px" width="750px">
        <tr align="center">
            <td colspan="5">
                <h3>记账管理</h3>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                类型:
                <select name="typeId">
                    <option value="0">不限</option>
                    <c:if test="${typeId == 1}"><option value="1" selected>支出</option></c:if><c:if test="${typeId != 1}"><option value="1" >支出</option></c:if>
                    <c:if test="${typeId == 2}"><option value="2" selected>收入</option></c:if><c:if test="${typeId != 2}"><option value="2" >收入</option></c:if>
                    <c:if test="${typeId == 3}"><option value="3" selected>转出</option></c:if><c:if test="${typeId != 3}"><option value="3" >转出</option></c:if>
                    <c:if test="${typeId == 4}"><option value="4" selected>借出</option></c:if><c:if test="${typeId != 4}"><option value="4" >借出</option></c:if>
                    <c:if test="${typeId == 5}"><option value="5" selected>借入</option></c:if><c:if test="${typeId != 5}"><option value="5" >借入</option></c:if>
                    <c:if test="${typeId == 6}"><option value="6" selected>还入</option></c:if><c:if test="${typeId != 6}"><option value="6" >还入</option></c:if>
                    <c:if test="${typeId == 7}"><option value="7" selected>还出</option></c:if><c:if test="${typeId != 7}"><option value="7" >还出</option></c:if>

                </select>
            </td>
            <td colspan="3">
                时间从:
                <input type="text" name="start" value="${start}">到<input type="text" name="end" value="${end}">
                <input type="submit" value="搜索">
                <input type="button" value="记账" onclick="add()">
            </td>
        </tr>
    </table>
    <table border="1px" width="750px">
        <tr align="center">
            <td>标题</td>
            <td>记账时间</td>
            <td>类别</td>
            <td>金额</td>
            <td>说明</td>
        </tr>
        <c:forEach var="item" items="${bills}">
        <tr align="center">
            <td>${item.title}</td>
            <td>
                <fmt:formatDate value="${item.billTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>
            </td>
            <td>
                <c:if test="${item.typeId == 1}">支出</c:if>
                <c:if test="${item.typeId == 2}">收入</c:if>
                <c:if test="${item.typeId == 3}">转出</c:if>
                <c:if test="${item.typeId == 4}">借出</c:if>
                <c:if test="${item.typeId == 5}">借入</c:if>
                <c:if test="${item.typeId == 6}">还入</c:if>
                <c:if test="${item.typeId == 7}">还出</c:if>
            </td>
            <td>
                <c:if test="${item.typeId == 2 || item.typeId == 5 || item.typeId == 6}">+</c:if>
                <c:if test="${item.typeId == 1 || item.typeId ==3 || item.typeId ==4 || item.typeId ==7}">-</c:if>
                    ${item.price}元
            </td>
            <td>${item.explains}</td>
        </tr>
        </c:forEach>
    </table>
</form>
<script>
    $("form").submit(function () {
        var start = $("[name = 'start']").val();
        var end = $("[name = 'end']").val();
        var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if(reg.test(start)==false){
            alert("日期格式不正确，正确格式为：2014-01-01");
            return;
        }
        if(reg.test(end) ==false){
            alert("日期格式不正确，正确格式为：2014-01-01");
            return;
        }
    })
    function add() {
        location.href="/jsp/add.jsp";
    }
</script>
</body>
</html>
