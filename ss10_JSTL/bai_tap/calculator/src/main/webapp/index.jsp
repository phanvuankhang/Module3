<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calcolator</h1>
<form action="/calculator-servlet" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td><input type="text" name="firstOperand"></td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td>
                    <select name="operator">
                        <option value="+">Add</option>
                        <option value="-">Apart</option>
                        <option value="*">Core</option>
                        <option value="/">Divide</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input type="text" name="secondOperand"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button>Calculator</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>