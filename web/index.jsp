<%-- 
    Document   : index
    Created on : 9 May 2022, 11:32:46
    Author     : gabriele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YourNotes</title>
        <meta name="keyword" content="appunti, studenti, studio, informatica, programmazione, università">
        <meta name="author" content="Matteo Deiana Daniel Dettori Gabriele Pinducciu Gabriele Varchetta">
        <meta name="description" content="Homepage di YourNotes">
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
                    
                    <div id="slogan">
                        <h2>
                            Perchè prendere appunti se puoi comprarli! 
                        </h2>
                    </div>

                    <div class="content">
                        <h3>Chi siamo:</h3>
                        <p>
                            YourNotes è una piattaforma che nasce con l'intento di semplificare la vita a tutti gli studenti universitari di
                            informatica che sono costantemente in difficoltà con lo studio o con gli appunti, o anche a chi vuole 
                            semplicemente imparare qualche argomento in particolare.
                        </p>
                    </div>

                    <div class="content">
                        <h3>Cosa offriamo:</h3>
                        <p>
                            All'interno della piattaforma sarà possibile acquistare e scaricare una moltitudine di appunti relativi 
                            all'informatica, dalla programmazione ai sistemi operativi e tanto altro.
                            Tutti gli appunti presenti sul sito sono stati scritti da ex studenti e studenti che hanno frequentato e studiato
                            in prima persona gli argomenti trattati, e sono proprio questi ex studenti che hanno creato e gestiscono tutta la
                            piattaforma.
                        </p>
                    </div>

                    <div class="content">
                        <h3>Cosa offriamo:</h3>
                        <p>
                            Più appunti ci sono, meglio è:
                            Anche gli utenti hanno la possibilità di caricare i propri appunti, cosi da espandere gli argomenti presenti nella
                            piattaforma. Ovviamente verrano visionati e controllati dagli amministratori del sito per assicurare sempre la
                            massima qualità del materiale fornito.
                        </p>
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
