/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.sv;

import com.sishistorico.dao.DaoEleitor;
import com.sishistorico.dao.DaoHistorico;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lubuntu
 */
@WebServlet(name = "SvExcluirHistorico", urlPatterns = {"/SvExcluirHistorico"})
public class SvExcluirHistorico extends HttpServlet {

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
        
        
        try {
           DaoHistorico daoHistorico = new DaoHistorico();
             daoHistorico.Historico_Excluir(id);
             System.out.println("idddd:::"+id);
            
            response.getOutputStream().print("Deletado com Sucesso!");

        } catch (SQLException ex) {
            Logger.getLogger(SvExcluirHistorico.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvExcluirHistorico.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       

    }

}
