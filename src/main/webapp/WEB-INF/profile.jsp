<%@page import="model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<t:layout title="${sessionScope.user} profile">
   
 <div class="profile">

    <h1> ${sessionScope.user} </h1>
    ${postsContent}
    </div>
</t:layout>

