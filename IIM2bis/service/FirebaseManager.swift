//
//  FirebaseManager.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 12/04/2023.
//

import Foundation
import Firebase

class FirebaseManager{
    //attributs
    static let shared = FirebaseManager()
    var auth : Auth
    var cloudFirestore : Firestore
    
    var userRef : CollectionReference {
        return cloudFirestore.collection("UTILISATEURS")
    }
    
    
    
    //constructeur
    
    init(){
        FirebaseApp.configure()
        auth = Auth.auth()
        cloudFirestore = Firestore.firestore()
    }
    
    
    
    //méthode
    
    
    //ajouter un utilisateur dans la base donnée
    func createUserFirebase(uid : String ,datas : [String:Any]){
        let doc = userRef.document(uid)
        doc.setData(datas)
        
        
    }
    
    
    //mettre les infos de l'utilisateur
    
    func updateUserFirebase(uid : String, datas  : [String:Any]){
        let doc = userRef.document(uid)
        doc.updateData(datas)
    }
    
    
    //se deconnecter de l'application
    
    
}
