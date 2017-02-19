/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sishistorico.funcao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author sis
 */
public class CaucularDias {
    
    private static DateFormat df = new SimpleDateFormat ("dd/MM/yyyy");
    
    public static long calcular (Date d1, Date d2) throws ParseException {
      int MILLIS_IN_DAY = 86400000;
     
                Calendar c2 = Calendar.getInstance();
		c2.setTime(d2);
		c2.set(Calendar.MILLISECOND, 0);
		c2.set(Calendar.SECOND, 0);
		c2.set(Calendar.MINUTE, 0);
		c2.set(Calendar.HOUR_OF_DAY, 0);
                
		Calendar c1 = Calendar.getInstance();
		c1.setTime(d1);
                if(c1.get(Calendar.MONTH) >= c2.get(Calendar.MONTH)){
                c1.set(Calendar.YEAR,c2.getWeekYear());
                }else{
                c1.set(Calendar.YEAR,c2.getWeekYear()+1);    
                }
		c1.set(Calendar.MILLISECOND, 0);
		c1.set(Calendar.SECOND, 0);
		c1.set(Calendar.MINUTE, 0);
		c1.set(Calendar.HOUR_OF_DAY, 0);
		
		return (int) ((c1.getTimeInMillis() - c2.getTimeInMillis()) / MILLIS_IN_DAY);
    }
    public static int calculaIdade(java.util.Date dataNasc) {

    Calendar dataNascimento = Calendar.getInstance();  
    dataNascimento.setTime(dataNasc); 
    Calendar hoje = Calendar.getInstance();  

    int idade = hoje.get(Calendar.YEAR) - dataNascimento.get(Calendar.YEAR); 

    if (hoje.get(Calendar.MONTH) < dataNascimento.get(Calendar.MONTH)) {
      idade--;  
    } 
    else 
    { 
        if (hoje.get(Calendar.MONTH) == dataNascimento.get(Calendar.MONTH) && hoje.get(Calendar.DAY_OF_MONTH) < dataNascimento.get(Calendar.DAY_OF_MONTH)) {
            idade--; 
        }
    }

    return idade;
}
   


    
}
