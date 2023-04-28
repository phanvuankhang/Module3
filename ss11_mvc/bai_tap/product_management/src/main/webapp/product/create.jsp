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
<form method="post">
    <h1 style="text-align: center">ADD NEW PRODUCT</h1>
    <div class="mb-3">
        <label for="formGroupExampleInput" class="form-label">ID</label>
        <input type="text" class="form-control" id="formGroupExampleInput" name="id">
    </div>
    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Name</label>
        <input type="text" class="form-control" id="formGroupExampleInput2" name="name">
    </div>
    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Price</label>
        <input type="text" class="form-control" id="formGroupExampleInput3" name="price">
    </div>
    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Product Detail</label>
        <input type="text" class="form-control" id="formGroupExampleInput4" name="productDetail">
    </div>
    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form-label">Producer</label>
        <input type="text" class="form-control" id="formGroupExampleInput5" name="producer">
    </div>
    <button class="btn btn-outline-primary" type="submit">sumbit</button>
</form>
</body>
</html>
