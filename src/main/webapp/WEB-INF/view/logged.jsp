<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<p>
    Logged as: <sec:authentication property="principal.username"/>
    (<sec:authentication property="principal.authorities"/>)
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" class="add-button"/>
    </form:form>
</p>
