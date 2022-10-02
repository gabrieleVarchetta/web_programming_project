<%-- 
    Document   : prodotto_inserito
    Created on : 9 May 2022, 22:09:55
    Author     : gabriele
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prodotto inserito</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       
    </head>
    <body>
         <!-- controlliamo che la sessione sia valida, se è valida mostriamo la pagina con il nome del prodotto, altrimenti reindirizziamo alla pagina di login -->
        <c:if test="${empty username}">
            <c:redirect url="login.jsp" />
        </c:if>
         
        <jsp:include page="common/header.jsp" />
         
        <div class="grid">
            <div id="prodotto-inserito-info">
                <h2>Prodotto inserito con successo</h2>
                <p>
                    Il tuo prodotto: ${nome}
                </p>
                <form action="getProductsByUser">
                    <input type="submit" value="Indietro" /> 
                </form>
            </div>
            <div>
                <jsp:include page="common/aside.jsp" />
            </div>
        </div>
        
        <jsp:include page="common/footer.jsp" />
        
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
