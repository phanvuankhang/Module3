<%--
  Created by IntelliJ IDEA.
  User: lapto
  Date: 4/28/2023
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<h1>Product List</h1>
<button class="btn btn-outline-primary" onclick="window.location.href='/product?action=create'">Add New</button>

<table class="table table-dark table-striped">
    <thead>
    <tr>
        <th>#</th>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Product Detail</th>
        <th>Producer</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getProductDetail()}</td>
            <td>${product.getProducer()}</td>

    <th>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}">
            Delete
        </button>
    </th>
    </tr>
    <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Do you want to delete ${product.name}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" onclick="window.location.href='/product?action=delete&id=${product.id}'" class="btn btn-primary">OK</button>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    </tr>
    </tbody>
</table>

</body>
</html>
