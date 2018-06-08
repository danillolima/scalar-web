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
    <title>${title}</title>
</head>
<body>
    <header>
        <div class="logo"> <a href="/scalar"><img src="/scalar/img/logo.png"/></a></div>
 <form method="get" action="/scalar/posts">
                <input type="text" name="s" />
                <input value="Buscar" type="submit" />
        </form>
        <nav>
            <a href="/scalar">INICIO</a>
            <a href="/scalar/publicar">PUBLICAR</a>
            <%  
                HttpServletRequest r = (HttpServletRequest)request;
                HttpSession sessionUser = r.getSession();
                if(sessionUser.getAttribute("logado") != null){
                    out.print(" <a href=\"/scalar/posts\">MEU PERFIL</a> ");
                    out.print(" <a href=\"/scalar/user?action=logout\">SAIR</a> ");
                }
                else{
                    out.print(" <a href=\"/scalar/login\">ENTRAR</a> ");
                    out.print(" <a href=\"/scalar/cadastro\">CADASTRAR</a>");
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