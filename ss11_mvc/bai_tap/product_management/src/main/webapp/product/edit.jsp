<%--
  Created by IntelliJ IDEA.
  User: lapto
  Date: 4/28/2023
  Time: 6:10 PM
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
<form method="post">.
  <label>Name</label>
  <input class="form-control"  name="name"><br>
  <label>Price</label>
  <input class="form-control"  type="number" name="price">
  <label>Description</label>
  <input class="form-control" name="description"><br>
  <label>Manufacturer</label>
  <input class="form-control"  name="manufacturer"><br>
  <button class="btn btn-success" type="submit">Create</button>
</form>

</body>
</html>
