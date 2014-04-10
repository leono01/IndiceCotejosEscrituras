package lion

import org.springframework.dao.DataIntegrityViolationException

class EscrituraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [escrituraInstanceList: Escritura.list(params), escrituraInstanceTotal: Escritura.count()]
    }

    def create() {
        [escrituraInstance: new Escritura(params)]
    }

    def save() {
        def escrituraInstance = new Escritura(params)
        if (!escrituraInstance.save(flush: true)) {
            render(view: "create", model: [escrituraInstance: escrituraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'escritura.label', default: 'Escritura'), escrituraInstance.numeroDeEscritura])
        redirect(action: "edit", id: escrituraInstance.id)
    }

    def show(Long id) {
        def escrituraInstance = Escritura.get(id)
        if (!escrituraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escritura.label', default: 'Escritura'), numeroDeEscritura])
            redirect(action: "list")
            return
        }

        [escrituraInstance: escrituraInstance]
    }

    def edit(Long id) {
        def escrituraInstance = Escritura.get(id)
        if (!escrituraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escritura.label', default: 'Escritura'), numeroDeEscritura])
            redirect(action: "list")
            return
        }

        [escrituraInstance: escrituraInstance]
    }

    def update(Long id, Long version) {
        def escrituraInstance = Escritura.get(id)
        if (!escrituraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escritura.label', default: 'Escritura'), numeroDeEscritura])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (escrituraInstance.version > version) {
                escrituraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'escritura.label', default: 'Escritura')] as Object[],
                          "Another user has updated this Escritura while you were editing")
                render(view: "edit", model: [escrituraInstance: escrituraInstance])
                return
            }
        }

        escrituraInstance.properties = params

        if (!escrituraInstance.save(flush: true)) {
            render(view: "edit", model: [escrituraInstance: escrituraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'escritura.label', default: 'Escritura'), escrituraInstance.numeroDeEscritura])
        redirect(action: "show", id: escrituraInstance.id)
    }

    def delete(Long id) {
        def escrituraInstance = Escritura.get(id)
        if (!escrituraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escritura.label', default: 'Escritura'), numeroDeEscritura])
            redirect(action: "list")
            return
        }

        try {
            escrituraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'escritura.label', default: 'Escritura'), numeroDeEscritura])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'escritura.label', default: 'Escritura'), numeroDeEscritura])
            redirect(action: "show", id: id)
        }
    }
    
    def guardarEscrituras={                
        chain(controller:'jasper', action:'index', model: [data:null], params:params)
    }
    
    def guardarCotejos={
        chain(controller:'jasper', action:'index', model: [data:null], params:params)
    }
}
