$(document).ready(function() {
    /* validazione login lato client */
    var isUserValid = false;
    var isPswValid = false;
    
    function checkUser() {
        if($("#user").val().length >= 5 && $("#user").val().length <= 20)
            isUserValid = true
        else {
            $("#user-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#user-msg").addClass("hidden")
            }, 4500)
        }
            
    }
   
    function checkPsw() {
        if($("#pass").val().length >= 5 && $("#pass").val().length <= 20)
            isPswValid = true
        else {
            $("#pass-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#pass-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    /* con queste funzioni non posso più inserire caratteri se arrivo al massimo */
    $("#user").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 20)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#pass").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 20)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#submit-login").click(function(e) {
        checkUser()
        checkPsw()
        
        if(!(isUserValid && isPswValid)) {
            e.preventDefault()
        }
    })
    
    
    /* validazione registrazione lato client */
    var isValidName = false
    var isValidSurname = false
    var isValidMail = false
    var isValidCity = false
    var _isValidUser = false //per registrazione
    var _isValidPsw = false // per registrazione
    
    function checkName() {
        if($("#name").val().length >= 2 && $("#name").val().length <= 20)
            isValidName = true
        else {
            $("#name-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#name-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkSurname() {
        if($("#surname").val().length >= 2 && $("#surname").val().length <= 20)
            isValidSurname = true
        else {
            $("#surname-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#surname-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkMail() {
        if($("#mail").val().length >= 10 && $("#mail").val().length <= 30)
            isValidMail = true
        else {
            $("#mail-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#mail-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkCity() {
        if($("#city").val().length >= 4 && $("#city").val().length <= 30)
            isValidCity = true
        else {
            $("#city-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#city-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function _checkUser() {
        if($("#user--not-logged").val().length >= 5 && $("#user--not-logged").val().length <= 20)
            _isValidUser = true
        else {
            $("#not-logged-user-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#not-logged-user-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function _checkPsw() {
        if($("#pass--not-logged").val().length >= 5 && $("#pass--not-logged").val().length <= 20)
            _isValidPsw = true
        else {
            $("#not-logged-pass-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#not-logged-pass-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    /* con queste funzioni non posso più inserire caratteri se arrivo al massimo */
    $("#name").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 20)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#surname").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 20)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#mail").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 30)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#city").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 30)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#user--not-logged").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 20)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#pass--not-logged").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 20)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#submit-register").click(function(e) {
        checkName()
        checkSurname()
        checkMail()
        checkCity()
        _checkUser()
        _checkPsw()
        
        if(!(isValidName && isValidSurname && isValidMail && isValidCity && _isValidUser && _isValidPsw))
            e.preventDefault()
    })
    
    /* validazione inserimento prodotto lato client */
    var isValidProdName = false
    var isValidProdDesc = false
    var isValidProdPrice = false
    var isValidProdPages = false
    var isValidProdYear = false
    var isValidProdSize = false
    
    function checkProdName() {
        if($("#prod-name").val().length >= 2 && $("#prod-name").val().length <= 40)
            isValidProdName = true
        else {
            $("#prod-name-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#prod-name-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkProdDesc() {
        if($("#prod-description").val().length >= 5 && $("#prod-description").val().length <= 50)
            isValidProdDesc = true
        else {
            $("#prod-desc-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#prod-desc-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkProdPrice() {
        if(parseInt($("#price").val()) >= 1 && parseInt($("#price").val()) <= 100)
            isValidProdPrice = true
        else {
            $("#prod-price-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#prod-price-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkProdPages() {
        if(parseInt($("#pages").val()) >= 1 && parseInt($("#pages").val()) <= 1000)
            isValidProdPages = true
        else {
            $("#prod-pages-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#prod-pages-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkProdYear() {
        var date = new Date().getFullYear();
        
        if(parseInt($("#year").val()) >= 1900 && parseInt($("#year").val()) <= date)
            isValidProdYear = true
        else {
            $("#prod-year-msg").removeClass("hidden")
            $("#prod-year-msg").text("L'anno accademico del prodotto deve essere compreso tra 1900 e " + date)
            setTimeout(function(){
                $("#prod-year-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    function checkProdSize() {
        if(parseInt($("#size").val()) >= 1 && parseInt($("#size").val()) <= 150)
            isValidProdSize = true
        else {
            $("#prod-size-msg").removeClass("hidden")
            
            setTimeout(function(){
                $("#prod-size-msg").addClass("hidden")
            }, 4500)
        }
    }
    
    $("#submit-insert-products").click(function(e) {
        checkProdName()
        checkProdDesc()
        checkProdPrice()
        checkProdPages()
        checkProdYear()
        checkProdSize()

        if(!(isValidProdName && isValidProdDesc && isValidProdPrice && isValidProdPages && isValidProdYear && isValidProdSize))
            e.preventDefault()
     })
    
    /* con queste funzioni non posso più inserire caratteri se arrivo al massimo */
    $("#prod-name").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 40)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    $("#prod-description").keydown(function(e) {
        var key = e.keyCode || e.charCode
        
        if(this.value.length >= 50)
            if(!(key === 46 || key === 8)) //backspace e delete
                e.preventDefault()
    })
    
    
    /* conteggio caratteri rimasti */
    $("#user").keyup(function() {
        var remainingChars = 20 - $(this).val().length
        
        $("#user-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#pass").keyup(function() {
        var remainingChars = 20 - $(this).val().length
        
        $("#pass-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#name").keyup(function() {
        var remainingChars = 20 - $(this).val().length
        
        $("#name-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#surname").keyup(function() {
        var remainingChars = 20 - $(this).val().length
        
        $("#surname-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#mail").keyup(function() {
        var remainingChars = 30 - $(this).val().length
        
        $("#mail-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#city").keyup(function() {
        var remainingChars = 30 - $(this).val().length
        
        $("#city-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#user--not-logged").keyup(function() {
        var remainingChars = 20 - $(this).val().length
        
        $("#user--not-logged-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#pass--not-logged").keyup(function() {
        var remainingChars = 20 - $(this).val().length
        
        $("#pass--not-logged-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#prod-name").keyup(function() {
        var remainingChars = 40 - $(this).val().length
        
        $("#prod-name-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    $("#prod-description").keyup(function() {
        var remainingChars = 50 - $(this).val().length
        
        $("#prod-desc-char").text("Caratteri a disposizione: " + remainingChars)
    })
    
    //aumento del font
    $(".default-size").click(function(){
        document.querySelector(".default-size").setAttribute("class", "size-btn default-size active-font")
        document.querySelector(".large-size").setAttribute("class", "size-btn large-size")
        document.querySelector(".x-large-size").setAttribute("class", "size-btn x-large-size")

        $("main").addClass("default")
        $("main").removeClass("large")
        $("main").removeClass("x-large")
        
    })
    
    $(".large-size").click(function(){
        document.querySelector(".large-size").setAttribute("class", "size-btn large-size active-font")
        document.querySelector(".default-size").setAttribute("class", "size-btn default-size")
        document.querySelector(".x-large-size").setAttribute("class", "size-btn x-large-size")
        
        $("main").addClass("large")
        $("main").removeClass("default")
        $("main").removeClass("x-large")
    })
    
    $(".x-large-size").click(function(){
        document.querySelector(".x-large-size").setAttribute("class", "size-btn x-large-size active-font")
        document.querySelector(".large-size").setAttribute("class", "size-btn large-size")
        document.querySelector(".default-size").setAttribute("class", "size-btn default-size")      

        $("main").addClass("x-large")
        $("main").removeClass("large")
        $("main").removeClass("default")
    })
    
    //carosello prodotti con ajax
    var offset = 0
    
    $("#prevProduct").click(function(){
        
        if(offset > 0)
            offset--
        
        $.ajax({
            url: "getProducts",
            data: {
                offsetId: offset
            },
            dataType: "json",
            
            success: function(data, state) {
                updateProduct(data);
            },
            error: function(data, state) {
               
            }
        })
    })
    
    $("#nextProduct").click(function(){
        offset++
        
        $.ajax({
            url: "getProducts",
            data: {
                offsetId: offset
            },
            dataType: "json",
            
            success: function(data, state) {
                if(data.prodName === "")
                    offset--
                else
                    updateProduct(data)
            },
            
            error: function(data, state) {
                
            }
        })
    })
    
    function updateProduct(prod) {
        $("#prodName").html(prod.prodName) 
        $("#prodDesc").html(prod.prodDesc) 
        $("#prodPrice").html(`Prezzo: ${prod.prodPrice} €`)
        $("#prodNPages").html(`Numero pagine: ${prod.prodNPages}`)
        $("#prodFormat").html(`Tipo: ${prod.prodFormat}`)
        $("#prodDim").html(`Dimensione: ${prod.prodDim} mb`)
        $("#prodYear").html(`Anno: ${prod.prodYear}`) 
        $("#prodImg").attr("src", prod.prodImg)
        $("#prodUserId").html(`Inserito da ${prod.prodUserId}`)
    }
})

