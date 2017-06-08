
<%@page import="com.sishistorico.objetos.TipoEleitor"%>
<%@page import="com.sishistorico.dao.DaoTipo"%>
<%@page import="java.util.Properties"%>
<%@page import="com.sishistorico.dao.Propriedade"%>
<%@page import="com.sishistorico.objetos.User"%>
<% DaoTipo daoTipo = new DaoTipo();%>

<aside class="main-sidebar" >
    <!-- sidebar: style can be found in sidebar.less -->
    <section id="menu" style="margin-top: 15px" >  <!--class="sidebar affix"> -->

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image" style="min-height: 40px">
                <img src="/<%out.print(Propriedade.getApp()); %>/dist/img/<%out.print(Propriedade.getApp()); %>.png" class="img-thumbnail" alt="User Image">
            </div>
            <div class="pull-left info" style="color: #FFF">
                <p>APP: <%out.print(Propriedade.getNome()); %></p>

                <p>Olá, <% User al = new User();
                    al = (User) session.getAttribute("nome");
                    out.print(al.getNome()); %></p>
            </div>

        </div>

        <input type="text" id="tbusca" name="q" class="form-control" placeholder="Buscar...">


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul id="treeview-menu" class="sidebar-menu">
            <li class="header">MENU DE NAVEGAÇÃO</li>
            <li class="active treeview " >
                <a style="border-left-color: #f00" href="#">
                    <i class="fa fa-arrow-circle-down" style="color: #f00"></i> <span>Home</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                
                <ul id="treeview-menu" class="treeview-menu">
                    
                    <li><a href="home.jsp"><i class="fa fa-angle-right"></i>Home</a></li>
                    <li><a href="home.jsp"><i class="fa fa-angle-right"></i>Gráficos</a></li>


                </ul>
            </li>
            <li class="active treeview " >
                <a style="border-left-color: #f00" href="#">
                    <i class="fa fa-arrow-circle-down" style="color: #f00"></i> <span>Usuários</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                
                <ul id="treeview-menu" class="treeview-menu">
                    
                    <li><a href="cadastro_eleitor.jsp"><i class="fa fa-angle-right"></i>Cadastro de usuário</a></li>
                    <li><a href="buscar-eleitor.jsp"><i class="fa fa-angle-right"></i>Buscar usuários</a></li>
                    <li><a href="buscar-eleitor_endereco.jsp"><i class="fa fa-angle-right"></i>Buscar por Endereço</a></li>


                </ul>
            </li>
            <li class="active treeview">
                <a style="border-left-color: green" href="#">
                    <i class="fa fa-arrow-circle-up" style="color: green"></i>
                    <span>Históricos</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul id="treeview-menu" class="treeview-menu">

                    <li><a href="usuario_selecionar.jsp"><i class="fa fa-angle-right"></i>Cadastrar histórico</a></li>
                    <li><a href="buscar-historico.jsp"><i class="fa fa-angle-right"></i>Buscar hisórico</a></li>


                </ul>
            </li>
            <li class="active treeview">
                <a style="border-left-color: #FF7E00" href="#">
                    <i class="fa  fa-area-chart" style="color: #FF7E00"></i>
                    <span>Relatórios</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul id="treeview-menu" class="treeview-menu">
                    <%
                        for (TipoEleitor t : daoTipo.Lista_tipos()) {
                    %>
                    <li><a href="tipo_usuarios.jsp?ids=<% out.print(t.getId());%>"><i class="fa fa-angle-right"></i><% out.print(t.getNome());%></a></li>

                    <%
                        }
                    %>

                    <li><a href="aniversariante.jsp"><i class="fa fa-angle-right"></i>Aniversariantes do mês</a></li>
                </ul>
            </li>

            <li class="active treeview">
                <a style="border-left-color: #FFf" href="#">
                    <i class="fa  fa-sign-out" style="color: #FFf"></i>
                    <span>Configurações</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul id="treeview-menu" class="treeview-menu">
                    <li><a href="/<%out.print(Propriedade.getApp());%>/SvSair" ><i class="glyphicon glyphicon-lock"></i>  Sair</a></li>




                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>