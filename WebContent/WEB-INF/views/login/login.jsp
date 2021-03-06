<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                ユーザIDかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>LOGIN</h2>
        <form method="POST" action="<c:url value='/login' />">
            <label for="code">USER ID</label><br />
            <input type="text" name="code" value="${code}" />
            <br /><br />

            <label for="password">PASSWORD</label><br />
            <input type="password" name="password" />
            <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit">ENTER</button>
            <br /><br />

            <p>
            <a href="<c:url value='/users/new' />">⇨ SIGN UP [ 新規登録 ]</a>
            </p>

        </form>
    </c:param>
</c:import>