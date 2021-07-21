<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="name">BLOG</label><br />
<c:out value="${sessionScope.login_user.blog_title}" />
<br /><br />

<label for="blog_date">DATE</label><br />
<input type="date" name="blog_date" value="<fmt:formatDate value='${blog.blog_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">NAME</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br /><br />

<label for="title">TITLE</label><br />
<input type="text" name="title" value="${blog.title}" />
<br /><br />

<label for="content">CONTENT</label><br />
<textarea name="content" rows="10" cols="50">${blog.content}</textarea>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">POST</button>