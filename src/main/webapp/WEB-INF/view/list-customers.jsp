<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Customers List</title>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">
    <div id="content">

        <sec:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
            <input type="button" value="Add Customer"
                   onclick="window.location.href='showFormForAdd'; return false;"
                   class="add-button">
        </sec:authorize>



        <form:form action="search" method="get">
            Search customer: <input type="text" name="searchName">
            <input type="submit" value="Search" class="add-button">
        </form:form>

        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

            <c:forEach var="customer" items="${customers}">
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${customer.id}"/>
                </c:url>
                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${customer.id}"/>
                </c:url>
                <tr>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.email}</td>
                    <td>
                        <sec:authorize access="hasAnyRole('ADMIN', 'MANAGER')">
                            <a href="${updateLink}">UPDATE</a>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                            |
                            <a href="${deleteLink}" onclick="if (!(confirm('Are you sure?'))) return false">DELETE</a>
                        </sec:authorize>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <p></p>

    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" class="add-button"/>
    </form:form>
</div>


</body>
</html>
