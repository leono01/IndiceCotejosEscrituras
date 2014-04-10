package lion

class Otorgante implements Serializable{
    String nombreOtorgante
    
    static belongsTo    = [escritura:Escritura]
    static hasMany      = [operacionesDelOtorgante:OperacionesDelOtorgante]
    
    static constraints = {
        nombreOtorgante unique:false
    }
    
    String toSotring(){
        "${nombreOtorgante}"
    }
}
