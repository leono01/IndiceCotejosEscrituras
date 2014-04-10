package lion

class OperacionesDelBeneficiario implements Serializable{
    Escritura       escritura
    Beneficiario    beneficiario
    
    static OperacionesDelBeneficiario link(escritura, beneficiario) { 
        def opo = OperacionesDelBeneficiario.findByEscrituraAndOtorgante(escritura, beneficiario)
        if (!opo) { 
            opo = new OperacionesDelBeneficiario()
            escritura?.addToOperacionesDelBeneficiario(opo)
            beneficiario?.addToOperacionesDelBeneficiario(opo) 
            opo.save() 
        } 
        return opo 
    }

    static void unlink(escritura, beneficiario) { 
        def opo = OperacionesDelBeneficiario.findByEscrituraAndBeneficiario(escritura, beneficiario)
        if (opo) { 
            escritura?.removeFromOperacionesDelBeneficiario(opo)
            beneficiario?.removeFromOperacionesDelBeneficiario(opo)
            opo.delete() 
        } 
    }
    
    static constraints = {
        escritura       nullable:true
        beneficiario    nullable:true
    }
}
