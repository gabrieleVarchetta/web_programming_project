<%-- 
    Document   : insert_products
    Created on : 9 May 2022, 12:18:49
    Author     : gabriele
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YourNotes - Inserisci Prodotto</title>
        <meta name="keyword" content="appunti, studenti, studio, informatica, programmazione, università">
        <meta name="author" content="Matteo Deiana Daniel Dettori Gabriele Pinducciu Gabriele Varchetta">
        <meta name="description" content="Pagina per l'inserimento di nuovi prodotti">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <!-- se non esiste una sessione, l'utente che prova ad accedere alla pagina dei prodotti viene reindirizzato alla pagina di login, dove dovrà fare il login -->
        <c:if test="${empty username}">
            <c:redirect url="login.jsp" />
        </c:if>
        
        <jsp:include page="common/header.jsp" />
        
        <jsp:include page="common/navbar.jsp" />
        
        
        <div class="grid">
            <div>
                <main>
                   
                        <div id="insert-products">
                            <h2>Inserisci un nuovo prodotto</h2>
                            <form action="inserimentoProdotto" method="POST" enctype="multipart/form-data">
                                <div> 
                                    <label for="name"> Inserisci il nome del prodotto</label>
                                    <input type="text" name="name" id="prod-name" required placeholder="es: Programmazione 1">
                                    <p id="prod-name-char">Caratteri a disposizione: 40</p>
                                    <span class="hidden" id="prod-name-msg">Il nome del prodotto deve avere una lunghezza compresa tra 2 e 40 caratteri</span>
                                </div>
                                    
                                <div>
                                    <label for="description"> Descrizione del prodotto</label>
                                    <input type="text" name="description" id="prod-description" required placeholder="es: Appunti di PR1">
                                    <p id="prod-desc-char">Caratteri a disposizione: 50</p>
                                    <span class="hidden" id="prod-desc-msg">La descrizione del prodotto deve avere una lunghezza compresa tra 5 e 50 caratteri</span>
                                </div>
                                    
                                <div>
                                    <label for="type"> Seleziona il tipo del file: </label>
                                    <select name="format" id="type">
                                        <option value="PDF">PDF</option>
                                        <option value="Foto">Foto</option>
                                        <option value="Altro">Altro</option>
                                    </select>
                                </div>
                                    
                                <div>
                                    <label for="price"> Prezzo: </label>
                                    <input type="number" name="price" id="price" required placeholder="es: 25$">
                                    <span class="hidden" id="prod-price-msg">Il prezzo del prodotto deve essere compreso tra 1 e 100 (€)</span>
                                </div>
                                    
                                <div>
                                    <label for="pages"> Numero pagine: </label>
                                    <input type="number" name="pages" id="pages" required placeholder="es: 213">
                                    <span class="hidden" id="prod-pages-msg">Il numero di pagine del prodotto deve essere compreso tra 1 e 1000</span>
                                </div>
                                    
                                <div>
                                    <label for="year"> Anno accademico: </label>
                                    <input type="number" name="year" id="year" required placeholder="es: 2019">
                                    <span class="hidden" id="prod-year-msg">L'anno accademico del prodotto deve essere compreso tra 1900 e </span>
                                </div>
                                    
                                <div>
                                    <label for="size"> Dimensione: </label>
                                    <input type="number" name="dim" id="size" required placeholder="es: 21mb">
                                    <span class="hidden" id="prod-size-msg">La dimensione del prodotto deve essere compreso tra 1 e 150</span>
                                </div>
                                    
                                <div>
                                    <label for="foto"> Inserisci copertina: </label>
                                    <input type="file" id="upload" name="file" accept="image/*" required>
                                </div>
                                    

                                <input id="submit-insert-products" type="submit" value="Conferma">
                            </form>
                        </div>
                   
                </main>
            </div>

            <div> 
                <jsp:include page="common/aside.jsp" />
            </div>
        </div>
            
        <jsp:include page="common/footer.jsp" />

       <script type="text/javascript" src="js/script.js"></script>

    </body>
</html>
