<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<button><a href="/customer-servlet">Hiển thị danh sách</a></button>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customers" items="${customersList}" varStatus="status">
        <tr>
            <td>${customers.name}</td>
            <td>${customers.birthDay}</td>
            <td>${customers.address}</td>
            <td><img src="${customers.image}" width="50" height="auto"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>