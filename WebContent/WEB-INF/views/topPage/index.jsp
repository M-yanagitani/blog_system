<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2><c:out value="${view_user.blog_title}" /></h2>
        <table id="blog_list">
            <tbody>
                <tr>
                    <th class="blog_date">DATE</th>
                    <th class="blog_title">TITLE</th>
                    <th class="blog_content">CONTENT</th>
                    <th class="blog_action">ACTION</th>
                </tr>
                <c:forEach var="blog" items="${blogs}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="blog_date"><fmt:formatDate value='${blog.blog_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="blog_title">${blog.title}</td>
                        <td class="blog_content"><c:out value="${blog.content}" /></td>
                        <td class="blog_action">
                            <c:if test="${sessionScope.login_user.id == view_user.id}">
                                <a href="<c:url value='/blogs/edit?id=${blog.id}' />">EDIT</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${blogs_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((blogs_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/blogs/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/blogs/new' />">⇨ WRITE BLOG</a></p>

    </c:param>
</c:import>