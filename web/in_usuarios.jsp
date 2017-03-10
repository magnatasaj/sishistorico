
<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@page import="java.util.List"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<% request.setCharacterEncoding("UTF-8");    %>
<% String tipos = null;
    String busca = null;
    if (request.getParameter("ids") != null) {
        try {
            tipos = request.getParameter("ids");

        } catch (NumberFormatException ex) {
            out.print("ids inválido");
            return;

        }
    }
    if (request.getParameter("busca") != null) {

        busca = request.getParameter("busca");

    }


%>


<!--------- tabela ------------------------------------------------------------------------------------------------------------------->
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
    <%        DaoEleitor daoEleitor = new DaoEleitor();
        List<Eleitor> el = null;
        System.out.println("busca::::" + busca);

        if (busca.equals("null")) {
            el = daoEleitor.Lista_Eleitor_Por_Tipo(tipos);
        } else {
            el = daoEleitor.Consultar_Eleitor(busca);
        }
        DaoTipo daoTipo = new DaoTipo();
        for (Eleitor d : el) {


    %>  
    <tr>
        <td><% out.print(d.getId()); %></td>
        <!-- <td> // out.print(Data.MudarFormatoDeData(d.getData())); </td> -->
        <td><% out.print(d.getNome()); %>
        <td><% out.print(d.getObs()); %></td>
        <td><% out.print(Data.MudarFormatoDeData(d.getData_nascimento())); %></td>
        <td><% out.print(daoTipo.Obj_tipos(d.getTipo()).getNome()); %></td>
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

    $(document).ready(function () {


        $('#tbniveis').DataTable({
            "ordering": true,
            "scrollX": true,
            "order": [[0, 'desc']],
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
