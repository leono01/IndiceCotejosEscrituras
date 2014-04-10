<%@ page import="lion.Beneficiario" %>



<div class="fieldcontain ${hasErrors(bean: beneficiarioInstance, field: 'nombreBeneficiario', 'error')} ">
	<label for="nombreBeneficiario">
		<g:message code="beneficiario.nombreBeneficiario.label" default="Nombre Beneficiario" />
		
	</label>
	<g:textField name="nombreBeneficiario" value="${beneficiarioInstance?.nombreBeneficiario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiarioInstance, field: 'escritura', 'error')} required">
	<label for="escritura">
		<g:message code="beneficiario.escritura.label" default="Escritura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="escritura" name="escritura.id" from="${lion.Escritura.list()}" optionKey="id" required="" value="${beneficiarioInstance?.escritura?.id}" class="many-to-one"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: beneficiarioInstance, field: 'operacionesDelBeneficiario', 'error')} ">
	<label for="operacionesDelBeneficiario">
		<g:message code="beneficiario.operacionesDelBeneficiario.label" default="Operaciones Del Beneficiario" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${beneficiarioInstance?.operacionesDelBeneficiario?}" var="o">
    <li><g:link controller="operacionesDelBeneficiario" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="operacionesDelBeneficiario" action="create" params="['beneficiario.id': beneficiarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'operacionesDelBeneficiario.label', default: 'OperacionesDelBeneficiario')])}</g:link>
</li>
</ul>

</div>--%>

