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
        <h2>FOLLOW</h2>
        <table id="user_list" border = "1">
            <tbody>
                <tr>
                    <th>USER ID</th>
                    <th>NAME</th>
                    <th>FOLLOW</th>
                    <th>BLOG</th>
                    <th>PROFILE</th>
                </tr>
                <c:forEach var="user" items="${users}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${user.code}" /></td>
                        <td><c:out value="${user.name}" /></td>
                        <td>
                            <select>
                                <option value="0"<c:if test="${user.follow_flag == 0}"> selected</c:if>>フォローしない</option>
                                <option value="1"<c:if test="${user.follow_flag == 1}"> selected</c:if>>フォローする</option>
                            </select>
                        </td>
                        <td><c:out value="${user.blog_title}" /></td>
                        <td><c:out value="${user.profile}" /></td>
                     </tr>
                </c:forEach>
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
        <p><a href="<c:url value='/users/new' />">⇨ SIGN UP [ 新規登録 ]</a></p>

    </c:param>
</c:import>