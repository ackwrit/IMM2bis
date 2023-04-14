//
//  Personne.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 12/04/2023.
//

import Foundation

struct Personne : Identifiable {
    var id : String
    var _name : String?
    var _lastName : String?
    var _mail : String?
    
    
    var name : String {
        return _name ?? ""
    }
    
    var lastName : String {
        return _lastName ?? ""
    }
    
    var mail : String {
        return _mail ?? ""
    }
    
    var fullName : String {
        return name + " " + lastName
    }
    
    init(id : String , dict: [String: Any]){
        self.id = id
        self._lastName = dict["NOM"] as? String
        self._name = dict["PRENOM"] as? String
        self._mail = dict["MAIL"] as? String
        
    }
    
    
}
