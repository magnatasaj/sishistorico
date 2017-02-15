<%-- 
    Document   : index
    Created on : 25/10/2016, 15:08:38
    Author     : Lamara
--%>

<%@page import="java.sql.Array"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<%@page import="com.sishistorico.objetos.TipoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- meta-data -->
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
                        <h3 class="box-title">Cadastro de usuários</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>

                    <div class="box-body">
                        <!-- Formulario inicio  -->

                        <form data-toggle="validator" enctype="multipart/form-data"  method="post"  action="SvCadastrarEleitor">
                            <div class="row">
                                <!-- coluna um inicil  -->                            
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold font-light">
                                                NOME COMPLETO:
                                            </div>
                                            <input id="nome" name="nome" placeholder="" class="form-control small" required="" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NASCIMENTO
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text"  class="form-control pull-right" name="nascimento" id="nascimento">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CPF:
                                            </div>
                                            <input id="cpf" title="CPF" placeholder="000.000.000-00" name="cpf" type="text" class="form-control input-md" required=""  maxlength="14">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                RG:
                                            </div>
                                            <input id="rg" title="rg" placeholder="000.000.000-00" name="rg" type="text" class="form-control input-md" required="" maxlength="14">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                SUS:
                                            </div>
                                            <input id="sus" title="sus" placeholder="000.000.000-00" name="sus" type="text" class="form-control input-md" required="" maxlength="14">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class=" col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                E-MAIL:
                                            </div>
                                            <input id="email" name="email" class="form-control input-md" required="" placeholder="exemplo@email.com" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Nº CELULAR:
                                            </div>
                                            <input  id="celular" title="Celular" name="celular" type="text" class="form-control input-md" required="" oninvalid="setCustomValidity('Por Favor digite seu número de telefone.')" onchange="try {
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
                                            <input  id="whats" title="whats" name="whats" type="text" class="form-control input-md" required="" oninvalid="setCustomValidity('Por Favor digite seu número de telefone.')" onchange="try {
                                                        setCustomValidity('')
                                                    } catch (e) {
                                                    }"  placeholder="(00) 0 0000-0000" data-mask="(00) 0 0000-0000" data-mask-selectonfocus="true">


                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                OBSERVAÇÃO:
                                            </div>
                                            <textarea  style="min-height: 100%" id="obs" title="obs" name="obs" class="form-control input-md" wrap="100%">
                                            </textarea>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                REFERENCIA PESSOAL:
                                            </div>
                                            <input id="referencia" name="referencia" placeholder="" class="form-control pull-right" required="" type="text">
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
                                            <div class="file-input file-input-new"><div class="file-preview">
                                                    <div class="kv-upload-progress hide"><div class="progress">
                                                            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="50" >
                                                            </div>
                                                        </div></div>
                                                    <div tabindex="200" class="btn btn-primary btn-file">
                                                        <input id="foto" name="foto" class="file" type="file" multiple="" data-min-file-count="1"></div>
                                                </div></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                RUA:
                                            </div>
                                            <input  id="rua" title="rua" name="rua" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                BAIRRO:
                                            </div>
                                            <input  id="bairro" title="Bairro" name="bairro" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Nº:
                                            </div>
                                            <input  id="n" title="Número" name="n" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CIDADE:
                                            </div>
                                            <input  id="rua" title="cidade" name="cidade" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CEP:
                                            </div>
                                            <input  id="cep" title="Cep" name="cep" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                LOCALIDADE:
                                            </div>
                                            <select class="selectpicker" data-live-search="true" name="localidade">
                                                <option value="1">Urbana</option>
                                                <option value="2">Rual</option>

                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                TIPO:
                                            </div>
                                            <select class="selectpicker" data-live-search="true" name="tipo">
                                                <% DaoTipo daoTipo = new DaoTipo(); %>
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
                                        <div class="col-md-8 input-group">
                                            <div class="input-group-addon text-bold">
                                                DEPÊNDENCIA:
                                            </div>
                                            <select class="selectpicker"  data-live-search="true" name="depende">
                                                <% DaoEleitor daoEleitor = new DaoEleitor();
                                             String [] ids = { "1", "2"};
                                                
                                                %>
                                                <%
                                                    for (Eleitor t : daoEleitor.Lista_Eleitor_Por_Tipo(ids)) {
                                                %>
                                                <option id="<% out.print(t.getId());%>" value="<% out.print(t.getId());%>"><% out.print(t.getNome());%></option>
                                                <%
                                                 }
                                                %>
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
                        <img src="SvImagem?id=10" />
                        <!-- fecha formulário -->
                    </div> 
                </div>
            </div>
            <!-- #Fecha Conteúdo -->

            <!-- Abrir Rodapé -------------------------------------------------------------------------------------------->  
            <%@include file="/partes/rodape.jsp" %> 
            <!-- #Fecha rodapé -->

        </div>
        <!-- js -->
        <%@include file="/partes/javascript.jsp" %> 

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
</script>