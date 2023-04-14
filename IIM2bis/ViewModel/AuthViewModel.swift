//
//  AuthViewModel.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 14/04/2023.
//

import Foundation
import Firebase

class AuthViewModel : ObservableObject{
@Published var isFinishConnecting = false
@Published var isAuth = false
@Published var showError = false
var errorString = ""
var datas : [String:Any] = [:]
//faire le lien avec FirebaseManager
var manager = FirebaseManager.shared
    
//variable calculé
    var auth : Auth {
        return manager.auth
    }
    
//contructeur
init(){
    observeAuthentification()
    }

    
//méthode
func observeAuthentification(){
    auth.addStateDidChangeListener(handleListener)
    }
    
    func handleListener(auth : Auth,user: User?){
        self.isFinishConnecting = true
        self.isAuth = user != nil
        
    }
    
    func checkValue(valeur : String , valeurEcrit : String) -> Bool{
    let isEmpty = valeur != ""
    self.showError = !isEmpty
    self.errorString = !isEmpty ? "Entrer votre \(valeurEcrit)": ""
      return isEmpty
    }
    
    func createUser(mail : String, password : String, prenom : String , nom : String){
        guard checkValue(valeur: mail, valeurEcrit: "mail")else {return }
        guard checkValue(valeur: password, valeurEcrit: "password")else {return }
        guard checkValue(valeur: nom, valeurEcrit: "nom")else {return }
        guard checkValue(valeur: prenom, valeurEcrit: "prénom")else {return }
        
self.datas = ["MAIL":mail,"NOM":nom,"PRENOM":prenom]
auth.createUser(withEmail: mail, password: password,completion: autoCompletion)
    }
    
    func autoCompletion(dataResult : AuthDataResult?,error: Error?){
        if let errorLocal = error {
        self.errorString = errorLocal.localizedDescription
        self.showError = true
          return
        }
        
        if let datas = dataResult {
            let user = datas.user
            let uid = user.uid
            manager.createUserFirebase(uid: uid, datas: self.datas)
        }
        
    }
    
    
    

    
    
    
    

    
}
