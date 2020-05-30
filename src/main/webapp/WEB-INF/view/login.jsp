<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Login</title>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/resources/css/style.css">
    <link type="text/css" rel="stylesheet"
          href="${ctx}/resources/css/add-customer-style.css">
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">
    <h3>Login</h3>

    <form:form action="${ctx}/authUser" method="post">
        <table>
            <tbody>
            <c:if test="${param.error != null}">
                <tr>
                    <td><label></label></td>
                    <td>Invalid username and password.</td>
                </tr>
            </c:if>
            <c:if test="${param.logout != null}">
            <tr>
                <td><label></label></td>
                <td> You have been logged out.</td>
            </tr>
            </c:if>
            <tr>
                <td><label>Username:</label></td>
                <td><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td><label>Password:</label></td>
                <td><input type="password" name="password"/></td>
            </tr>
            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Login" class="save"></td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
</body>
</html>
