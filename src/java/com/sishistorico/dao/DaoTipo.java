/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.dao;

import com.sishistorico.objetos.TipoEleitor;
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
public class DaoTipo {

    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;
    private ResultSet rs = null;
    private Jdbc con = new Jdbc();
    private Connection conexao;
    private String tbp = Propriedade.getTbp();

    public DaoTipo() throws SQLException, ClassNotFoundException {
        this.conexao = con.criarconexcao();
    }
    
     public void fechar() throws SQLException{
        con.fechar();
    
    }

    public List<TipoEleitor> Lista_tipos() throws SQLException {
        String sql = "SELECT * FROM `his_tipo`";
        List<TipoEleitor> lista = new ArrayList();
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            TipoEleitor tipoEleitor = new TipoEleitor();
            tipoEleitor.setId(rs.getInt(1));
            tipoEleitor.setNome(rs.getString(2));
            lista.add(tipoEleitor);
                       
        }
        
        return lista;
    }
    
    public TipoEleitor Obj_tipos(int id) throws SQLException {
        String sql = "SELECT * FROM `his_tipo` where id = ?";
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        TipoEleitor tipoEleitor = new TipoEleitor();
        while (rs.next()) {
            
            tipoEleitor.setId(rs.getInt(1));
            tipoEleitor.setNome(rs.getString(2));
            
                       
        }
        
        return tipoEleitor;
    }

}
