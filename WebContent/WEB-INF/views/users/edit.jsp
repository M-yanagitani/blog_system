<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h2>USER PAGE</h2>
                <form method="POST" action="<c:url value='/users/update' />">
                    <label for="code">USER ID</label><br />
                    <input type="text" name="code" value="${user.code}" />
                    <br /><br />

                    <label for="name">NAME</label><br />
                    <input type="text" name="name" value="${user.name}" />
                    <br /><br />

                    <label for="code">BLOG TITLE</label><br />
                    <input type="text" name="blog_title" value="${user.blog_title}" />
                    <br /><br />

                    <label for="name">PROFILE</label><br />
                    <input type="text" name="profile" value="${user.profile}" />
                    <br /><br />

                    <label for="password">PASSWORD</label><br />
                    <input type="password" name="password" />
                    <br /><br />

                    <input type="hidden" name="_token" value="${_token}" />
                    <button type="submit">ENTRY</button>
                </form>

                <p><a href="#" onclick="confirmDestroy();">このユーザを削除する</a></p>
                <form method="POST" action="<c:url value='/users/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                    function confirmDestroy() {
                        if(confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/users/index' />">⇨ INDEX</a></p>
    </c:param>
</c:import>