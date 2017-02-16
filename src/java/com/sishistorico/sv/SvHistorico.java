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

/**
 *
 * @author lubuntu
 */
@WebServlet(name = "SvHistorico", urlPatterns = {"/SvHistorico"})
public class SvHistorico extends HttpServlet {

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
         
        response.setContentType("image/gif");
        List<FileItem> items = null;
        byte[] foto = null;
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
         DateFormat formatter;
            Date date;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            date = (Date) formatter.parse(items.get(1).getString());
            // fim do tratamento        
            Eleitor el = new Eleitor();
            Endereco end = new Endereco();
            el.setNome(items.get(0).getString("UTF-8"));
            el.setData_nascimento(date);
            el.setCpf(items.get(2).getString("UTF-8").replaceAll("\\.|\\-|\\ ", ""));
            el.setRg(items.get(3).getString("UTF-8").replaceAll("\\.|\\-|\\ ", ""));
            el.setSus(items.get(4).getString("UTF-8").replaceAll("\\.|\\-|\\ ", ""));
            el.setEmail(items.get(5).getString("UTF-8"));
            el.setTelefone(items.get(6).getString("UTF-8").replaceAll("\\(|\\)|\\-|\\ ", ""));
            el.setWhats(items.get(7).getString("UTF-8").replaceAll("\\(|\\)|\\-|\\ ", ""));
            el.setObs(items.get(8).getString("UTF-8"));
            el.setReferencia_pessoal(items.get(9).getString("UTF-8"));

            end.setRua(items.get(11).getString("UTF-8"));
            end.setBairro(items.get(12).getString("UTF-8"));
            end.setN(items.get(13).getString("UTF-8"));
            end.setCidade(items.get(14).getString("UTF-8"));
            end.setCep(items.get(15).getString("UTF-8"));
            end.setLocalidade(Integer.parseInt(items.get(16).getString("UTF-8")));
            el.setTipo(Integer.parseInt(items.get(17).getString("UTF-8")));
            el.setPertence(Integer.parseInt(items.get(18).getString("UTF-8")));

            el.setEnd(end);
            DaoEleitor daoEleitor = new DaoEleitor();
            DaoFoto daoFoto = new DaoFoto();
            int idretorno = daoEleitor.Eleitor_Salvar(el);
            daoFoto.inserirImagem(foto, idretorno);
            response.sendRedirect("cadastro_eleitor.jsp?msg='Salvo com sucesso!'");   
        } catch (FileUploadException ex) {
            Logger.getLogger(SvHistorico.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SvHistorico.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SvHistorico.class.getName()).log(Level.SEVERE, null, ex);
        }



    }

}
