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
@WebServlet(name = "SvCadastraEleitor", urlPatterns = {"/SvCadastraEleitor"})
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
        request.setCharacterEncoding("UTF8");
        response.setContentType("text/html;charset=UTF-8");

        List<FileItem> items = null;
        byte[] foto = null;
        try {
            items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
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
            //dados do formulário e metodos para salvar 
            DateFormat formatter;
            Date date;
            formatter = new SimpleDateFormat("dd/MM/yyyy");
            date = (Date) formatter.parse(items.get(1).getString());
            // fim do tratamento        
            Eleitor el = new Eleitor();
            Endereco end = new Endereco();
            el.setNome(items.get(0).getString("UTF-8").trim());
            el.setData_nascimento(date);
            el.setCpf(items.get(2).getString("UTF-8").replaceAll("\\.|\\-|\\ ", "").trim());
            el.setRg(items.get(3).getString("UTF-8").replaceAll("\\.|\\-|\\ ", "").trim());
            el.setSus(items.get(4).getString("UTF-8").replaceAll("\\.|\\-|\\ ", "").trim());
            el.setEmail(items.get(5).getString("UTF-8"));
            el.setTelefone(items.get(6).getString("UTF-8").replaceAll("\\(|\\)|\\-|\\ ", "").trim());
            el.setWhats(items.get(7).getString("UTF-8").replaceAll("\\(|\\)|\\-|\\ ", "").trim());
            el.setObs(items.get(8).getString("UTF-8").trim());
            el.setReferencia_pessoal(items.get(9).getString("UTF-8").trim());

            end.setRua(items.get(11).getString("UTF-8").trim());
            end.setBairro(items.get(12).getString("UTF-8").trim());
            end.setN(items.get(13).getString("UTF-8").trim());
            end.setCidade(items.get(14).getString("UTF-8").trim());
            end.setCep(items.get(15).getString("UTF-8").trim());
            end.setLocalidade(Integer.parseInt(items.get(16).getString("UTF-8").trim()));
            el.setTipo(Integer.parseInt(items.get(17).getString("UTF-8").trim()));
            el.setPertence(Integer.parseInt(items.get(18).getString("UTF-8").trim()));

            el.setEnd(end);
            DaoEleitor daoEleitor = new DaoEleitor();
            DaoFoto daoFoto = new DaoFoto();
            int idretorno = daoEleitor.Eleitor_Salvar(el);
            daoFoto.inserirImagem(foto, idretorno);
            response.sendRedirect("cadastro_eleitor.jsp?msgok");

        } catch (FileUploadException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SvCadastraEleitor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
