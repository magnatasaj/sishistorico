
<%@page import="java.util.List"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<% request.setCharacterEncoding("UTF-8");    %>


<!--------- tabela ------------------------------------------------------------------------------------------------------------------->
<h1> Últimos cadastros</h1>
<table id="tbniveis" cellspacing="0" width="99%" class="table table-bordered table-hover dataTable" role="grid" >


    <thead>
    <th class="sorting">id</th>
    <th class="sorting">Nome</th>
    <th class="sorting">Obs</th>
    <th class="sorting">Data/Na</th>
    <th class="sorting">Tipo</th>
    <th class="sorting">Ação</th>

</thead>
<tfoot>
    <tr>

    </tr>
</tfoot>
<tbody>
    <% String tipos = "1,2,3";
        List<Eleitor> el = daoEleitor.Lista_Eleitor_Por_Tipo(tipos);
        
        for (Eleitor d : el) {
            

    %>  
    <tr>
        <td><% out.print(d.getId()); %></td>
       <!-- <td> // out.print(Data.MudarFormatoDeData(d.getData())); </td> -->
        <td><% out.print(d.getNome()); %>
        <td><% out.print(d.getObs()); %></td>
        <td><% out.print(d.getData_nascimento()); %></td>
        <td><% out.print(d.getTipo()); %></td>
        <td><a id="ed" onclick="setfoto()">Editar</a>-
            <a on>excluir</a>-
            <a href="cadastro_historico.jsp?id=<%out.print(d.getId());%>">inserir</a>
        </td>

    </tr>


    <% };%>

</tbody>
</table>




<!-- #Fecha js-->
<script>

    $(document).ready(function() {


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
            ]
        })







        function adddata(v) {
            $('.form-control').val(v);
            $('.form-control').focus();

        }
    })
</script>
</body>
</html>
