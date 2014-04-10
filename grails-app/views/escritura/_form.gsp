<%@ page import="lion.Escritura" %>



<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'numeroDeEscritura', 'error')} ">
	<label for="numeroDeEscritura">
		<g:message code="escritura.numeroDeEscritura.label" default="Numero De Escritura" />
		
	</label>
	<g:textField name="numeroDeEscritura" value="${escrituraInstance?.numeroDeEscritura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'nombreOperacion', 'error')} ">
	<label for="nombreOperacion">
		<g:message code="escritura.nombreOperacion.label" default="Nombre Operacion" />
		
	</label>
	<g:textField name="nombreOperacion" value="${escrituraInstance?.nombreOperacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'volumen', 'error')} ">
	<label for="volumen">
		<g:message code="escritura.volumen.label" default="Volumen" />
		
	</label>
	<g:textField name="volumen" value="${escrituraInstance?.volumen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'folios', 'error')} ">
	<label for="folios">
		<g:message code="escritura.folios.label" default="Folios" />
		
	</label>
	<g:textField name="folios" value="${escrituraInstance?.folios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="escritura.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${escrituraInstance?.fecha}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'beneficiarios', 'error')} ">
	<label for="beneficiarios">
		<g:message code="escritura.beneficiarios.label" default="Beneficiarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${escrituraInstance?.beneficiarios?}" var="b">
    <li><g:link controller="beneficiario" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="beneficiario" action="create" params="['escritura.id': escrituraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'beneficiario.label', default: 'Beneficiario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'operacionesDelBeneficiario', 'error')} ">
	<label for="operacionesDelBeneficiario">
		<g:message code="escritura.operacionesDelBeneficiario.label" default="Operaciones Del Beneficiario" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${escrituraInstance?.operacionesDelBeneficiario?}" var="o">
    <li><g:link controller="operacionesDelBeneficiario" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="operacionesDelBeneficiario" action="create" params="['escritura.id': escrituraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'operacionesDelBeneficiario.label', default: 'OperacionesDelBeneficiario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'operacionesDelOtorgante', 'error')} ">
	<label for="operacionesDelOtorgante">
		<g:message code="escritura.operacionesDelOtorgante.label" default="Operaciones Del Otorgante" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${escrituraInstance?.operacionesDelOtorgante?}" var="o">
    <li><g:link controller="operacionesDelOtorgante" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="operacionesDelOtorgante" action="create" params="['escritura.id': escrituraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'operacionesDelOtorgante.label', default: 'OperacionesDelOtorgante')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'otorgantes', 'error')} ">
	<label for="otorgantes">
		<g:message code="escritura.otorgantes.label" default="Otorgantes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${escrituraInstance?.otorgantes?}" var="o">
    <li><g:link controller="otorgante" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="otorgante" action="create" params="['escritura.id': escrituraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'otorgante.label', default: 'Otorgante')])}</g:link>
</li>
</ul>

</div>

