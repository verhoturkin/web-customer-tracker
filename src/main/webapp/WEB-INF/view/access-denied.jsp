<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Login</title>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/resources/css/style.css">
</head>
<body>
<%@include file="header.jsp" %>

<div id="container">
    <%@ include file="logged.jsp" %>

    <h2>ACCESS DENIED!</h2>

    <br><br>

    <a href="${ctx}/">Back to home page</a>
</div>
</body>
</html>
