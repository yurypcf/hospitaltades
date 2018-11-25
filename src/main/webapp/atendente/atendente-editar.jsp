<%-- 
    Document   : lista-pacientes
    Created on : 27/09/2018, 21:02:09
    Author     : Yury Cavalcante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Paciente</title>

        <link type="text/css" rel="stylesheet" href="client/css/paciente-cadastro.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan:400,600" rel="stylesheet">

    </head>
    <body>
        <div id="main-wrapper">
            <div id="sidebar-container">
                <div id="user-container">
                    <div class="profile-pic-circle">
                        <img src="client/imgs/profile.svg" alt="Ícone de Perfil" class="icon-profile-pic">
                    </div>
                    <h3>${usuarioNome}</h3>
                    <h4>${usuarioCargo}</h4>

                </div>


                <c:url var="patientsLink" value="PacienteControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="medicsLink" value="MedicoControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="attendantsLink" value="AtendenteControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="remediesLink" value="RemedioControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="usersLink" value="UsuarioControllerServlet">
                    <c:param name="command" value="READ" />
                </c:url>

                <c:url var="homeLink" value="./home.jsp" />


                <div id="menu-container">
                    <hr style="margin: 8px;">

                    <div class="menu-item"><i class="fas fa-user-injured" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                        <a href="${patientsLink}" style="text-decoration: none; color: inherit;">Pacientes</a>
                    </div>

                    <c:if test="${usuarioCargo == 'Médico' || usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-stethoscope" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${medicsLink}" style="text-decoration: none; color: inherit;">Médicos</a>
                        </div>
                    </c:if>

                    <c:if test="${usuarioCargo == 'Atendente' || usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-user-tie" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${attendantsLink}" style="text-decoration: none; color: inherit;">Atendentes</a>
                        </div>
                    </c:if>


                    <div class="menu-item"><i class="fas fa-box-open" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                        <a href="${remediesLink}" style="text-decoration: none; color: inherit;">Estoque</a>
                    </div>

                    <c:if test="${usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-users" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            <a href="${usersLink}" style="text-decoration: none; color: inherit;">Usuários</a>
                        </div>
                    </c:if>

                    <c:if test="${usuarioCargo == 'Admin'}">
                        <div class="menu-item"><i class="fas fa-file-alt" style="padding-right: 6px; color: #006EA2; font-size: 1.3rem;"></i>
                            Relatórios
                        </div>
                    </c:if>

                    <div class="logout-container">
                        <form name="logoutform" action="UsuarioControllerServlet" method="POST">
                            <input type="hidden" name="command" value="LOGOUT">
                            <button type="submit" name="logout" class="logout-buton">Sair do Sistema</button>
                        </form>
                    </div>
                </div>
            </div>
            <div id="content-wrapper">
                <div id="topbar-container">
                    <div class="main-title"><a href="${homeLink}" style="text-decoration: none; color: #FA4860;"><i class="fas fa-hospital-alt" style="padding-right: 20px; color: #FA4860;"></i>hospital tades</a></div>
                </div>
                <div id="content-container">
                    <div class="title-session">
                        <h3>Atendente: ${ATENDENTE.nome}</h3>
                    </div>
                    <div class="form-session">
                        <form action="AtendenteControllerServlet" method="GET">

                            <input type="hidden" name="command" value="UPDATE" />

                            <input type="hidden" name="atendenteId" value="${ATENDENTE.idAtendente}" />

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nome">Nome</label>
                                    <input type="text" class="form-control"  name="nome" value="${ATENDENTE.nome}" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="sobrenome">Sobrenome</label>
                                    <input type="text" class="form-control" name="sobrenome" value="${ATENDENTE.sobrenome}" />
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="cpf">CPF</label>
                                    <input type="text" class="form-control"  name="cpf" value="${ATENDENTE.cpf}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <input type="submit" value="Salvar" class="btn-save" />
                                </div>
                            </div>

                        </form>
                    </div>
                    <div style="clear: both;"></div>

                    <p style="padding: 0px 410px;">
                        <a href="AtendenteControllerServlet">Voltar a lista de Funcionários</a>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>







