<%--
  Created by IntelliJ IDEA.
  User: lapto
  Date: 4/28/2023
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align: center">Add New Product</h1>

<div align="center">
    <form action="/product?action=create" method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Product ID:</th>
                <td>
                    <input type="text" name="id" size="45">
                </td>
            </tr>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="name" size="45">
                </td>
            </tr>
            <tr>
                <th>Product Price:</th>
                <td>
                    <input type="text" name="price" size="45">
                </td>
            </tr>
            <tr>
                <th>Product Detail:</th>
                <td>
                    <input type="text" name="productDetail" size="45">
                </td>
            </tr>
            <tr>
                <th>Producer:</th>
                <td>
                    <input type="text" name="producer" size="45">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
