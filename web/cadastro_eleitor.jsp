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
                        <h2 class="box-title">Cadastro de usuários</h2>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>

                    <div class="box-body">
                        <p>Obs: Campos com "*" são obrigatórios</p>

                        <form data-toggle="validator" enctype="multipart/form-data"  method="post" acceptcharset="UTF-8" action="SvCadastraEleitor">
                            <div class="row">
                                <!-- coluna um inicil  -->                            
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NOME COMPLETO:*
                                            </div>
                                            <input id="nome" name="nome" placeholder="" class="form-control small" required="" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                NASCIMENTO:*
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text"  class="form-control pull-right" name="nascimento" required="" id="nascimento">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CPF:
                                            </div>
                                            <input id="cpf" title="CPF" placeholder="000.000.000-00" data-mask="000.000.000-00" data-mask-selectonfocus="true" name="cpf" type="text" class="form-control input-md"  maxlength="14">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                RG:
                                            </div>
                                            <input id="rg" title="rg" placeholder="00.000.000-00" data-mask="00.000.000-00" data-mask-selectonfocus="true" name="rg" type="text" class="form-control input-md" maxlength="15">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                SUS:
                                            </div>
                                            <input id="sus" title="sus" placeholder="000 0000 0000 0000" data-mask="000 0000 0000 0000" data-mask-selectonfocus="true" name="sus" type="text" class="form-control input-md" maxlength="18">

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class=" col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                E-MAIL:
                                            </div>
                                            <input id="email" name="email" class="form-control input-md" placeholder="exemplo@email.com" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                Nº CELULAR:*
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
                                            <input  id="whats" title="whats" name="whats" type="text" class="form-control input-md"  oninvalid="setCustomValidity('Por Favor digite seu número de telefone.')"
                                                    placeholder="(00) 0 0000-0000" data-mask="(00) 0 0000-0000" data-mask-selectonfocus="true">


                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                OBSERVAÇÃO:
                                            </div>
                                            <textarea  style="min-height: 100%" id="obs" title="obs" name="obs" class="form-control input-md" wrap="100%"></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                REFERENCIA PESSOAL:
                                            </div>
                                            <input id="referencia" name="referencia" placeholder="" class="form-control pull-right"  type="text">
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
                                                        <input  id="foto" name="foto" class="file" type="file" multiple="" ></div>
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
                                            <input  id="cidade" title="cidade" name="cidade" type="text" class="form-control input-md">
                                            <div class="help-block with-errors"></div>
                                        </div></div>

                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                CEP:
                                            </div>
                                            <input  id="cep" title="Cep" name="cep" type="text" class="form-control input-md">
                                            <div class="input-group-addon">
                                                
                                                <i type="button" onclick="pesquisacep()" class="fa fa-history">
                                                 
                                                </i>
                                               
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
                                    <div class="form-group">
                                        <div class="col-md-12 input-group">
                                            <div class="input-group-addon text-bold">
                                                LOCALIDADE:
                                            </div>
                                            <select class="selectpicker" data-live-search="true" name="localidade">
                                                <option value="1">Urbana</option>
                                                <option value="2">Rural</option>

                                            </select>
                                            <div class="help-block with-errors"></div>
                                        </div></div>
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
                                        <div class="col-md-8 input-group">
                                            <div class="input-group-addon text-bold">
                                                DEPÊNDENCIA:
                                            </div>
                                            <select class="selectpicker"  data-live-search="true" name="depende">
                                                <option id="0" value="0"></option>

                                                <% String ids = "2,3";


                                                %>
                                                <%                                                    for (Eleitor t : daoEleitor.Lista_Eleitor_Por_Tipo(ids)) {
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
                        <!-- fecha formulário -->
                    </div> 
                </div>
<script type="text/javascript" >
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
           document.getElementById('rua').value="";
           document.getElementById('bairro').value="";
          document.getElementById('cidade').value="";
            //document.getElementById('uf').value=("");
            //document.getElementById('ibge').value=("");
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value=(conteudo.logradouro);
            document.getElementById('bairro').value=(conteudo.bairro);
            document.getElementById('cidade').value=(conteudo.localidade);
            //document.getElementById('uf').value=(conteudo.uf);
            //document.getElementById('ibge').value=(conteudo.ibge);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
        }
    }
        
    function pesquisacep() {

        //Nova variável "cep" somente com dígitos.
        var valor = document.getElementById("cep").value;
       

        var cep = valor;

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('rua').value = "...";
                document.getElementById('bairro').value = "...";
                document.getElementById('cidade').value = "...";
               // document.getElementById('uf').value = "...";
                //document.getElementById('ibge').value = "...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'http://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
           limpa_formulário_cep();
        }
    };

    </script>                                        
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
