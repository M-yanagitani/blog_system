<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>SIGN UP</h2>

        <form method="POST" action="<c:url value='/users/create' />">
            <c:import url="_form.jsp" />
        </form>

        <p><a href="<c:url value='/users/index' />">⇨ USER PAGE</a></p>
    </c:param>
</c:import>