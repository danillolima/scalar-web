<%-- 
    Document   : login
    Created on : 15/05/2018, 16:54:37
    Author     : Aluno
--%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<t:layout title="Login - Scalar">
        <div class="form-box">
            <h1/>Login</h1>
            <form name="login" action="/ScalarWeb/user?action=verify" method="POST">
                <ul>
                    <li><label>Usuário: <input type="text" name="user" size="10" /> </label></li>
                    <li><label>Senha:   <input type="password" name="pass" value=""  /></label></li>
                    <li><label><input class="send" type="submit" value="Deixe-me entrar!" /></label></li></ul>
            </form>
        </div>
</t:layout>
