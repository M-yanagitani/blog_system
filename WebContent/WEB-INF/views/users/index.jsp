<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <!-- ユーザページ -->
        <h2>USERS</h2>
        <table id="user_list" border="1">
        <form method="GET" action="<c:url value='/users/serch' />">
            <input type="text" name="code" value="" />
            <button type="submit">SERCH</button>
        </form>
            <tbody>
                <tr>
                    <th>USER ID</th>
                    <th>NAME</th>
                    <th>BLOG</th>
                    <th>PROFILE</th>
                    <th>FOLLOW</th>
                </tr>
                <c:forEach var="user" items="${users}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${user.code}" /></td>
                        <td><a href="<c:url value='/index.html?id=${user.id}' />">
                                <c:out value="${user.name}" /></a></td>
                        <td><c:out value="${user.blog_title}" /></td>
                        <td><c:out value="${user.profile}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${follows != null}">
                                    <c:set var="follow_id" value="" />
                                    <c:forEach var="follow" items="${follows}" varStatus="status2">
                                        <c:if test="${follow.follow_user.id == user.id}">
                                            <c:set var="follow_id" value="${follow.id}" />
                                        </c:if>
                                    </c:forEach>
                                        <c:if test="${!empty follow_id}">
                                            <a href="<c:url value='/followers/destroy?follow_id=${follow_id}' />">
                                                <c:out value="フォロー中" />
                                            </a>
                                        </c:if>
                                        <c:if test="${empty follow_id}">
                                            <a href="<c:url value='/followers/create?follow_id=${user.id}' />">
                                                <c:out value="未フォロー" />
                                            </a>
                                        </c:if>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            (全 ${users_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 15) + 1}"
                step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${i}' />"><c:out
                                value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <input type="hidden" name="_token" value="${_token}" />
        <button type="submit">ENTRY</button>
        <p>
            <a href="<c:url value='/users/new' />">⇨ SIGN UP [ 新規登録 ]</a>
        </p>

    </c:param>
</c:import>