<%-- 
    Document   : productJSON
    Created on : 30 Jun 2022, 13:04:45
    Author     : gabriele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>

<json:object>
    <json:property name="prodName" value="${prodotto.getNome()}" />
    <json:property name="prodDesc" value="${prodotto.getDescrizione()}" />
    <json:property name="prodPrice" value="${prodotto.getPrezzo()}" />
    <json:property name="prodNPages" value="${prodotto.getnPagine()}" />
    <json:property name="prodFormat" value="${prodotto.getFormato()}" />
    <json:property name="prodDim" value="${prodotto.getDimensione()}" />
    <json:property name="prodYear" value="${prodotto.getAnnoAccademico()}" />
    <json:property name="prodImg" value="${prodotto.getPathToImg()}" />
    <json:property name="prodUserId" value="${prodotto.getUtenteId()}" />
</json:object>
