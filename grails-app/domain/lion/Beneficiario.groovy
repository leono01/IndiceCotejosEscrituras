package lion

class Beneficiario implements Serializable {
    String nombreBeneficiario
    
    static belongsTo    = [escritura:Escritura]
    static hasMany      = [operacionesDelBeneficiario:OperacionesDelBeneficiario]
    
    static constraints = {
        nombreBeneficiario unique:false
    }
    
    String toSotring(){
        "${nombreBeneficiario}"
    }
}
