<%-- 
    Document   : areaPersonale
    Created on : 9 May 2022, 15:38:52
    Author     : gabriele
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YourNotes - Area Personale</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       <script type="text/javascript" src="js/script.js"></script>
       
    </head>
    <body>
        <!-- controlliamo che la sessione sia valida, se è valida mostriamo l'area personale, altrimenti reindirizziamo alla pagina di login -->
        <c:if test="${empty username}">
            <c:redirect url="login.jsp" />
        </c:if>
        
            <jsp:include page="common/header.jsp" />
            <jsp:include page="common/navbar.jsp" />
         
            <div class='grid'>
                <div>
                    <main>
                        
                            <div id="user-info">
                                <h2>Bentornato</h2>
                                <p>
                                    Ciao ${username}, questi sono i tuoi dati:
                                    <ul>
                                        <li>Nome: ${firstname}</li>
                                        <li>Cognome: ${cognome}</li>
                                        <li>Email: ${email}</li>
                                        <li>Città di nascita: ${citta}</li>
                                    </ul>
                                </p>
                                <h3>Questi sono i prodotti caricati da te:</h3>
                                <c:if test="${not empty listaProdottiPerUtente}">
                                    <div class="grid-products">
                                        <c:forEach items="${listaProdottiPerUtente}" var="prodotto">
                                            <div class="product">
                                                <div>
                                                    <img title="${prodotto.getNome()}" alt="Immagine per ${prodotto.getNome()}" src=${prodotto.getPathToImg()} width="100" height="150">
                                                </div>
                                                <div class="descrizione">
                                                    <h4>${prodotto.getNome()}</h4>
                                                    <ul>
                                                        <li>${prodotto.getDescrizione()}</li>
                                                        <li>Prezzo: ${prodotto.getPrezzo()} €</li>
                                                        <li>Numero pagine: ${prodotto.getnPagine()}</li>
                                                        <li>Tipo: ${prodotto.getFormato()}</li>
                                                        <li>Dimensione: ${prodotto.getDimensione()}</li>
                                                        <li>Anno: ${prodotto.getAnnoAccademico()}</li>
                                                        <li>Inserito da ${prodotto.getUtenteId()}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <c:if test="${empty listaProdottiPerUtente}">
                                    <div id="go-to-insert-products">
                                        <p>Nessun prodotto ancora inserito, premi il pulsante per inserire un prodotto</p>
                                        <form action="insertProducts.jsp">
                                            <input type="submit" value="Inserisci nuovo prodotto">
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        
                        
                            <div id="logout">
                                <h3>Effettua il logout dal tuo account</h3>
                                <form action="logout"> 
                                    <input type="submit" value="Logout" />
                                </form>
                            </div>
                        
                    </main>
                </div>
                <div>
                    <jsp:include page="common/aside.jsp" />
                </div>
            </div>
            
            <jsp:include page="common/footer.jsp" />
            


    </body>
</html>
