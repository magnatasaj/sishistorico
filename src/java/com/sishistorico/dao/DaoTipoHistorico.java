/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.dao;

import com.sishistorico.objetos.TipoEleitor;
import com.sishistorico.objetos.TipoHistorico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lamara
 */
public class DaoTipoHistorico {

    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;
    private ResultSet rs = null;
    private Jdbc con = new Jdbc();
    private Connection conexao;
    private String tbp = Propriedade.getTbp();

    public DaoTipoHistorico() throws SQLException, ClassNotFoundException {
        this.conexao = con.criarconexcao();
    }
    
     public void fechar() throws SQLException{
        con.fechar();
    
    }

    public List<TipoHistorico> Lista_tipos_Historico() throws SQLException {
        String sql = "SELECT * FROM `his_tipo_historico`";
        List<TipoHistorico> lista = new ArrayList();
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            TipoHistorico tipoEleitorHistorico = new TipoHistorico();
            tipoEleitorHistorico.setId(rs.getInt(1));
            tipoEleitorHistorico.setNome(rs.getString(2));
            lista.add(tipoEleitorHistorico);
                       
        }
        
        return lista;
    }
    
     public TipoHistorico Obj_tipos_Historico(int id) throws SQLException {
        String sql = "SELECT * FROM `his_tipo_historico`WHERE `id` =?";
        
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        TipoHistorico tipoHistorico = new TipoHistorico();
        while (rs.next()) {
            
            tipoHistorico.setId(rs.getInt(1));
            tipoHistorico.setNome(rs.getString(2));
            
                       
        }
        
        return tipoHistorico;
    }

}
