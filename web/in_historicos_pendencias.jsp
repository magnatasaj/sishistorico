
<%@page import="com.sishistorico.dao.DaoTipoHistorico"%>
<%@page import="com.sishistorico.objetos.Historico"%>
<%@page import="com.sishistorico.dao.DaoHistorico"%>
<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.sishistorico.funcao.CaucularDias"%>
<%@page import="java.util.List"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<% request.setCharacterEncoding("UTF-8");    %>
<%DaoHistorico daoHistorico = new DaoHistorico(); %>
<%DaoTipoHistorico daoTipoHistorico = new DaoTipoHistorico(); %>
<% Date data = new Date(System.currentTimeMillis());%>


<!--------- tabela ------------------------------------------------------------------------------------------------------------------->

<table id="tbniveis1" cellspacing="0" class="table table-bordered table-hover dataTable"  >


    <thead>
    <th class="sorting">id</th>
    <th class="sorting">solicitação</th>
    <th class="sorting">Falta</th>
    <th class="sorting">Data Agendada</th>
    <th class="sorting">Data Entrada</th>
    <th class="sorting">Tipo</th>
    <th class="sorting">Ação</th>

</thead>
<tbody>
    <%
        List<Historico> h = daoHistorico.Lista_Historico_agendado();

        for (Historico d : h) {
            if(d.getData_agendada() != null){
    %>  
    <tr>
        <td><% out.print(d.getId()); %></td>
        <td><% out.print(d.getSolicitacao()); %></td>
        <td><% 
            
            long falta = CaucularDias.calcular(d.getData_agendada(), data);
            if(falta == 0){
            out.print("É hoje");
            }else{
            out.print(falta+" dia(s)");    
            }%> 
            </td>
        
            <td><% out.print(Data.MudarFormatoDeData(d.getData_agendada())); %></td>
                        <td><% out.print(Data.MudarFormatoDeData(d.getData_entrada())); %></td>

                        <td><% out.print(daoTipoHistorico.Obj_tipos_Historico(d.getTipo()).getNome()); %></td>
        <td><a id="ed" href="editar_historico.jsp?id=<%out.print(d.getId());%>">Editar</a>
            
        </td>

    </tr>
    <% }else{%>
     <tr>
        <td><% out.print(d.getId()); %></td>
        <td><% out.print(d.getSolicitacao()); %></td>
        <td>sem</td>
        
            <td>sem</td>
                        <td><% out.print(Data.MudarFormatoDeData(d.getData_entrada())); %></td>

                        <td><% out.print(daoTipoHistorico.Obj_tipos_Historico(d.getTipo()).getNome()); %></td>
        <td><a id="ed" href="editar_historico.jsp?id=<%out.print(d.getId());%>">Editar</a>
            
        </td>

    </tr>

<%}};%>

</tbody>
</table>




<!-- #Fecha js-->
<script>

    $(document).ready(function () {


        $('#tbniveis1').DataTable({
            "ordering": true,
            "scrollX": true,
            "order": [[3, 'asc']],
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
        })







        function adddata(v) {
            $('.form-control').val(v);
            $('.form-control').focus();

        }
    })
</script>
</body>
</html>
