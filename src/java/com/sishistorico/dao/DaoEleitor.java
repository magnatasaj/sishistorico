/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.dao;

import com.sishistorico.objetos.Eleitor;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lubuntu
 */
public class DaoEleitor {

    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;
    private ResultSet rs = null;
    private Jdbc con = new Jdbc();
    private final Connection conexao;

    public DaoEleitor() throws SQLException, ClassNotFoundException {
        this.conexao = con.criarconexcao();
    }

    public void fechar() throws SQLException {
        con.fechar();

    }

    public int Eleitor_Salvar(Eleitor el) throws SQLException, ClassNotFoundException {

        String sql = "INSERT INTO `sishistorico`.`his_eleitor` (`id`, `nome`, `cpf`, `rg`, `email`, `telefone`, `whats`, `tipo`, `sus`, `obs`, `referencia`, `pertence`, `nascimento`) VALUES "
                + "                                            (NULL, ?,?,?,?,?,?,?,?,?,?,?,?);";
        ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, el.getNome());
        ps.setString(2, el.getCpf());
        ps.setString(3, el.getRg());
        ps.setString(4, el.getEmail());
        ps.setString(5, el.getTelefone());
        ps.setString(6, el.getWhats());
        ps.setInt(7, el.getTipo());
        ps.setString(8, el.getSus());
        ps.setString(9, el.getObs());
        ps.setString(10, el.getReferencia_pessoal());
        ps.setInt(11, el.getPertence());
        ps.setDate(12, new java.sql.Date(el.getData_nascimento().getTime()));

        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        int id = 0;
        while (rs.next()) {
            id = rs.getInt(1);

        }
        if (id != 0) {
            DaoEndereco end = new DaoEndereco();
            el.setId(id);
            end.Endereco_Salvar(el);
        }
        ps.close();
        return id;

    }
    
     public List<Eleitor> Lista_Eleitor_Por_Tipo(String ids) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM `his_eleitor` WHERE `tipo` in ("+ids+")";
        ps = conexao.prepareStatement(sql);
        //ps.setString(1, "1,2");
        rs = ps.executeQuery();
        List<Eleitor> l = new ArrayList();
         while (rs.next()) {
             Eleitor eleitor = new Eleitor();
             eleitor.setId(rs.getInt("id"));
             eleitor.setNome(rs.getString("nome"));
             eleitor.setObs(rs.getString("obs"));
             eleitor.setTipo(rs.getInt("tipo"));
             eleitor.setData_nascimento(rs.getDate("nascimento"));
             l.add(eleitor);
             
         }
        
        return l;

    }
    
    public List<Eleitor> Lista_Eleitor_Por_Dependencia(String ids) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM `his_eleitor` WHERE `pertence` ="+ids+"";
        ps = conexao.prepareStatement(sql);
        //ps.setString(1, "1,2");
        rs = ps.executeQuery();
        List<Eleitor> l = new ArrayList();
         while (rs.next()) {
             Eleitor eleitor = new Eleitor();
             eleitor.setId(rs.getInt("id"));
             eleitor.setNome(rs.getString("nome"));
             eleitor.setObs(rs.getString("obs"));
             eleitor.setTipo(rs.getInt("tipo"));
             eleitor.setData_nascimento(rs.getDate("nascimento"));
             l.add(eleitor);
             
         }
        
        return l;

    } 
     
    public Eleitor Obj_Eleitor(int id) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM `his_eleitor` WHERE `id` = ?";
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        Eleitor eleitor = new Eleitor();
         while (rs.next()) {
             
             eleitor.setId(rs.getInt("id"));
             eleitor.setNome(rs.getString("nome"));
             eleitor.setObs(rs.getString("obs"));
             eleitor.setData_nascimento(rs.getDate("nascimento"));
             
             
         }
        
        return eleitor;

    } 

    public Eleitor Obj_Aluno(String id) throws SQLException {

        String sql = "SELECT * FROM `alunos` WHERE `id` = '" + id + "'";
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        Eleitor el = new Eleitor();
        while (rs.next()) {
            el.setId(rs.getInt("id"));
            el.setNome(rs.getString("nome"));
            el.setEmail(rs.getString("email"));
            el.setCpf(rs.getString("cpf"));
            el.setTelefone(rs.getString("telefone"));
            el.setWhats(rs.getString("whats"));
            el.setTipo(rs.getInt("tipo"));
            el.setPertence(rs.getInt("pertence"));
            el.setSus(rs.getString("sus"));
            el.setObs(rs.getString("obs"));
            el.setReferencia_pessoal(rs.getString("referencia"));
            el.setPertence(rs.getInt("pertence"));
        }

        ps.close();
        return el;
    }

    public Eleitor Obj_Aluno_consulta(String email, String cpf) throws SQLException {

        String sql = "SELECT * FROM `alunos` WHERE `email` = '" + email + "' and cpf = " + cpf + "";
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        Eleitor el = new Eleitor();
        while (rs.next()) {
            el.setId(rs.getInt("id"));
            el.setNome(rs.getString("nome"));
            el.setEmail(rs.getString("email"));
            el.setCpf(rs.getString("cpf"));
            el.setTelefone(rs.getString("telefone"));
            el.setWhats(rs.getString("whats"));
            el.setTipo(rs.getInt("tipo"));
            el.setPertence(rs.getInt("pertence"));
            el.setSus(rs.getString("sus"));
            el.setObs(rs.getString("obs"));
            el.setReferencia_pessoal(rs.getString("referencia"));
            el.setPertence(rs.getInt("pertence"));
        }

        ps.close();
        return el;
    }
}
