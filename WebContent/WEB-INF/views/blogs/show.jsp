<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${blog != null}">
                <h2><c:out value="${blog.user.blog_title}" /></h2>

                <table>
                    <tbody>
                        <tr>
                            <th>TITLE</th>
                            <td><c:out value="${blog.title}" /></td>
                        </tr>
                        <tr>
                            <th>NAME</th>
                            <td><c:out value="${blog.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>DATE</th>
                            <td><fmt:formatDate value="${blog.blog_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>CONTENT</th>
                            <td>
                                <pre><c:out value="${blog.content}" /></pre>
                            </td>
                        </tr>
                        <tr>
                            <th>CREATE AT</th>
                            <td>
                                <fmt:formatDate value="${blog.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>UPDATE AT</th>
                            <td>
                                <fmt:formatDate value="${blog.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_user.id == blog.user.id}">
                    <p><a href="<c:url value="/blogs/edit?id=${blog.id}" />">EDIT</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/blogs/index" />">⇨ INDEX</a></p>
    </c:param>
</c:import>