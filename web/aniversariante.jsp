<%@page import="com.sishistorico.dao.DaoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipoHistorico"%>
<%@page import="com.sishistorico.objetos.TipoHistorico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.objetos.TipoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!-- meta-data -->



<!DOCTYPE html>
<html>
    <%@include file="partes/meta-data.jsp" %>

    <!-- #Meta-data ------------------------------------------------------------------------------------------------->
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="pull-right-container fixed" style=" z-index: 500; margin-left: 70%; margin-top: 2%; max-width: 30%">
                            <div id="alert" class="alert alert-success fade">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Sucesso!</strong>
                                <div id="msg">
                                </div>    
                            </div>
                        </div> 
        <div class="wrapper">
            <!-- Menu-Topo -->   
            <%@include file="partes/menu-topo.jsp" %>    

            <!-- #fecha MEnu-top ------------------------------------------------------------------------------------------->
            <!-- Menu-lateral -->
            <%@include file="/partes/menu-lateral.jsp" %> 
            <!--#FEcha  Menu-lateral -->

            <!-- Conteúdo ------------------------------------------------------------------------------------------------->
              
            <div class="content-wrapper">
            <div class="box">
                <div class="box-header">
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                            <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <%@include file="/partes/javascript.jsp" %> 

                <div class="box-body">
                    <%@include file="in_usuarios_aniversario.jsp" %>
                        

                    
                </div>
            </div>                               
        </div>
        <!-- #Fecha Conteúdo -->

        <!-- Abrir Rodapé -------------------------------------------------------------------------------------------->  
        <%@include file="/partes/rodape.jsp" %> 
        <!-- #Fecha rodapé -->

    </div>
    <!-- js -->

    <!-- #Fecha js-->
</body>
</html>

<script>

    $(document).ready(function () {
        var url = location.href;
        if (url.indexOf("msgok") == -1) {

        } else {
            document.getElementById("msg").innerHTML = "O hitórico foi salvo!"; 
            $("#alert").delay(2000).addClass("in").fadeOut(4000);

        }
    });
    

    $('#sol').wysihtml5();

</script>