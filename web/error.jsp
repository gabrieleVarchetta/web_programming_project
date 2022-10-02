<%-- 
    Document   : error
    Created on : 9 May 2022, 13:04:30
    Author     : gabriele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       
    </head>
    <body>
        <jsp:include page="common/header.jsp" />
        
        <div class="grid">
            <div>
                <main>
                    <article>
                        <div id="go-back-div">
                            <h2>${errMsg} </h2>
                            <form action="${link}">
                                <input type="submit" value="Indietro" /> 
                            </form>
                        </div>
                </article>
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
