<%@ page import="lion.Escritura" %>



<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'numeroDeEscritura', 'error')} ">
	<label for="numeroDeEscritura">
		<g:message code="escritura.numeroDeEscritura.label" default="Numero De Escritura o Cotejo" />
		
	</label>
	<g:textField name="numeroDeEscritura" value="${escrituraInstance?.numeroDeEscritura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'nombreOperacion', 'error')} ">
	<label for="nombreOperacion">
		<g:message code="escritura.nombreOperacion.label" default="Nombre Operación" />
		
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
		<g:message code="escritura.folios.label" default="Folios o Libro" />
		
	</label>
	<g:textField name="folios" value="${escrituraInstance?.folios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="escritura.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day" format="dd/MM/yy" value="${escrituraInstance?.fecha}" default="none" noSelection="['': '']" />
</div>

<div style="display:none" class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'otorgantes', 'error')} ">
	<label for="otorgantes">
		<g:message code="escritura.otorgantes.label" default="Otorgantes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${escrituraInstance?.otorgantes?}" var="o">
    <li><g:link controller="otorgante" action="edit" params="['escritura.id': escrituraInstance?.id]" id="${o.id}">${o?.nombreOtorgante.encodeAsHTML()} &nbsp;(clic para editar)</g:link></li>
</g:each>
</br>                
<li class="add">
<g:link controller="otorgante" action="create" params="['escritura.id': escrituraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'otorgante.label', default: 'Otorgante')])}</g:link>
</li>
</ul>

</div>

<div style="display:none" class="fieldcontain ${hasErrors(bean: escrituraInstance, field: 'beneficiarios', 'error')} ">
	<label for="beneficiarios">
		<g:message code="escritura.beneficiarios.label" default="Beneficiarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${escrituraInstance?.beneficiarios?}" var="b">
    <li><g:link controller="beneficiario" action="edit" params="['escritura.id': escrituraInstance?.id]" id="${b.id}">${b?.nombreBeneficiario.encodeAsHTML()} &nbsp;(clic para editar)</g:link></li>
</g:each>
</br>
<li class="add">
<g:link controller="beneficiario" action="create" params="['escritura.id': escrituraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'beneficiario.label', default: 'Beneficiario')])}</g:link>
</li>
</ul>

</div>