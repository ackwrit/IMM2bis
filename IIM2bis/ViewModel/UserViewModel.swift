//
//  UserViewModel.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 12/04/2023.
//

import Foundation
import Firebase
class UserViewModel : ObservableObject {
    @Published var user : Personne?
    var manager = FirebaseManager.shared
    
    
    //constructeur
    init(id : String){
        getUserWithId(id : id)
    }
    
    
    func getUserWithId(id : String){
        manager.userRef.document(id).addSnapshotListener(resultat)
    }
    
    
    func resultat(snapshot:DocumentSnapshot?, error:Error?){
        DispatchQueue.main.async {
            guard let snap = snapshot else{return }
            let id = snap.documentID
            let datas = snap.data() ?? [:]
            let newUser = Personne(id: id, dict: datas)
            self.user = newUser
        }
    }
    
    
}
