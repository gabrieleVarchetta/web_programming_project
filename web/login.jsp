<%-- 
    Document   : login
    Created on : 9 May 2022, 11:52:49
    Author     : gabriele
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YourNotes - Login</title>
        <meta name="keyword" content="appunti, studenti, studio, informatica, programmazione, università">
        <meta name="author" content="Matteo Deiana Daniel Dettori Gabriele Pinducciu Gabriele Varchetta">
        <meta name="description" content="Pagina in cui effettuare il login al sito">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       
    </head>
    <body>
        <!-- se esiste una sessione, l'utente che prova ad accedere alla pagina di login viene reindirizzato all'area personale, dove potrà fare il logout -->
         <c:if test="${not empty username}">
            <c:redirect url="areaPersonale.jsp" />
        </c:if>
        
        <jsp:include page="common/header.jsp" />
        
        <jsp:include page="common/navbar.jsp" />
         
        <div class="grid">
            <div>
                <main>
                    <div id="login">
                        <h2>Effettua l'accesso al tuo account</h2>
                        <form action="login" method="post">
                            <div>
                                <label  for="user">Inserisci il tuo username</label>
                                
                                <input type="text" id="user" name="user" placeholder="Username" required/>
                                <p id="user-char">Caratteri a disposizione: 20</p>
                                <span class="hidden" id='user-msg'>Lo username deve avere una lunghezza compresa tra 5 e 20 caratteri </span>
                            </div>
                            <div>
                                <label  for="pass">Inserisci la tua password </label>
                                
                                <input type="password" id="pass" name="pass" placeholder="Password" required/>
                                <p id="pass-char">Caratteri a disposizione: 20</p>
                                <span class="hidden" id='pass-msg'>La password deve avere una lunghezza compresa tra 5 e 20 caratteri </span>
                            </div>
                           
                            <input id="submit-login" type="submit" value="Accedi" />
                        </form>

                        <h2>Oppure creane uno nuovo</h2>
                        <form action="register" method="post">
                            <div>
                                <label  for="name">Inserisci il tuo nome</label>
                                <p id="name-char">Caratteri a disposizione: 20</p>
                                <input type="text" id="name" name="firstname" placeholder="Nome" required />
                                <span id='name-msg' class='hidden'>Il nome deve avere una lunghezza compresa tra 2 e 20 caratteri </span>
                            </div>
                            <div>
                                <label  for="surname">Inserisci il tuo cognome</label>
                                <p id="surname-char">Caratteri a disposizione: 20</p>
                                <input type="text" id="surname" name="surname" placeholder="Cognome" required />
                                <span id='surname-msg' class='hidden'>Il cognome deve avere una lunghezza compresa tra 2 e 20 caratteri </span>
                            </div>
                            <div>
                                <label  for="mail">Inserisci la tua mail</label>
                                <p id="mail-char">Caratteri a disposizione: 30</p>
                                <input type="email" id="mail" name="mail" placeholder="Email" required />
                                <span id='mail-msg' class='hidden'>La mail deve avere una lunghezza compresa tra 10 e 30 caratteri </span>
                            </div>
                            <div>
                                <label  for="city">Inserisci la tua città</label>
                                <p id="city-char">Caratteri a disposizione: 30</p>
                                <input type="text" id="city" name="city" placeholder="Città" required />
                                <span id='city-msg' class='hidden'>La città deve avere una lunghezza compresa tra 4 e 30 caratteri </span>
                            </div>
                            <div>
                                <label  for="user">Inserisci il tuo username</label>
                                <p id="user--not-logged-char">Caratteri a disposizione: 20</p>
                                <input type="text" id="user--not-logged" name="user" placeholder="Username" required/>
                                <span id='not-logged-user-msg' class='hidden'>Lo username deve avere una lunghezza compresa tra 5 e 20 caratteri </span>
                            </div>
                            <div>
                                <label  for="pass">Inserisci la tua password</label>
                                <p id="pass--not-logged-char">Caratteri a disposizione: 20</p>
                                <input type="password" id="pass--not-logged" name="pass" placeholder="Password" required/>
                                <span id='not-logged-pass-msg' class='hidden'>La password deve avere una lunghezza compresa tra 5 e 20 caratteri </span>
                            </div>
                            
                            <input id="submit-register" type="submit" value="Registrati" />
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
