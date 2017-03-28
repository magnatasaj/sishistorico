/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.sv;

import com.sishistorico.dao.DaoEleitor;
import com.sishistorico.dao.DaoFoto;
import com.sishistorico.funcao.Imagem;
import com.sishistorico.objetos.Eleitor;
import com.sishistorico.objetos.Endereco;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author lubuntu
 */
@WebServlet(name = "SvExcluirEleitor", urlPatterns = {"/SvExcluirEleitor"})
public class SvExcluirEleitor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        
        DaoEleitor daoEleitor;
        DaoFoto foto;
        try {
            daoEleitor = new DaoEleitor();
            foto =  new DaoFoto();
             daoEleitor.Eleitor_Excluir(id);
            foto.ExcluirImagem(id);
            response.getOutputStream().print("Deletado com Sucesso!");

        } catch (SQLException ex) {
            Logger.getLogger(SvExcluirEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvExcluirEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SvExcluirEleitor.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       

    }

}
