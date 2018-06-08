package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Post;

/**
 *
 * @author Danillo Lima
 */
@WebServlet(urlPatterns = {"/posts"})
@MultipartConfig
public class PostController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");   
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if(request.getParameter("s") != null){
            String busca = request.getParameter("s");
            ArrayList<Post> resultado;
            resultado = Post.buscaPosts(busca);
            request.setAttribute("posts", resultado);
            request.setAttribute("termo", busca);
            request.getRequestDispatcher("WEB-INF/busca.jsp").forward(request, response);
        }
        else{
            ArrayList<Post> indexUser;
            indexUser = Post.getPosts(0, 10, request.getSession().getAttribute("idUser").toString());
            request.setAttribute("posts", indexUser);
            request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);
        }
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Part video = null, img = null;
        String title = null, content = null, msg = "", webImgPath, webVideoPath, name = "";
        File videoS, imgS, imgFolder, videoFolder;
        webImgPath = "/scalar/uploads/imagens/"; 
        webVideoPath = "/scalar/uploads/videos/";
        
        
        if(request.getParameter("action").equals("save")){            
            imgFolder = new File("C:\\Users\\Danillo Lima\\Documents\\NetBeansProjects\\scalar\\web\\uploads\\imagens");
            videoFolder  = new File("C:\\Users\\Danillo Lima\\Documents\\NetBeansProjects\\scalar\\web\\uploads\\videos");
            
            if(request.getParameter("title") != null && request.getParameter("title").equals("") == false){
                title = request.getParameter("title");
            } 
             
            if(request.getParameter("content") != null && request.getParameter("content").equals("") == false){
                content = request.getParameter("content");  
            }
            
            img = request.getPart("img");
            if(img.getSize() != 0){
                name = UUID.randomUUID().toString() + "-" + img.getSubmittedFileName();
                imgS = new File(imgFolder, name);
                try (InputStream input = img.getInputStream()) {
                   Files.copy(input, imgS.toPath());
                }
                webImgPath = webImgPath + name;
            }
            else
                webImgPath = null;
            
            video = request.getPart("video");

            if(video.getSize() != 0){
                name = UUID.randomUUID().toString() + "-" + video.getSubmittedFileName();
                videoS = new File(videoFolder, name);
                try (InputStream input = video.getInputStream()) {
                   Files.copy(input, videoS.toPath());
                }
                webVideoPath = webVideoPath + name;
            }
            else 
                webVideoPath = null;
        }
        if(webVideoPath == null && webImgPath == null && content == null && title == null){
            //request.getRequestDispatcher("WEB-INF/publicar.jsp").forward(request, response);
            response.sendRedirect("publicar");
        }
        else
            Post.savePost(new Post(title, request.getSession().getAttribute("idUser").toString(), content, webImgPath, webVideoPath ));
        processRequest(request, response);
        //request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);
        response.sendRedirect("posts");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
