/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.objetos;

/**
 *
 * @author sis
 */
public class Eleitor extends Pessoa{
    private int tipo;
    private String sus;
    private String obs;
    private String referencia_pessoal;
    private int pertence;

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
     * @return the sus
     */
    public String getSus() {
        return sus;
    }

    /**
     * @param sus the sus to set
     */
    public void setSus(String sus) {
        this.sus = sus;
    }

    /**
     * @return the obs
     */
    public String getObs() {
        return obs;
    }

    /**
     * @param obs the obs to set
     */
    public void setObs(String obs) {
        this.obs = obs;
    }

    /**
     * @return the referencia_pessoal
     */
    public String getReferencia_pessoal() {
        return referencia_pessoal;
    }

    /**
     * @param referencia_pessoal the referencia_pessoal to set
     */
    public void setReferencia_pessoal(String referencia_pessoal) {
        this.referencia_pessoal = referencia_pessoal;
    }

    /**
     * @return the pertence
     */
    public int  getPertence() {
        return pertence;
    }

    /**
     * @param pertence the pertence to set
     */
    public void setPertence(int pertence) {
        this.pertence = pertence;
    }
    
}
