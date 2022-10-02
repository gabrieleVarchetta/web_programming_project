<%-- 
    Document   : aside
    Created on : 9 May 2022, 11:42:56
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
        <aside>
            <div class="aside-content">
                <button class="size-btn default-size active-font">A</button>
                <button class="size-btn large-size">A+</button>
                <button class="size-btn x-large-size">A++</button>
            </div>
            
            <div class="aside-content">
                <h4>Gli appunti più richiesti:</h4>
                
                <ul>
                    <li>Programmazione 1 (C)</li>
                    <li>Programmazione 2 (Java)</li>
                    <li>Algoritmi e Strutture Dati (C)</li>
                </ul>
            </div>
            
            <div class="aside-content">
                <h4>Appunti presto in arrivo:</h4>
                <ul>
                    <li>Ingegneria del Software</li>
                    <li>Video Game Design</li>
                    <li>Linguaggi di Programmazione</li>
                    <li>Interazione Uomo Macchina</li>
                    <li>Basi di Dati</li>
                </ul>
            </div>
           
            <div class="aside-content">
                <img title="Banner pubblicitario" alt="Banner pubblicitario abbonamento mensile" src="images/banner.png" width="430" height="605">
            </div>
            
            <div>
                 <img title="Pubblicità" alt="Annuncio pubblicitario" src="images/adv.png" width="430" height="290">
            </div>           
        </aside>
    </body>
</html>
