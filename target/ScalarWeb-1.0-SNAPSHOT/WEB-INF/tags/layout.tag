<%@ tag body-content="scriptless" %>
<%@ attribute name="title" required="true" type="java.lang.String" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/scalar/css/site.css">
    <link rel="icon" href="/scalar/img/icon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/scalar/js/site.js"></script>
</head>
<body>
    <header>
        <div class="logo"> <a href="/"><img src="/img/logo.png"/></a></div>
 <form method="get" action="/posts">
                <input type="text" name="s" />
                <input value="Buscar" type="submit" />
        </form>
        <nav>
            <a href="/">INICIO</a>
            <a href="/publicar">PUBLICAR</a>
            <%  
                HttpServletRequest r = (HttpServletRequest)request;
                HttpSession sessionUser = r.getSession();
                if(sessionUser.getAttribute("logado") != null){
                    out.print(" <a href=\"/posts\">MEU PERFIL</a> ");
                    out.print(" <a href=\"/user?action=logout\">SAIR</a> ");
                }
                else{
                    out.print(" <a href=\"/login\">ENTRAR</a> ");
                    out.print(" <a href=\"/cadastro\">CADASTRAR</a>");
                }
            %>
             
            
        </nav>
       
        <div>
            <label class="botao"></label>
        </div>      
    </header>
    <div class="container">
        <jsp:doBody/>
    </div>
</body>
</html>