$(function() {
    $('form#login-form').on("submit", function (ev) {     
        ev.preventDefault();
        var username = $("#username").val();
        var password = $("#password").val(); 

        var msg = "";
        $("#response").html(msg);
           
        if( username !== "" && password !== "" ){
            $.ajax({
            url: '/scalar/user?action=verify',
            type: 'POST',
            data: {user: username, pass: password},
            success: 
            function(response){
                var r = jQuery.parseJSON(response);
                    if(r.login === "authorized"){ 
                        window.location.href = "/scalar/posts";
                    }
                    else{
                        msg = r.message;
                        $("#response").html(msg);
                }
                }
            });
        }
        else{
            $("#response").html("Preencha todos os campos!");
        }
        return false;
    }); 
    
    
    
    
});
