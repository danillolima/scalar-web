<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout title="Publicar post">
 <div class="form-box">
            <h1>Publicar</h1>
            <form name="cadastro" action="posts?action=save" method="POST" enctype="multipart/form-data">
                <ul>
                    ${sessionScope.message}      
                    <li><label>Titulo(Opcional): <input type="text" name="title" size="10" /> </label></li>
                    <li><label>Conteudo:   <textarea name="content" value=""></textarea></label></li>
                    <li><label>Imagem(opcional): <input type="file" name="img" size="10" /></li>
                    <li><label>Vídeo(opcional): <input type="file" name="video" size="10" /></li>
                    <li><label><input class="send" type="submit" value="Publicar" /></label></li></ul>
            </form></div>
</t:layout>