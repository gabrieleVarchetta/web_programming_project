<%-- 
    Document   : members
    Created on : 9 May 2022, 11:58:02
    Author     : gabriele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YourNotes - Membri</title>
        <meta name="author" content="Matteo Deiana Daniel Dettori Gabriele Pinducciu Gabriele Varchetta">
        <meta name="description" content="Presentazione dei membri portanti della pagina">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       
       
    </head>
    <body>
        <jsp:include page="common/header.jsp" />
        
        <jsp:include page="common/navbar.jsp" />
        
         
        <div class="grid">
            <div>
                <main>
                    <div id ="mdei" class="membro">
                        <div>
                            <img title="Foto profilo" alt="Foto profilo di Matteo Deiana" src="images/miche.png" width="125" height="125">
                        </div>
                        <div class="members-desc">
                            <h3>Matteo Deiana</h3>
                            <p>
                                Matteo Deiana si occupa di spargere il verbo di YourNotes, è il nostro social media manager e il suo compito
                                è quello di far conoscere la piattaforma al maggior numero di studenti possibile.
                            </p>
                        </div>
                    </div>

                    <div id ="dd" class="membro">
                        <div>
                            <img title="Foto profilo" alt="Foto profilo di Daniel Dettori" src="images/rafa.png" width="125" height="125">
                        </div>
                        <div class="members-desc">
                            <h3>Daniel Dettori</h3>
                            <p>
                                Daniel Dettori è un membro molto importante per YourNotes, si occupa costantemente della manutenzione e
                                dell'aggiornamento della piattaforma.
                            </p>
                        </div>
                    </div>

                    <div id="gp" class="membro">
                        <div>
                            <img title="Foto profilo" alt="Foto profilo di Gabriele Pinducciu" src="images/dona.png" width="125" height="125">
                        </div>
                        <div class="members-desc">
                            <h3>Gabriele Pinducciu</h3>
                            <p>
                                Gabriele Pinducciu è il co-fondatore di YourNotes, il suo contributo è presente in molti degli appunti in
                                ambito scientifico, scritti insieme al CEO Gabriele Varchetta.
                            </p>
                        </div>
                    </div>

                    <div id="gv" class="membro">
                        <div>
                            <img title="Foto profilo" alt="Foto profilo di Gabriele Varchetta" src="images/leo.png" width="125" height="125">
                        </div>
                        <div class="members-desc">
                            <h3>Gabriele Varchetta</h3>
                            <p>
                                Gabriele Varchetta è il CEO di YourNotes. Essendo uno studente presso il corso di laurea in Informatica,
                                la maggior parte degli appunti in ambito scientifico presenti sul sito sono stati scritti da lui.
                            </p>
                        </div>
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
