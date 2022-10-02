<%-- 
    Document   : navbar
    Created on : 9 May 2022, 11:42:17
    Author     : gabriele
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <nav>
            <c:choose>
                <c:when test="${not empty username}">
                    <ul>
                        <li class="${pageContext.request.requestURI.endsWith('index.jsp') || pageContext.request.requestURI.endsWith('/') ? 'active' : ''} ? 'active' : ''}"><a href="index.jsp">HOMEPAGE</a></li>
                        <li class="${pageContext.request.requestURI.endsWith('products.jsp') ? 'active' : ''}"><a href="products.jsp" >PRODOTTI</a></li>
                        <li class="${pageContext.request.requestURI.endsWith('insertProducts.jsp') ? 'active' : ''}"><a href="insertProducts.jsp" >INSERIMENTO PRODOTTI</a></li>
                        <li class="${pageContext.request.requestURI.endsWith('members.jsp') ? 'active' : ''}"><a href="members.jsp" >MEMBRI</a></li>
                        <li class="${pageContext.request.requestURI.endsWith('areaPersonale.jsp') ? 'active' : ''}"><a href="areaPersonale.jsp" >UTENTE</a></li>
                    </ul>
                </c:when>
                
                <c:otherwise>
                    <ul>
                        <li class="${pageContext.request.requestURI.endsWith('index.jsp') || pageContext.request.requestURI.endsWith('/') ? 'active' : ''}"><a href="index.jsp" >HOMEPAGE</a></li>
                        <li class="${pageContext.request.requestURI.endsWith('members.jsp') ? 'active' : ''}"><a href="members.jsp" >MEMBRI</a></li>
                        <li class="${pageContext.request.requestURI.endsWith('login.jsp') ? 'active' : ''}"><a href="login.jsp" >LOGIN</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
            
        </nav>
    </body>
</html>
