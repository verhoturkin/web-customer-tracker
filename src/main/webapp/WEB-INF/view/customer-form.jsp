<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Save Customer</title>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/resources/css/style.css">
    <link type="text/css" rel="stylesheet"
          href="${ctx}/resources/css/add-customer-style.css">
</head>
<body>
<%@include file="header.jsp" %>

<div id="container">
    <%@ include file="logged.jsp" %>

    <h3>Save Customer</h3>

    <form:form action="saveCustomer" modelAttribute="customer" method="post">
        <form:hidden path="id"/>
        <table>
            <tbody>
            <tr>
                <td><label>First name:</label></td>
                <td><form:input path="firstName"/></td>
            </tr>
            <tr>
                <td><label>Last name:</label></td>
                <td><form:input path="lastName"/></td>
            </tr>
            <tr>
                <td><label>Email:</label></td>
                <td><form:input path="email"/></td>
            </tr>
            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Submit" class="save"></td>
            </tr>
            </tbody>
        </table>
    </form:form>

    <div style="clear: both;"></div>

    <p>
        <a href="${ctx}/customer/list">Back to list</a>
    </p>

</div>
</body>
</html>
