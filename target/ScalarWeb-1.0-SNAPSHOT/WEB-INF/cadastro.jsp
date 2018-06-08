<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<t:layout title="Cadastro - Scalar">
 <div class="form-box">
            <h1>Cadastro</h1>
            <form name="cadastro" action="/scalar/user?action=save" method="POST">
                <ul>
                    ${message}
                    <c:remove var = "message"/>
                    <li><label>Usuário: <input type="text" name="user" size="10" /> </label></li>
                    <li><label>Senha:   <input type="password" name="pass" value=""  /></label></li>
                    <li><label>Email:   <input type="text" name="mail" value=""  /></label></li>
                    <li><label>Endereço:   <input type="text" name="adress" value=""  /></label></li>
                    <li><label><input class="send" type="submit" value="Cadatrar" /></label></li></ul>
            </form>
        </div>
</t:layout>