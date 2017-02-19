/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.objetos;

import java.util.Date;

/**
 *
 * @author Administrador
 */
public class Historico {
    
    private int id;
    private Date data_entrada;
    private int tipo;
    private Date data_agendada;
    private String solicitacao;
    private int id_eleitor;
    private int situacao;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the data_entrada
     */
    public Date getData_entrada() {
        return data_entrada;
    }

    /**
     * @param data_entrada the data_entrada to set
     */
    public void setData_entrada(Date data_entrada) {
        this.data_entrada = data_entrada;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the data_agendada
     */
    public Date getData_agendada() {
        return data_agendada;
    }

    /**
     * @param data_agendada the data_agendada to set
     */
    public void setData_agendada(Date data_agendada) {
        this.data_agendada = data_agendada;
    }

    /**
     * @return the solicitacao
     */
    public String getSolicitacao() {
        return solicitacao;
    }

    /**
     * @param solicitacao the solicitacao to set
     */
    public void setSolicitacao(String solicitacao) {
        this.solicitacao = solicitacao;
    }

    /**
     * @return the id_eleitor
     */
    public int getId_eleitor() {
        return id_eleitor;
    }

    /**
     * @param id_eleitor the id_eleitor to set
     */
    public void setId_eleitor(int id_eleitor) {
        this.id_eleitor = id_eleitor;
    }

    /**
     * @return the situacao
     */
    public int getSituacao() {
        return situacao;
    }
    
    public String getSituacaoString() {
        if(situacao == 1){
            return "Ativa";
        }else if(situacao == 2){
        return "Finalizado";
        }
        return "Indefinido";
    }

    /**
     * @param situacao the situacao to set
     */
    public void setSituacao(int situacao) {
        this.situacao = situacao;
    }
}
