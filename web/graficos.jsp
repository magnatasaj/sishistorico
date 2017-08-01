<%-- 
    Document   : index
    Created on : 25/10/2016, 15:08:38
    Author     : Lamara
--%>

<%@page import="java.util.List"%>
<%@page import="com.sishistorico.dao.DaoAno"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.sishistorico.dao.DaoHistorico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% DaoHistorico ObDaoHistorico = new DaoHistorico(); %>
<%
    Calendar cal = GregorianCalendar.getInstance();
    String ano = "";
    if (request.getParameter("ano") == null) {
        ano = Integer.toString(cal.get(Calendar.YEAR));
    } else {
        ano = request.getParameter("ano");
    }


%>

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
                <div class="box bg-green-active">
                    <div class="box-header with-border"  style="color: #fff">
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                <i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <form action="graficos.jsp" method="get">

                            <h5 class="box-title">Escolha o ano para geração dos gráficos</h5>
                            <div class="row">
                                <div class="col-lg-10">
                                    <select id="ano" name="ano" class="form-control">
                                        <option></option>
                                        <% DaoAno dano = new DaoAno();
                                            List<Integer> lano = dano.Lista_anos();
                                            for (int an : lano) { %>  
                                        <option><% out.println(an); %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit"  id="buscar"  class="btn btn-primary">Alterar Ano</button>
                                </div>
                        </form>
                    </div>

                    <div>
                        <h5>Ano base para os gráficos: <% out.print(ano);%></h5>
                    </div>
                </div>

            </div>
            <!-- #Fecha escolher ano para gráfico -->
            <div class="box" >
                <div class="box-header" style="height: 100px" >
                    <h3 class="box-title">Solicitações Mensais</h3>

                    <div class="box-tools pull-right" >
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div id="container" style="width:100%; height: 100%;"></div>

                </div>
            </div>
            <div class="box" >
                <div class="box-header" style="height: 100px" >
                    <h3 class="box-title">Solicitações por área</h3>

                    <div class="box-tools pull-right" >
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div id="container2" style="width:100%; height: 100%;"></div>

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

<script>
    var d = Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [
                    "Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"
                ],
                crosshair: true
            },
            yAxis: {
                labels: {
                    format: '{value}',
                    style: {
                        color: '#89A54E'
                    }
                },
                title: {
                text: 'Solicitações'
                }
            },
            tooltip: {
                valueDecimals: 0,
                valuePrefix: '',
                shared: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        crop: false,
                        overflow: 'none',
                        format: "{y:,1f}"

                    }


                }},
             series: [<%out.print(ObDaoHistorico.Historico_Mensal(1, ano)+","+ObDaoHistorico.Historico_Mensal(2, ano));%>]
        });
        
var d2 = Highcharts.chart('container2', {
            chart: {
                type: 'column'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [
                    "Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"
                ],
                crosshair: true
            },
            yAxis: {
                labels: {
                    format: '{value}',
                    style: {
                        color: '#89A54E'
                    }
                },
                title: {
                text: 'Solicitações'
                }
            },
            tooltip: {
                valueDecimals: 0,
                valuePrefix: '',
                shared: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        crop: false,
                        overflow: 'none',
                        format: "{y:,1f}"

                    }


                }},
             series: [<%out.print(ObDaoHistorico.Historico_Mensal_por_area(ano));%>]
        });
    
</script>
</html>

