/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.sv;

import com.sishistorico.dao.DaoEleitor;
import com.sishistorico.dao.DaoFoto;
import com.sishistorico.dao.DaoHistorico;
import com.sishistorico.dao.Propriedade;
import com.sishistorico.funcao.Imagem;
import com.sishistorico.objetos.Eleitor;
import com.sishistorico.objetos.Endereco;
import com.sishistorico.objetos.Historico;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
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
@WebServlet(name = "SvHistoricoEditar", urlPatterns = {"/SvHistoricoEditar"})
public class SvHistoricoEditar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");

        List<FileItem> items = null;
        try {
            items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

            DateFormat formatter;
            Date data_entrada;
            Date data_agendada = null;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            data_entrada = (Date) formatter.parse(items.get(2).getString());
            if (!items.get(4).getString().equals("")) {
                data_agendada = (Date) formatter.parse(items.get(4).getString());
            }

            // fim do tratamento        
            Historico hi = new Historico();
            hi.setId_eleitor(Integer.parseInt(items.get(0).getString().trim()));
            hi.setData_entrada(data_entrada);
            hi.setTipo(Integer.parseInt(items.get(3).getString().trim()));
            hi.setData_agendada(data_agendada);
            hi.setSituacao(Integer.parseInt(items.get(7).getString().trim()));
            hi.setSolicitacao(items.get(5).getString("UTF-8").trim());
            hi.setId(Integer.parseInt(items.get(8).getString("UTF-8").trim()));

            DaoHistorico daoHistorico = new DaoHistorico();
            daoHistorico.historico_editar(hi);
            response.sendRedirect("editar_historico.jsp?id=" + hi.getId() + "&msgok=Editado com sucesso!");
        } catch (FileUploadException ex) {
            Logger.getLogger(SvHistoricoEditar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SvHistoricoEditar.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
