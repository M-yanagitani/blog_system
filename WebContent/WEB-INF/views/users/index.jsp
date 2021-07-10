<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <!-- ユーザページ -->
        <h2>UR PAGE</h2>
        <table id="user_list">
            <tbody>
                <tr>
                    <th>USER ID</th>
                    <th>NAME</th>
                    <th>PROFILE</th>
                    <th>ARTICLE</th>
                    <th>FOLLOW</th>
                </tr>
                <tr>
                        <td><c:out value="${user.code}" /></td>
                        <td><c:out value="${user.name}" /></td>
                        <td><c:out value="${user.profile}" /></td>
                        <td><c:out value="${user.profile}" /></td>  <!-- 訂正必要 -->
                        <td><c:out value="${user.profile}" /></td>  <!-- 訂正必要 -->
                </tr>
            </tbody>
        </table>

        <div id="pagination">
            (全 ${users_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/users/new' />">新規ユーザー登録</a></p>

    </c:param>
</c:import>