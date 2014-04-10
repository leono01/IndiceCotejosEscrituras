<%@ page import="lion.Otorgante" %>



<div class="fieldcontain ${hasErrors(bean: otorganteInstance, field: 'nombreOtorgante', 'error')} ">
	<label for="nombreOtorgante">
		<g:message code="otorgante.nombreOtorgante.label" default="Nombre Otorgante" />
		
	</label>
	<g:textField name="nombreOtorgante" value="${otorganteInstance?.nombreOtorgante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: otorganteInstance, field: 'escritura', 'error')} required">
	<label for="escritura">
		<g:message code="otorgante.escritura.label" default="Escritura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="escritura" name="escritura.id" from="${lion.Escritura.list()}" optionKey="id" required="" value="${otorganteInstance?.escritura?.id}" class="many-to-one"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: otorganteInstance, field: 'operacionesDelOtorgante', 'error')} ">
	<label for="operacionesDelOtorgante">
		<g:message code="otorgante.operacionesDelOtorgante.label" default="Operaciones Del Otorgante" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${otorganteInstance?.operacionesDelOtorgante?}" var="o">
    <li><g:link controller="operacionesDelOtorgante" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="operacionesDelOtorgante" action="create" params="['otorgante.id': otorganteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'operacionesDelOtorgante.label', default: 'OperacionesDelOtorgante')])}</g:link>
</li>
</ul>

</div>--%>

