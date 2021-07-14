<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h2>MY PAGE</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>CODE</th>
                            <td><c:out value="${user.code}" /></td>
                        </tr>
                        <tr>
                            <th>NAME</th>
                            <td><c:out value="${user.name}" /></td>
                        </tr>
                        <tr>
                            <th>BLOG</th>
                            <td><c:out value="${user.blog_title}" /></td>
                        </tr>
                        <tr>
                            <th>PROFILE</th>
                            <td><c:out value="${user.profile}" /></td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="<c:url value='/users/edit?id=${user.id}' />">EDIT [ ユーザ編集 ]</a></p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/users/index' />">⇨ INDEX</a></p>
    </c:param>
</c:import>