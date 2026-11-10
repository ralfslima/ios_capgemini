import Foundation

struct Pessoa: Identifiable, Codable {
    var id   =  UUID()
    var nome :  String
    var email:  String
    var estado: String
    var cidade: String
}

