<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<t:layout title="Login - Scalar">
        <div class="form-box">
            <div id="response"></div>
            <h1/>Login</h1>
            <form id="login-form" name="login" action="" method="POST">
                <ul>
                    <li><label>Usuário: <input id="username" type="text" name="user" size="10" /> </label></li>
                    <li><label>Senha:   <input id="password" type="password" name="pass" value=""  /></label></li>
                    <li><label><input class="send" type="submit" value="Deixe-me entrar!" /></label></li></ul>
            </form>
        </div>
</t:layout>