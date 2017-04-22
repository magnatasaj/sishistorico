

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
     <%@include file="/partes/javascript.jsp" %> 
     <div class="alert alert-warning alert-dismissible" st>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-warning"></i> Vencimento está próximo!</h4>
                O próximo vencimento da 2º parcela é no dia 10/04/2017!
                Caso tenha quitado, disconsidere.
              </div>
     
    <div class="box">
                    <div class="box-header">
                        <h2>Reltório agendamentos</h2>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>
     <div class="box-body" style="background-color: #FFF">
                    <%@include file="in_historicos_pendencias.jsp" %>
             
                </div>
     </div>
  <div class="box">
                    <div class="box-header">
                        <h2>Reltório de aniversariantes</h2>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>
     <div class="box-body" style="background-color: #FFF">
                    <%@include file="in_usuarios_aniversario.jsp" %>
             
                </div>
     </div>   
  </div>
<!-- #Fecha Conteúdo -->

<!-- Abrir Rodapé -------------------------------------------------------------------------------------------->  
<div class="clearfix"></div>
<%@include file="/partes/rodape.jsp" %> 
<!-- #Fecha rodapé -->
  
</div>

<!-- js -->

<!-- #Fecha js-->
</body>
</html>

<%@include file="/partes/javascript.jsp" %> 
