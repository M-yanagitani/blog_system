<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>FOLLOW</h2>

        <table id="follow_list" border="1">
            <tbody>
                <tr>
                    <th>NAME</th>
                    <th>BLOG</th>
                    <th>PROFILE</th>
                    <th>FOLLOW</th>
                </tr>
                <c:forEach var="follower" items="${followers}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><a href="<c:url value='/index.html?id=${follower.follow_user.id}' />">
                            <c:out value="${follower.follow_user.name}" /></a></td>
                        <td><c:out value="${follower.follow_user.blog_title}" /></td>
                        <td><c:out value="${follower.follow_user.profile}" /></td>
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
            (全 ${followers_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((followers_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/followers/index?page=${i}' />">
                        <c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="<c:url value="/blogs/index" />">⇨ INDEX</a></p>
    </c:param>
</c:import>