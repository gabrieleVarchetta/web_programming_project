<%-- 
    Document   : products
    Created on : 9 May 2022, 12:15:08
    Author     : gabriele
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YourNotes - Prodotti</title>
        <meta name="keyword" content="appunti, studenti, studio, informatica, programmazione, università">
        <meta name="author" content="Matteo Deiana Daniel Dettori Gabriele Pinducciu Gabriele Varchetta">
        <meta name="description" content="Pagina in cui effettuare il login al sito">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       
      
    </head>
    <body>
        <!-- se non esiste una sessione, l'utente che prova ad accedere alla pagina dei prodotti viene reindirizzato alla pagina di login, dove dovrà fare il login -->
        <c:if test="${empty username}">
            <c:redirect url="login.jsp" />
        </c:if>
        
        <c:if test="${empty prodotto}">
            <c:redirect url="getProducts" />
        </c:if>
        
        <jsp:include page="common/header.jsp" />
        
        <jsp:include page="common/navbar.jsp" />
        
         
        <div class="grid">
            <c:if test="${not empty prodotto}">
                <div id="prova">
                    <main>
                        <div id="product-container">
                                 <button id="prevProduct"> ← </button>
                           
                            <button id="nextProduct"> → </button>
                            <div class="product-page-products">
                                <div>
                                    <img id="prodImg" title="${prodotto.getNome()}" alt="Immagine per ${prodotto.getNome()}" src=${prodotto.getPathToImg()} width="200" height="250">
                                </div>
                                <div class="descrizione">
                                    <h4 id="prodName">${prodotto.getNome()}</h4>
                                    
                                    
                                    <ul>
                                        <li id="prodDesc">${prodotto.getDescrizione()}</li>
                                        <li id="prodPrice">Prezzo: ${prodotto.getPrezzo()} €</li>
                                        <li id="prodNPages">Numero pagine: ${prodotto.getnPagine()}</li>
                                        <li id="prodFormat">Tipo: ${prodotto.getFormato()}</li>
                                        <li id ="prodDim">Dimensione: ${prodotto.getDimensione()} mb</li>
                                        <li id="prodYear">Anno: ${prodotto.getAnnoAccademico()}</li>
                                        <li id="prodUserId">Inserito da ${prodotto.getUtenteId()}</li>
                                    </ul>
                                </div>
                            </div>

                            
                           
                           

                           
                        </div>
                    </main>
                </div>
            </c:if>

            <div> 
                <jsp:include page="common/aside.jsp" />
            </div>
        </div>
            
        <jsp:include page="common/footer.jsp" />
        
              <script type="text/javascript" src="js/script.js"></script>

    </body>
</html>