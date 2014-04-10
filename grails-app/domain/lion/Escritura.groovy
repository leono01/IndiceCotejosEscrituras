package lion

class Escritura implements Serializable{
    String  numeroDeEscritura
    String  nombreOperacion
    String  volumen
    String  folios
    Date    fecha
        
    static hasMany = [  otorgantes:Otorgante,                                                 
                        beneficiarios:Beneficiario,
                        operacionesDelOtorgante:OperacionesDelOtorgante,
                        operacionesDelBeneficiario:OperacionesDelBeneficiario
                        ]
    
    static constraints = {
        numeroDeEscritura nullable:false, unique:true
        nombreOperacion   nullable:false
        volumen           nullable:false
        folios            nullable:false
        fecha             nullable:true        
    }
    
    static mapping = {
        otorgantes      cascade: 'all-delete-orphan'
        beneficiarios   cascade: 'all-delete-orphan'
    }
    
    String toString(){
        "${numeroDeEscritura}"
    }
}
