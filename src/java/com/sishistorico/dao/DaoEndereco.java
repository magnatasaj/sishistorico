/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.dao;


import com.sishistorico.objetos.Eleitor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author lubuntu
 */
public class DaoEndereco {

    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;
    private ResultSet rs = null;
    private Jdbc con = new Jdbc();
    private final Connection conexao;

    public DaoEndereco() throws SQLException, ClassNotFoundException {
        this.conexao = con.criarconexcao();
    }

    public void fechar() throws SQLException {
        con.fechar();

    }

   

    public void Endereco_Salvar(Eleitor el) throws SQLException {

        String sql = "INSERT INTO `his_endereco` (`id`, `rua`, `bairro`, `N`, `cidade`, `cep`, `id_user`,`localidade`)"
                + "   VALUES (NULL, '" + el.getEnd().getRua() + "', '" + el.getEnd().getBairro() + "', '" + el.getEnd().getN() + "', '" + el.getEnd().getCidade() + "', '" + el.getEnd().getCep() + "', '" + el.getId() + "', '" + el.getEnd().getLocalidade() + "')";
        ps = conexao.prepareStatement(sql);
        ps.execute();
        ps.close();
    }

    
}