/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.sv;

import com.sishistorico.dao.DaoDespesa;
import com.sishistorico.dao.DaoDespesaNivel;
import com.sishistorico.dao.DaoFoto;
import com.sishistorico.dao.DaoReceita;
import com.sishistorico.objetos.Despesa;
import com.sishistorico.objetos.Despesa_Niveis;
import com.sishistorico.objetos.Receita;
import com.sishistorico.objetos.ReceitaOrigem;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * NumberFormat nf = NumberFormat.getCurrencyInstance(); String formatado =
 * nf.format (valor); System.out.println(formatado);
 *
 * @author Lamara
 */
@WebServlet(name = "SvImagem", urlPatterns = {"/SvImagem"})
public class SvImagem extends HttpServlet {

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DaoFoto daoFoto = new DaoFoto();
                Blob photo = null;
                photo = daoFoto.recuperaImagem(Integer.parseInt(request.getParameter("id")));
    ServletOutputStream out = response.getOutputStream();
      response.setContentType("image/gif");
      int length = (int) photo.length();

      InputStream in = photo.getBinaryStream();

      int bufferSize = 1024;
      byte[] buffer = new byte[bufferSize];

      while ((length = in.read(buffer)) != -1) {
        System.out.println("writing " + length + " bytes");
        out.write(buffer, 0, length);
      }

      in.close();
      out.flush();
        } catch (SQLException ex) {
            Logger.getLogger(SvImagem.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvImagem.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SvImagem.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
