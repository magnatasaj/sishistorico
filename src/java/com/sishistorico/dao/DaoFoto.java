/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lamara
 */
public class DaoFoto {

    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;
    private ResultSet rs = null;
    private Jdbc con = new Jdbc();
    private Connection conexao;
    private String tbp = Propriedade.getTbp();

    public DaoFoto() throws SQLException, ClassNotFoundException {
        this.conexao = con.criarconexcao();
    }

    public void fechar() throws SQLException {
        con.fechar();

    }

    public void inserirImagem(byte[] fileitem, int iduser) throws Exception {
        String SQL = "insert into imagem(imagem,id_user) values(?,?)";
        //String ex = FilenameUtils.getExtension(fileitem.getName());

        

        //System.out.println("Extenção@@@@@@@@@2" + ex);
        ps = conexao.prepareStatement(SQL);
        System.out.println("bay"+ fileitem.length);
        ps.setBytes(1, fileitem);
        //ps.setBinaryStream(1, fileitem.getInputStream(), (int) fileitem.getSize());
        ps.setInt(2, iduser);
        
        ps.execute();
    }
    
    public void atualizarImagem(byte[] fileitem, int iduser) throws Exception {
        String SQL = "UPDATE `imagem` SET `imagem` = ?  WHERE `imagem`.`id_user` = ?;";
        //String ex = FilenameUtils.getExtension(fileitem.getName());

        

        //System.out.println("Extenção@@@@@@@@@2" + ex);
        ps = conexao.prepareStatement(SQL);
        System.out.println("bay"+ fileitem.length);
        ps.setBytes(1, fileitem);
        //ps.setBinaryStream(1, fileitem.getInputStream(), (int) fileitem.getSize());
        ps.setInt(2, iduser);
        
        ps.execute();
    }
    
    public void ExcluirImagem(int iduser) throws Exception {
        String SQL = "DELETE FROM `imagem` WHERE `imagem`.`id_user` = ?";
          

        ps = conexao.prepareStatement(SQL);
        ps.setInt(1, iduser);
        ps.execute();
    }

    public Blob recuperaImagem(int iduser) throws Exception {
        String SQL = "SELECT * FROM `imagem` WHERE `id_user` = ?";
        ps = conexao.prepareStatement(SQL);
        ps.setInt(1, iduser);

        Blob imagem = null;
        try {
            ResultSet resultado = ps.executeQuery();
            if (resultado.next()) {
                imagem = resultado.getBlob("imagem");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return imagem;
    }

}
