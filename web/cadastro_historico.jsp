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
<% DaoTipo daoTipo = new DaoTipo();%>
<% DaoEleitor daoEleitor = new DaoEleitor();
    Eleitor el = new Eleitor();
    if (request.getParameter("id") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            el = daoEleitor.Obj_Eleitor(id);
        } catch (NumberFormatException ex) {
            out.print("id inválido");
            return;

        }
    }
%>


<!DOCTYPE html>
<html>
    <%@include file="partes/meta-data.jsp" %>    
    <!-- #Meta-data ------------------------------------------------------------------------------------------------->
    <body class="hold-transition skin-blue sidebar-mini">
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
                        <h3 class="box-title">Cadastro Histórico</h3>

                    </div>

                    <div class="box-body">
                        <!-- Formulario inicio  -->

                        <form data-toggle="validator" enctype="multipart/form-data"  method="post" acceptcharset="UTF-8" action="SvCadastrarEleitor">
                            <div class="row">
                                <!-- coluna um inicil  -->                            
                                <div class="col-md-8"> 
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NOME COMPLETO:
                                            </div>
                                            <input type="text"  readonly="true"  class="form-control pull-right bg-aqua" name="nascimento"  value=" <% out.print(el.getNome()); %>" id="nascimento">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Data de Entrada:
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text"  class="form-control pull-right" name="nascimento" id="nascimento">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                TIPO:
                                            </div>
                                            <select class="selectpicker" data-live-search="true" name="tipo">
                                                <%
                                                    for (TipoEleitor t : daoTipo.Lista_tipos()) {
                                                %>
                                                <option id="<% out.print(t.getId());%>" value="<% out.print(t.getId());%>"><% out.print(t.getNome());%></option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">

                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Data de agendada:
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text"  class="form-control pull-right" name="nascimento" id="nascimento">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Solicitação:
                                            </div>
                                            <textarea  style="min-height: 100%" id="sol" title="sol" name="sol" class="form-control input-md" wrap="100%">
                                            </textarea>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                </div>
                                <div class="col-md-4">
                                    <div style="width: 70%"class="alert alert-info alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h4><i class="icon fa fa-info"></i>Foto</h4>
                                        <img style="" heigth="80%" width="70%" src="SvImagem?id=<% out.print(el.getId());%>"

                                    </div>
                                </div>
                                <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Situação:
                                            </div>
                                            <select class="selectpicker" data-live-search="true" name="tipo">
                                               
                                                <option id="1" value="1">Ativo</option>
                                                <option id="2" value="2">Finalizado</option>
                                               

                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>        
                            </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <button id="salvar" type="submit" class="btn btn-block btn-success btn-lg">Salvar</button>
                        </div>
                        <div class="col-md-6">
                            <button onclick="limpar2()" id="limpar" type="button" class="btn btn-block btn-primary btn-lg disabled">Limpar</button>
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
        initialPreviewAsData: true


    });
    $('#sol').wysihtml5();

</script>