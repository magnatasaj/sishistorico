/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.dao;

import com.sishistorico.objetos.Eleitor;
import com.sishistorico.objetos.Historico;
import com.sishistorico.objetos.TipoHistorico;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lubuntu
 */
public class DaoHistorico {

    private PreparedStatement ps = null;
    private PreparedStatement ps2 = null;
    private ResultSet rs = null;
    private Jdbc con = new Jdbc();
    private final Connection conexao;

    public DaoHistorico() throws SQLException, ClassNotFoundException {
        this.conexao = con.criarconexcao();
    }

    public void fechar() throws SQLException {
        con.fechar();

    }

    public void historico_Salvar(Historico hi) throws SQLException, ClassNotFoundException {

        String sql = "INSERT INTO `sishistorico`.`his_historico` (`id`, `data_entrada`, `data_agendada`, `tipo`, `situacao`, `solicitacao`, `id_eleitor`) "
                + "                                       VALUES (NULL, ?, ?, ?, ?, ?, ?);";
        ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setDate(1, new java.sql.Date(hi.getData_entrada().getTime()));
        if (hi.getData_agendada() != null) {
            ps.setDate(2, new java.sql.Date(hi.getData_agendada().getTime()));
        } else {
            ps.setNull(2, Types.DATE);
        }
        ps.setInt(3, hi.getTipo());
        ps.setInt(4, hi.getSituacao());
        ps.setString(5, hi.getSolicitacao());
        ps.setInt(6, hi.getId_eleitor());

        ps.execute();

    }

    public void Historico_Excluir(int id) throws SQLException, ClassNotFoundException {

        String sql = "DELETE FROM `his_historico` WHERE `his_historico`.`id` = ?";
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        ps.execute();

    }

    public void historico_editar(Historico hi) throws SQLException, ClassNotFoundException {

        String sql = "UPDATE `his_historico` SET `data_entrada` = ?, `data_agendada` = ?, `tipo` = ?, `solicitacao` = ?, `situacao` = ? WHERE `his_historico`.`id` = ?";

        ps = conexao.prepareStatement(sql);
        ps.setDate(1, new java.sql.Date(hi.getData_entrada().getTime()));
        if (hi.getData_agendada() != null) {
            ps.setDate(2, new java.sql.Date(hi.getData_agendada().getTime()));
        } else {
            ps.setNull(2, Types.DATE);
        }
        ps.setInt(3, hi.getTipo());
        ps.setString(4, hi.getSolicitacao());
        ps.setInt(5,hi.getSituacao());
        ps.setInt(6, hi.getId());
  
        ps.execute();

    }

    public List<Historico> Lista_Historico_Eleitor(int id) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM `his_historico` WHERE `id_eleitor` = ?";
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        List<Historico> h = new ArrayList();
        while (rs.next()) {
            Historico hi = new Historico();
            hi.setId(rs.getInt("id"));
            hi.setId_eleitor(rs.getInt("id_eleitor"));
            hi.setData_entrada(rs.getDate("data_entrada"));
            hi.setData_agendada(rs.getDate("data_agendada"));
            hi.setSituacao(rs.getInt("situacao"));
            hi.setSolicitacao(rs.getString("solicitacao"));
            hi.setTipo(rs.getInt("tipo"));
            h.add(hi);

        }

        return h;

    }

    public List<Historico> Lista_Historico_Busca(String busca) throws SQLException, ClassNotFoundException {

        String sql = "SELECT *  FROM `his_historico` WHERE `data_entrada` LIKE '%" + busca + "%' or `data_agendada` LIKE '%" + busca + "%' or solicitacao LIKE '%" + busca + "%' ";
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        List<Historico> h = new ArrayList();
        while (rs.next()) {
            Historico hi = new Historico();
            hi.setId(rs.getInt("id"));
            hi.setId_eleitor(rs.getInt("id_eleitor"));
            hi.setData_entrada(rs.getDate("data_entrada"));
            hi.setData_agendada(rs.getDate("data_agendada"));
            hi.setSituacao(rs.getInt("situacao"));
            hi.setSolicitacao(rs.getString("solicitacao"));
            hi.setTipo(rs.getInt("tipo"));
            h.add(hi);

        }

        return h;

    }

    public List<Historico> Lista_Historico_agendado() throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM `his_historico` WHERE `situacao` = 1 ORDER BY `his_historico`.`data_agendada` ASC";
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        List<Historico> h = new ArrayList();
        while (rs.next()) {
            Historico hi = new Historico();
            hi.setId(rs.getInt("id"));
            hi.setId_eleitor(rs.getInt("id_eleitor"));
            hi.setData_entrada(rs.getDate("data_entrada"));
            hi.setData_agendada(rs.getDate("data_agendada"));
            hi.setSituacao(rs.getInt("situacao"));
            hi.setSolicitacao(rs.getString("solicitacao"));
            hi.setTipo(rs.getInt("tipo"));
            h.add(hi);

        }

        return h;

    }

    public Historico Obj_Historico(int id) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM `his_historico` WHERE id = ?";
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        Historico hi = new Historico();
        while (rs.next()) {

            hi.setId(rs.getInt("id"));
            hi.setId_eleitor(rs.getInt("id_eleitor"));
            hi.setData_entrada(rs.getDate("data_entrada"));
            hi.setData_agendada(rs.getDate("data_agendada"));
            hi.setSituacao(rs.getInt("situacao"));
            hi.setSolicitacao(rs.getString("solicitacao"));
            hi.setTipo(rs.getInt("tipo"));

        }

        return hi;

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
    
 //****************************** Gráficos Dão ))))))))))))))))))000
    public String Historico_Mensal(int situacao, String ano) throws SQLException, ClassNotFoundException {
          
        String dataset = "";

        String resultado = "";
        switch (situacao) {
            case 1:
                resultado = "Solicitado";
                break;
            case 2:
                resultado = "Atendido";
                break;

        }

        if (!Consultar_solicitacoes(situacao, ano).equals(",,,,,,,,,,")) {

            dataset += "{\n"
                    + "                        name: \"" + resultado + "\",\n"
                    + "                                 data :[" + Consultar_solicitacoes(situacao, ano)+"]"
                    + "                        }";

        }

        return dataset;
    }
    
    public String Consultar_solicitacoes(int situacao, String ano) throws SQLException {
        BigDecimal total = new BigDecimal("0");
        BigDecimal re = new BigDecimal("0");
        String res = "";
        
        for (int i = 1; i <= 12; i++) {
            String sql ="";
            if(situacao == 1){
            sql = "SELECT COUNT(id) as total FROM `his_historico` WHERE MONTH(data_entrada) = MONTH('" + ano + "-" + i + "-00') AND YEAR(data_entrada) = YEAR('" + ano + "-" + i + "-00')";
            }else{
            sql = "SELECT COUNT(id) as total FROM `his_historico` WHERE MONTH(data_entrada) = MONTH('" + ano + "-" + i + "-00') AND YEAR(data_entrada) = YEAR('" + ano + "-" + i + "-00') AND situacao ="+situacao+" ";
            }
            ps = conexao.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                if (rs.getString("total") != null) {
                    String valor = rs.getBigDecimal("total").toString();
                    re = total.add(new BigDecimal(valor));
                    if (i == 12) {
                        res += re;
                    } else {
                        res += re + ",";
                    }

                }else {
                        if (i == 12) {
                            res += "null";
                        } else {
                            res += "null,";
                        }
                    }
                }

            }
        
        rs.close();

        return res;
    }
//fecha gráfico um

//abre gráfico 2    
public String Historico_Mensal_por_area(String ano) throws SQLException, ClassNotFoundException {
          
        String dataset = "";
        DaoTipoHistorico tipohisotico = new DaoTipoHistorico();
        List<TipoHistorico> lista = tipohisotico.Lista_tipos_Historico() ;
        for (TipoHistorico dd : lista) {
        
        if (!Consultar_solicitacoes_area(dd.getId(),ano).equals(",,,,,,,,,,")) {

            dataset += "{\n"
                    + "                        name: \"" +dd.getNome() + "\",\n"
                    + "                                 data :[" + Consultar_solicitacoes_area(dd.getId(),ano)+"]"
                    + "                        },";

        }
        }
        String datasetcorrigido = dataset.substring(0, dataset.length() - 1);
        return datasetcorrigido;
    }
    
    public String Consultar_solicitacoes_area(int tipo,String ano) throws SQLException {
        BigDecimal total = new BigDecimal("0");
        BigDecimal re = new BigDecimal("0");
        String res = "";
        
        for (int i = 1; i <= 12; i++) {
            String sql ="";
            sql = "SELECT COUNT(id) as total FROM `his_historico` WHERE MONTH(data_entrada) = MONTH('" + ano + "-" + i + "-00') AND YEAR(data_entrada) = YEAR('" + ano + "-" + i + "-00') AND `tipo` = "+tipo+"";
           
            ps = conexao.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                if (rs.getString("total") != null) {
                    String valor = rs.getBigDecimal("total").toString();
                    re = total.add(new BigDecimal(valor));
                    if (i == 12) {
                        res += re;
                    } else {
                        res += re + ",";
                    }

                }else {
                        if (i == 12) {
                            res += "null";
                        } else {
                            res += "null,";
                        }
                    }
                }

            }
        
        rs.close();

        return res;
    }    
    
}
