
<%@ page import="lion.Otorgante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'otorgante.label', default: 'Otorgante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-otorgante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-otorgante" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list otorgante">
			
				<g:if test="${otorganteInstance?.nombreOtorgante}">
				<li class="fieldcontain">
					<span id="nombreOtorgante-label" class="property-label"><g:message code="otorgante.nombreOtorgante.label" default="Nombre Otorgante" /></span>
					
						<span class="property-value" aria-labelledby="nombreOtorgante-label"><g:fieldValue bean="${otorganteInstance}" field="nombreOtorgante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${otorganteInstance?.escritura}">
				<li class="fieldcontain">
					<span id="escritura-label" class="property-label"><g:message code="otorgante.escritura.label" default="Escritura" /></span>
					
						<span class="property-value" aria-labelledby="escritura-label"><g:link controller="escritura" action="show" id="${otorganteInstance?.escritura?.id}">${otorganteInstance?.escritura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${otorganteInstance?.operacionesDelOtorgante}">
				<li class="fieldcontain">
					<span id="operacionesDelOtorgante-label" class="property-label"><g:message code="otorgante.operacionesDelOtorgante.label" default="Operaciones Del Otorgante" /></span>
					
						<g:each in="${otorganteInstance.operacionesDelOtorgante}" var="o">
						<span class="property-value" aria-labelledby="operacionesDelOtorgante-label"><g:link controller="operacionesDelOtorgante" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${otorganteInstance?.id}" />
					<g:link class="edit" action="edit" id="${otorganteInstance?.id}" ><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
