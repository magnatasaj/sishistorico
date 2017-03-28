<%-- 
    Document   : index
    Created on : 25/10/2016, 15:08:38
    Author     : Lamara
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<%@page import="com.sishistorico.objetos.TipoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!-- meta-data -->
<% DaoEleitor daoEleitor = new DaoEleitor();%>


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
                        <h2 class="box-title">Buscar Usuário</h2>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>

                    <div class="box-body">
                        <!-- Formulario inicio  -->

                        <form data-toggle="validator"   method="get" acceptcharset="UTF-8" action="buscar-historico.jsp">
                            <div class="row">
                                <!-- coluna um inicil  -->                            
                                <p style="margin-left:10px">Obs: caso sejá a data de nascimento completa, digite nesse formato: 1993-01-01 (ano-mes-dia)
</p>
                                <div class="form-group">
                                    <div class="col-md-10 input-group">
                                        <div class="input-group-addon text-bold">
                                              Digite a busca:
                                        </div>
                                        <input id="busca" name="busca" placeholder="" class="form-control small" required="" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button id="salvar" type="submit" class="btn btn-block btn-success btn-lg">Buscar</button>
                                </div>

                            </div>
                        </form>
                        <!-- fecha formulário -->
                    </div> 
                </div>
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
                        <h2> Resultado da Busca</h2>

                        <% String busca = null;
                            if (request.getParameter("busca") != null) {
                                busca = request.getParameter("busca");

                            }%>
                        <jsp:include page="in_historico.jsp">
                            <jsp:param name="busca" value="<%=busca%>" />
                            <jsp:param name="id" value="0" />
                        </jsp:include>    
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
            document.getElementById("msg").innerHTML = "Salvo com sucesso!";
            $("#alert").delay(2000).addClass("in").fadeOut(4000);

        }
    });

    $("#foto").fileinput({
        language: "pt",
        showUpload: false,
        showCaption: false,
        resizeImage: true,
        maxImageWidth: 200,
        maxImageHeight: 200,
        resizePreference: 'width',
        footer: false,
        overwriteInitial: false,
        initialPreviewAsData: true,
        initialPreviewAsData: true, // identify if you are sending preview data only and not the raw markup
                initialPreviewFileType: 'image' // image is the default and can be overridden in config below


    });

    $('#nascimento').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',
        language: 'pt-BR',
        defaultDate: new Date()

    });
    $('#ddata').datepicker("update", new Date());

</script>