
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@page import="com.sishistorico.funcao.Data"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.sishistorico.funcao.CaucularDias"%>
<%@page import="java.util.List"%>
<%@page import="com.sishistorico.objetos.Eleitor"%>
<%@page import="com.sishistorico.dao.DaoEleitor"%>
<% request.setCharacterEncoding("UTF-8");    %>
<%DaoEleitor daoEleitor = new DaoEleitor(); %>
<% Date data = new Date(System.currentTimeMillis());
%>

<!--------- tabela ------------------------------------------------------------------------------------------------------------------->
<h1>Reltório de aniversariantes</h1>
<table id="tbniveis" cellspacing="0" width="99%" class="table table-bordered table-hover dataTable" role="grid" >


    <thead>
    <th class="sorting">id</th>
    <th class="sorting">Nome</th>
    <th class="sorting">Vai Fazer</th>
    <th class="sorting">Falta/Dias</th>
    <th class="sorting">Data/Nascimento</th>
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
        <td><% out.print(CaucularDias.calculaIdade(d.getData_nascimento())+1); %> anos</td>

        <td><% 
            long falta = CaucularDias.calcular(d.getData_nascimento(), data);
            if(falta == 0){
            out.print("É hoje");
            }else{
            out.print(falta+" dia(s)");    
            }%> 
            </td>
        
        <td><% out.print(Data.MudarFormatoDeData(d.getData_nascimento())); %></td>
        <td><% out.print(daoTipo.Obj_tipos(d.getTipo()).getNome()); %></td>
        <td><a id="ed">Editar</a>-
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
            "order": [[3, 'desc']],
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
