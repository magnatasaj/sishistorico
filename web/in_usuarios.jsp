
<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@page import="java.util.List"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<% request.setCharacterEncoding("UTF-8");    %>
<% String tipos = null;
    String busca = "null";
    String end = "null";

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

    if (request.getParameter("end") != null) {

        end = request.getParameter("end");

    }


%>


<!--------- tabela ------------------------------------------------------------------------------------------------------------------->
<table id="tbniveis" cellspacing="0" width="99%" class="table table-bordered table-hover dataTable" role="grid" >


    <thead>
    <th class="sorting">id</th>
    <th class="sorting">Nome</th>
    <th class="sorting">Rua</th>
    <th class="sorting">Bairro</th>
    <th class="sorting">Cidade</th>
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
        if (busca.equals("null") & end.equals("null")) {
            el = daoEleitor.Lista_Eleitor_Por_Tipo(tipos);
        }
        if (!busca.equals("null")) {
            el = daoEleitor.Consultar_Eleitor(busca);

        }

        if (!end.equals("null")) {

            el = daoEleitor.Consultar_Eleitor_End(end);
        }
        DaoTipo daoTipo = new DaoTipo();
        for (Eleitor d : el) {


    %>  
    <tr>
        <td><% out.print(d.getId()); %></td>
        <!-- <td> // out.print(Data.MudarFormatoDeData(d.getData())); </td> -->
        <td><% out.print(d.getNome()); %></td>
        <td><% out.print(d.getEnd().getRua()); %></td>
        <td><% out.print(d.getEnd().getBairro()); %></td>
        <td><% out.print(d.getEnd().getCidade()); %></td>
        <td><% out.print(d.getObs()); %></td>
        <td><% out.print(Data.MudarFormatoDeData(d.getData_nascimento())); %></td>
        <td><% out.print(daoTipo.Obj_tipos(d.getTipo()).getNome()); %></td>
        <td><a href="editar_eleitor.jsp?id=<%out.print(d.getId());%>">Editar</a>-
        <a href="cadastro_historico.jsp?id=<%out.print(d.getId());%>">inserir</a>
        </td>

    </tr>


    <% };%>

</tbody>
</table>




<!-- #Fecha js-->
<script>

   

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
   
</script>
</body>
</html>
