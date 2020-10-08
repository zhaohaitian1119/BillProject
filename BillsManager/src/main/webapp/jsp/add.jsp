<%--
  Created by IntelliJ IDEA.
  User: 39740
  Date: 2020/10/8
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="/static/js/jquery-1.12.4.js"></script>
<body>
<form action="/add" method="post">
    <table width="300px" border="1px">
        <tr align="center">
            <td colspan="2" role="4">
                <h3>记账</h3>
            </td>
        </tr>
        <tr >
            <td>类型:</td>
            <td>
                <select name="typeId">
                    <option value="1">支出</option>
                    <option value="2">收入</option>
                    <option value="3">转出</option>
                    <option value="4">借出</option>
                    <option value="5">借入</option>
                    <option value="6">还入</option>
                    <option value="7">还出</option>
                </select>
            </td>
        </tr>
        <tr >
            <td>标题:</td>
            <td><input type="text" name="title"></td>
        </tr>
        <tr >
            <td>日期:</td>
            <td><input type="text" name="billtime"></td>
        </tr>
        <tr >
            <td>金额:</td>
            <td><input type="text" name="price"></td>
        </tr>
        <tr>
            <td>说明</td>
            <td>
                <textarea role="4" cols="30" name="explains">

                </textarea>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <input type="submit" value="保存">
                <input type="reset" value="重置">
                <input type="button" value="返回" onclick="javascript:history.back(-1);">
            </td>
        </tr>
    </table>
</form>
<script>

</script>
</body>
</html>
