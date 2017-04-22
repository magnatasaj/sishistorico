<%-- 
    Document   : index
    Created on : 25/10/2016, 15:08:38
    Author     : Lamara
--%>

<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="com.sishistorico.objetos.Historico"%>
<%@page import="com.sishistorico.dao.DaoHistorico"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipoHistorico"%>
<%@page import="com.sishistorico.objetos.TipoHistorico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.objetos.TipoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!-- meta-data -->
<% DaoTipoHistorico daoTipoHistorico = new DaoTipoHistorico();%>
<% DaoEleitor daoEleitor = new DaoEleitor(); %>
<% DaoHistorico daoHistorico = new DaoHistorico();
    Historico hi = new Historico();
    Eleitor el = new Eleitor();
    if (request.getParameter("id") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            hi = daoHistorico.Obj_Historico(id);
            el = daoEleitor.Obj_Eleitor(hi.getId_eleitor());

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
                        <h3 class="box-title">Cadastro Histórico</h3>

                    </div>

                    <div class="box-body">
                         
                       
                        <!-- Formulario inicio  -->
                        <form data-toggle="validator" enctype="multipart/form-data"  method="post" acceptcharset="UTF-8" action="SvHistoricoEditar">
                            <div class="row">
                                <!-- coluna um inicil  -->                            
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CÓDIGO:
                                            </div>
                                            <input type="text" class="form-control pull-right bg-aqua"  readonly="true" hide name="id" id="id"  value="<% out.print(el.getId()); %>" >

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NOME COMPLETO:
                                            </div>
                                            <input type="text"  readonly="true"  class="form-control pull-right bg-aqua" name="nome"  value=" <% out.print(el.getNome()); %>" id="nome">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Data de Entrada:
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input value="<% out.print(Data.MudarFormatoDeData(hi.getData_entrada())); %>" type="text"  class="form-control pull-right" name="data_entrada" id="data_entrada">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                TIPO de Histórico:
                                            </div>
                                            <select class="selectpicker" data-live-search="true" name="tipo">
                                                <%
                                                    for (TipoHistorico t : daoTipoHistorico.Lista_tipos_Historico()) {
                                                %>
                                                <option id="<% out.print(t.getId());%>" value="<% out.print(t.getId());%>" <% if(hi.getTipo() == t.getId()){out.print("selected");} %>><% out.print(t.getNome());%></option>
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
                                            <input value="<%if(hi.getData_agendada() !=null){ out.print(Data.MudarFormatoDeData(hi.getData_agendada()));} %>" type="text"  class="form-control pull-right" name="agendado" id="agendado">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Solicitação:
                                            </div>
                                            <textarea  style="min-height: 100%" id="sol" title="sol" name="sol" class="form-control input-md" wrap="100%"><% out.print(hi.getSolicitacao()); %></textarea>
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
                                        <select class="selectpicker" data-live-search="true" name="st">

                                            <option id="1" value="1" <% if(hi.getSituacao() == 1){out.print("selected");}%>>Ativo</option>
                                            <option id="2" value="2" <% if(hi.getSituacao() == 2){out.print("selected");}%>>Finalizado</option>


                                        </select>
                                        <div class="help-block with-errors"></div>
                                                                            <input name="hid" id="hid" value="<% out.print(hi.getId()); %>" hidden="true" >

                                    </div></div>        
                            </div>
                    </div>

                   <div class="row" id="botoes">
                                <div class="col-md-4">
                                    <button id="salvar" type="submit" class="btn btn-block btn-success btn-lg">Alterar</button>
                                </div>
                                <div class="col-md-4">
                                    <button onclick="limpar2()" id="limpar" type="button" class="btn btn-block btn-primary btn-lg disabled">Limpar</button>
                                </div>
                                 <div class="col-md-4">
                                    <button  id="excluir" type="button" class="btn btn-block btn-danger btn-lg">Excluir</button>
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
                    <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">Hisóricos</a></li>
              <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="true">Dependentes</a></li>
              <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                  <% int id = el.getId();%>
                    <jsp:include page="in_historico.jsp" >
                        <jsp:param name="id" value="<%=id%>" />
                         <jsp:param name="busca" value="null" />

                    </jsp:include>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane active " id="tab_2">
                 <jsp:include page="in_usuarios_dependecias.jsp" >
                        <jsp:param name="id" value="<%=id%>" />

                    </jsp:include>
              </div>
              
            </div>
            <!-- /.tab-content -->
          </div>
                 
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
            document.getElementById("msg").innerHTML = "<% out.print(request.getParameter("msgok"));%>";
            $("#alert").delay(2000).addClass("in").fadeOut(4000);

        }
    });
    
 $('#excluir').click(function(event) {
                var id = <% out.print(hi.getId()); %>;
                
                $.post('SvExcluirHistorico', {
                    id: id
                    
                }, function(responseText) {

                   document.getElementById("msg").innerHTML = "Excluido com sucesso!";
            $("#alert").delay(2000).addClass("in").fadeOut(4000);
            document.getElementById("botoes").innerHTML = "     Esse histórico não existe mais!";


                })
         });


    $('#sol').wysihtml5();
$('#data_entrada,#agendado').datepicker({
                autoclose: true,
                format: 'dd/mm/yyyy',
                language: 'pt-BR',
               // defaultDate: new Date()

            });
           // $('#data_entrada').datepicker("update", "<% hi.getData_entrada(); %>");
</script>
