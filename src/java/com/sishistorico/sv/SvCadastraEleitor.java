/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.sv;

import com.sishistorico.dao.DaoEleitor;
import com.sishistorico.dao.DaoFoto;
import com.sishistorico.dao.Propriedade;
import com.sishistorico.funcao.Imagem;
import com.sishistorico.objetos.Eleitor;
import com.sishistorico.objetos.Endereco;
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
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author lubuntu
 */
@WebServlet(name = "SvCadastrarEleitor", urlPatterns = {"/SvCadastrarEleitor"})
public class SvCadastraEleitor extends HttpServlet {

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
        response.setContentType("image/gif");
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        List<FileItem> items = null;
        byte[] foto = null;
        InputStream filecontent;
        try {
            items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {

                } else {
                    InputStream imageInput = item.getInputStream();
                    Image image = ImageIO.read(imageInput);
                    BufferedImage thumb = Imagem.redimensionar(image, 400, 500);
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(thumb, "JPG", baos);
                    	baos.flush();
                        foto = baos.toByteArray();
                        baos.close();
                }
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        }

//tratar data de nascimento
        try {
            DateFormat formatter;
            Date date;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            System.out.println("@@@@@@@@@@@@data" + items.get(1).getString());
            date = (Date) formatter.parse(items.get(1).getString());

            // fim do tratamento        
            Eleitor el = new Eleitor();
            Endereco end = new Endereco();
            el.setNome(items.get(0).getString());
            el.setData_nascimento(date);
            el.setCpf(items.get(2).getString().replaceAll("\\.|\\-|\\ ", ""));
            el.setRg(items.get(3).getString().replaceAll("\\.|\\-|\\ ", ""));
            el.setSus(items.get(4).getString().replaceAll("\\.|\\-|\\ ", ""));
            el.setEmail(items.get(5).getString());
            el.setTelefone(items.get(6).getString().replaceAll("\\(|\\)|\\-|\\ ", ""));
            el.setWhats(items.get(7).getString().replaceAll("\\(|\\)|\\-|\\ ", ""));
            el.setObs(items.get(8).getString());
            el.setReferencia_pessoal(items.get(9).getString());

            end.setRua(items.get(11).getString());
            end.setBairro(items.get(12).getString());
            end.setN(items.get(13).getString());
            end.setCidade(items.get(14).getString());
            end.setCep(items.get(15).getString());
            end.setLocalidade(Integer.parseInt(items.get(16).getString()));
            el.setTipo(Integer.parseInt(items.get(17).getString()));
            el.setPertence(Integer.parseInt(items.get(18).getString()));

            el.setEnd(end);
            DaoEleitor daoEleitor = new DaoEleitor();
            DaoFoto daoFoto = new DaoFoto();
            int idretorno = daoEleitor.Eleitor_Salvar(el);
            daoFoto.inserirImagem(foto, idretorno);
            response.sendRedirect("cadastro_eleitor.jsp?msg='Salvo com sucesso!'");

        } catch (SQLException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
