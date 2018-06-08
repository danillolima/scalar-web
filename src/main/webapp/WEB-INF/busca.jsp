<%@page import="model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Post> posts = (ArrayList<Post>)request.getAttribute("posts"); %>
<c:set var="postsContent"> 
<% 
    for(Post post : posts ){ 
        out.print("<div class=\"post\">");
        if(post.getTitle()!= null)
        out.print("<h2>" + post.getTitle() + "</h2>");
        if(post.getContent()!= null)
        out.print("<p>" + post.getContent() + "</p>");
        if(post.getVideo() != null)
            out.print("<video controls src=\"" + post.getVideo() + "\"/></video>");
        if(post.getImg() != null)
            out.print("<img src=\"" + post.getImg() + "\"/>");
        out.print("</div>");
    } 
%>  
</c:set>
<t:layout title="Resultado da busca \"${termo}\" ">
    ${postsContent}
</t:layout>