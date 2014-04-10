
<%@ page import="lion.Escritura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escritura.label', default: 'Escritura')}" />
		<title>Escrituras y cotejos capturados</title>
	</head>
	<body>
		<a href="#list-escritura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Capturar Escritura o Cotejo</g:link></li>
			</ul>
		</div>
                <div class="well">
                    <table>
                      <tbody>
                        <tr>
                          <td>
                            <g:jasperReport name="reporteEscrituras" jasper="reporteEscrituras" format="PDF" description="Hacer Reporte Índice Escrituras (PDF)" action="guardarEscrituras" controller="escritura">
                            </g:jasperReport>    
                          </td>
                          <td>
                            <g:jasperReport name="reporteCotejos" jasper="reporteCotejos" format="PDF" description="Hacer Reporte Índice Cotejos (PDF)" action="guardarCotejos" controller="escritura"/>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                </div>
		<div id="list-escritura" class="content scaffold-list" role="main">
			<h1>Escrituras y cotejos capturados.</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numeroDeEscritura" title="${message(code: 'escritura.numeroDeEscritura.label', default: 'Escritura')}" />
                                                
                                                <th>OTORGANTES / SOLICITANTES</th>
					                                                
                                                <th> </th>
                                                
						<g:sortableColumn property="nombreOperacion" title="${message(code: 'escritura.nombreOperacion.label', default: 'Operación')}" />
					
						<g:sortableColumn property="volumen" title="${message(code: 'escritura.volumen.label', default: 'Volumen')}" />
					
						<g:sortableColumn property="folios" title="${message(code: 'escritura.folios.label', default: 'Folios')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'escritura.fecha.label', default: 'Fecha')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${escrituraInstanceList}" status="i" var="escrituraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${escrituraInstance.id}">${fieldValue(bean: escrituraInstance, field: "numeroDeEscritura")}</g:link></td>
                                                
                                                <td><table>
                                                      <tbody>
                                                        <g:if test="${escrituraInstance.otorgantes}">
                                                        <g:each var="otorgante" in="${escrituraInstance.otorgantes}" status="o">
                                                          <tr>                                                            
                                                            <td>
                                                                <label>${otorgante.nombreOtorgante}</label>
                                                            </td>
                                                          </tr>
                                                        </g:each>
                                                        </g:if>
                                                      </tbody>
                                                    </table>
                                                </td>
                                                
                                                <td><table>
                                                      <tbody>
                                                        <g:if test="${escrituraInstance.beneficiarios}">
                                                        <g:each var="beneficiario" in="${escrituraInstance.beneficiarios}" status="o">
                                                          <tr>                                                            
                                                            <td>
                                                                <label>${beneficiario.nombreBeneficiario}</label>
                                                            </td>
                                                          </tr>
                                                        </g:each>
                                                        </g:if>
                                                      </tbody>
                                                    </table>
                                                </td>
					
						<td>${fieldValue(bean: escrituraInstance, field: "nombreOperacion")}</td>
					
						<td>${fieldValue(bean: escrituraInstance, field: "volumen")}</td>
					
						<td>${fieldValue(bean: escrituraInstance, field: "folios")}</td>
					
						<td><g:formatDate date="${escrituraInstance.fecha}" format="dd/MM/yy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${escrituraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
