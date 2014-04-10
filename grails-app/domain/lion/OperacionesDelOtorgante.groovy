package lion

class OperacionesDelOtorgante implements Serializable {
    Escritura escritura
    Otorgante otorgante
    
    static OperacionesDelOtorgante link(escritura, otorgante) { 
        def opo = OperacionesDelOtorgante.findByEscrituraAndOtorgante(escritura, otorgante)
        if (!opo) { 
            opo = new OperacionesDelOtorgante()
            escritura?.addToOperacionesDelOtorgante(opo)
            otorgante?.addToOperacionesDelOtorgante(opo) 
            opo.save() 
        } 
        return opo 
    }

    static void unlink(escritura, otorgante) { 
        def opo = OperacionesDelOtorgante.findByEscrituraAndOtorgante(escritura, otorgante)
        if (opo) { 
            escritura?.removeFromOperacionesDelOtorgante(opo)
            otorgante?.removeFromOperacionesDelOtorgante(opo)
            opo.delete() 
        } 
    }
    
    static constraints = {
        escritura nullable:true
        otorgante nullable:true
    }
}
