<%-- 
    Document   : index
    Created on : 25/10/2016, 15:08:38
    Author     : Lamara
--%>

<%@page import="java.sql.Blob"%>
<%@page import="com.sishistorico.dao.DaoFoto"%>
<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<%@page import="com.sishistorico.objetos.TipoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!-- meta-data -->
<% DaoEleitor daoEleitor = new DaoEleitor();
   DaoFoto daoFoto = new DaoFoto();
   
    Eleitor el = new Eleitor();
    Blob ff = null;
    if (request.getParameter("id") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            el = daoEleitor.Obj_Eleitor(id);
           ff = daoFoto.recuperaImagem(el.getId());
           System.out.println("ff:::::::::::::::"+ff.length());
           

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
                        <h2 class="box-title">Editar usuários</h2>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>

                    <div class="box-body">
                        <p>Obs: Campos com "*" são obrigatórios</p>

                        <form data-toggle="validator" enctype="multipart/form-data"  method="post" acceptcharset="UTF-8" action="SvEditarEleitor">
                            <div class="row">
                                <!-- coluna um inicil  -->                            
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NOME COMPLETO:*
                                            </div>
                                            <input value="<% out.print(el.getNome()); %>" id="nome" name="nome" placeholder="" class="form-control small" required="" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NASCIMENTO:*
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input value="<% out.print(Data.MudarFormatoDeData(el.getData_nascimento())); %>" type="text" v class="form-control pull-right" name="nascimento" required="" id="nascimento">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CPF:
                                            </div>
                                            <input value="<% out.print(el.getCpf()); %>" id="cpf" title="CPF" placeholder="000.000.000-00" data-mask="000.000.000-00" data-mask-selectonfocus="true" name="cpf" type="text" class="form-control input-md"  maxlength="14">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                RG:
                                            </div>
                                            <input value="<% out.print(el.getRg()); %>" id="rg" title="rg" placeholder="00.000.000-00" data-mask="00.000.000-00" data-mask-selectonfocus="true" name="rg" type="text" class="form-control input-md" maxlength="14">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                SUS:
                                            </div>
                                            <input value="<% out.print(el.getSus()); %>" id="sus" title="sus" placeholder="000 0000 0000 0000" data-mask="000 0000 0000 0000" data-mask-selectonfocus="true" name="sus" type="text" class="form-control input-md" maxlength="18">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class=" col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                E-MAIL:
                                            </div>
                                            <input value="<% out.print(el.getEmail()); %>" id="email" name="email" class="form-control input-md" placeholder="exemplo@email.com" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Nº CELULAR:*
                                            </div>
                                            <input value="<% out.print(el.getTelefone()); %>" id="celular" title="Celular" name="celular" type="text" class="form-control input-md" required="" oninvalid="setCustomValidity('Por Favor digite seu número de telefone.')" onchange="try {
                                                        setCustomValidity('')
                                                    } catch (e) {
                                                    }"  placeholder="(00) 0 0000-0000" data-mask="(00) 0 0000-0000" data-mask-selectonfocus="true">


                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                WHATS:
                                            </div>
                                            <input value="<% out.print(el.getWhats()); %>" id="whats" title="whats" name="whats" type="text" class="form-control input-md"  oninvalid="setCustomValidity('Por Favor digite seu número de telefone.')"
                                                   placeholder="(00) 0 0000-0000" data-mask="(00) 0 0000-0000" data-mask-selectonfocus="true">


                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                OBSERVAÇÃO:
                                            </div>
                                            <textarea  style="min-height: 100%" id="obs" title="obs" name="obs" class="form-control input-md" wrap="100%"><% out.print(el.getObs()); %></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                REFERENCIA PESSOAL:
                                            </div>
                                            <input value="<% out.print(el.getReferencia_pessoal()); %>" id="referencia" name="referencia" placeholder="" class="form-control pull-right"  type="text">
                                        </div>
                                    </div>
                                </div>
                                <!-- coluna um finla  -->       

                                <!-- coluna 2 inicio  -->     
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                FOTO:
                                            </div>
                                            <div id="comf" <% if(ff.length() == 0){out.print("style='display: none'");}else{out.print("style='width: 50%'");} %> class="alert alert-info alert-dismissible">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                <h4><i class="icon fa fa-info"></i>Foto</h4>
                                                <img style="" heigth="80%" width="70%" src="SvImagem?id=<% out.print(el.getId());%>"
                                                      </div>
                                                      <p><a onclick="removerfoto()">Remover foto</a></p>
                                            </div>
                                                <div id="semf" <% if(ff.length() == 0){out.print(""); }%>  class="file-input file-input-new"><div class="file-preview">
                                                    <div class="kv-upload-progress hide"><div class="progress">
                                                            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="50" >
                                                            </div>
                                                        </div></div>
                                                    <div tabindex="200" class="btn btn-primary btn-file">
                                                        <input   id="foto" filename="SvImagem?id=<% out.print(el.getId());%>" name="foto" class="file" type="file" multiple="" ></div>
                                                </div></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                RUA:
                                            </div>
                                            <input value="<% out.print(el.getEnd().getRua()); %>" id="rua" title="rua" name="rua" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                BAIRRO:
                                            </div>
                                            <input value="<% out.print(el.getEnd().getBairro()); %>" id="bairro" title="Bairro" name="bairro" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Nº:
                                            </div>
                                            <input value="<% out.print(el.getEnd().getN()); %>" id="n" title="Número" name="n" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CIDADE:
                                            </div>
                                            <input value="<% out.print(el.getEnd().getCidade()); %>" id="rua" title="cidade" name="cidade" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CEP:
                                            </div>
                                            <input value="<% out.print(el.getEnd().getCep()); %>" id="cep" title="Cep" name="cep" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                LOCALIDADE:
                                            </div>
                                            <select value="<% out.print(el.getEnd().getLocalidade()); %>" class="selectpicker" data-live-search="true" name="localidade">
                                                <option value="1" <% if (el.getEnd().getLocalidade() == 1) {
                                                        out.print("selected");
                                                    } %>>Urbana</option>
                                                <option value="2" <% if (el.getEnd().getLocalidade() == 2) {
                                                        out.print("selected");
                                                    } %>>Rural</option>

                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                TIPO:
                                            </div>
                                            <select value="<% out.print(el.getTipo()); %>" class="selectpicker" data-live-search="true" name="tipo">
                                                <%
                                                    for (TipoEleitor t : daoTipo.Lista_tipos()) {
                                                %>
                                                <option id="<% out.print(t.getId());%>" value="<% out.print(t.getId());%>" <% if (el.getTipo() == t.getId()) {
                                                        out.print("selected");
                                                    } %> ><% out.print(t.getNome());%></option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-8 input-group">
                                            <div class="input-group-addon text-bold">
                                                DEPÊNDENCIA:
                                            </div>
                                            <select value="<% out.print(el.getPertence()); %>" class="selectpicker"  data-live-search="true" name="depende">
                                                <option id="0" value="0"></option>

                                                <% String ids = "2,3";


                                                %>
                                                <%                                                    for (Eleitor t : daoEleitor.Lista_Eleitor_Por_Tipo(ids)) {
                                                %>
                                                <option id="<% out.print(t.getId());%>" value="<% out.print(t.getId());%>" <% if (el.getPertence() == t.getId()) {
                                                        out.print("selected");
                                                    } %>><% out.print(t.getNome());%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <input name="id" id="id" value="<% out.print(el.getId()); %>" hidden="true" >

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
                        <h2> Últimos cadastros</h2>

                        <jsp:include page="in_usuarios.jsp">
                            <jsp:param name="ids" value="1,2,3" />
                            <jsp:param name="busca" value="" />

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
            document.getElementById("msg").innerHTML = "<% out.print(request.getParameter("msgok"));%>";
            $("#alert").delay(2000).addClass("in").fadeOut(4000);
        }
    });

        
         $('#excluir').click(function(event) {
                var id = $('#id').val();
                
                $.post('SvExcluirEleitor', {
                    id: id
                    
                }, function(responseText) {

                   document.getElementById("msg").innerHTML = "Excluido com sucesso!";
            $("#alert").delay(2000).addClass("in").fadeOut(4000);
            document.getElementById("botoes").innerHTML = "   Esse usuário não existe mais!";


                })
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
        overwriteInitial: true,
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
