<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/Discount-Amount" method="post">
    <table border="1">
        <tr>
            <td>
                <input type="text" name="productDescription" placeholder="Product Description">
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="listPrice" placeholder="List Price">
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="discountAmount" placeholder="Discount Percent">
            </td>
        </tr>
        <tr>
            <td>
                <button>Calculate Discount</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>