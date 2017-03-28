
<%@page import="com.sishistorico.dao.DaoTipoHistorico"%>
<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="com.sishistorico.dao.DaoHistorico"%>
<%@page import="com.sishistorico.objetos.Historico"%>
<%@page import="java.util.List"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<% request.setCharacterEncoding("UTF-8");    %>
<% DaoHistorico daoHistorico = new DaoHistorico(); %>
<% DaoTipoHistorico daoTipoHistorico = new DaoTipoHistorico();%>
<%  String busca = null;
    if (request.getParameter("busca") != null) {

        busca = request.getParameter("busca");

    }
  %>

<!--------- tabela ------------------------------------------------------------------------------------------------------------------->
<h1>Históricos</h1>
<table id="tbniveis" cellspacing="0" width="99%" class="table table-bordered table-hover dataTable" role="grid" >


    <thead>
    <th class="sorting">Código</th>
    <th class="sorting">Solicitação</th>
    <th class="sorting">Data/e</th>
    <th class="sorting">Data/ag</th>
    <th class="sorting">Tipo</th>
    <th class="sorting">Situação</th>
    <th class="sorting">Acão</th>


</thead>
<tfoot>
    <tr>

    </tr>
</tfoot>
<tbody>
    <%
         List<Historico> hi = null;
        if(busca.equals("null")){
        int id = Integer.parseInt(request.getParameter("id"));
       hi = daoHistorico.Lista_Historico_Eleitor(id);
        }else{
         hi = daoHistorico.Lista_Historico_Busca(busca);    
        }

        for (Historico d : hi) {


    %>  
    <tr>
        <td><% out.print(d.getId()); %></td>
        <!-- <td> // out.print(Data.MudarFormatoDeData(d.getData())); </td> -->
        <td><%
            if(d.getSolicitacao().length()>=45){
            out.print(d.getSolicitacao().substring(0,44)+"...");
            }else{
            out.print(d.getSolicitacao());    
            }
            %>
        <td><% out.print(Data.MudarFormatoDeData(d.getData_entrada())); %></td>
        <td><% if(d.getData_agendada() == null){ out.print("sem");}else{out.print(Data.MudarFormatoDeData(d.getData_agendada()));}; %></td>
        <td><% out.print(daoTipoHistorico.Obj_tipos_Historico(d.getTipo()).getNome()); %></td>
        <td><% out.print(d.getSituacaoString()); %></td>

        <td> <a href="editar_historico.jsp?id=<%out.print(d.getId());%>">Editar</a>
            
        </td>

    </tr>


    <% };%>

</tbody>
</table>




<!-- #Fecha js-->
<script>

    $(document).ready(function () {


        $('#tbniveis').DataTable({
            "ordering": true,
            "scrollX": true,
            "order": [[2, 'desc']],
            "autoWidth": true,
            "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]],
            dom: 'l,Bfrtip',
            buttons: [
                {extend: 'copy',
                    text: 'Copiar',
                    footer: true},
                {extend: 'csv',
                    text: 'Salvar CSV',
                    footer: true},
                {extend: 'excel',
                    text: 'Salvar em Excel',
                    footer: true},
                {extend: 'pdf',
                    text: 'Salvar PDF',
                    footer: true},
                {extend: 'print',
                    text: 'Imprimir',
                    footer: true}
            ],
            "oLanguage": {
                    "sProcessing":   "Processando...",
                    "sLengthMenu":   "Mostrar _MENU_ registros",
                    "sZeroRecords":  "Não foram encontrados resultados",
                    "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix":  "",
                    "sSearch":       "Buscar:",
                    "sUrl":          "",
                    "oPaginate": {
                        "sFirst":    "Primeiro",
                        "sPrevious": "Anterior",
                        "sNext":     "Seguinte",
                        "sLast":     "Último"
                    }
                }
        });


  function adddata(v) {
            $('.form-control').val(v);
            $('.form-control').focus();

        }




    })
</script>
</body>
</html>
