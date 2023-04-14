//
//  SettingsView.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 14/04/2023.
//

import SwiftUI

struct SettingsView: View {
    @State var prenom = ""
    @State var nom = ""
    @StateObject var userVm : UserViewModel
    var body: some View {
        VStack{
            Spacer()
            Image("tomb")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400,height: 200)
            Text(userVm.user?.fullName ?? "")
                .fontWeight(.bold)
                .font(.largeTitle)
            List {
                Section {
                    HStack {
                        TextField(userVm.user?.name ?? "", text: $prenom)
                        
                        Button {
                            //metter les informations
                            if(prenom != ""){
                                var datas:[String:Any] = ["PRENOM": prenom]
                                FirebaseManager().updateUserFirebase(uid: userVm.user?.id ?? "", datas: datas)
                                prenom = ""
                            }
                        } label: {
                            Image(systemName: "plus")
                            
                        }
                        
                        
                    }
                    
                    
                    HStack {
                        TextField(userVm.user?.lastName ?? "", text: $nom)
                        
                        Button {
                            //metter les informations
                            if(nom != ""){
                                var datas:[String:Any] = ["NOM": nom]
                                FirebaseManager().updateUserFirebase(uid: userVm.user?.id ?? "", datas: datas)
                                nom = ""
                            }
                        } label: {
                            Image(systemName: "plus")
                            
                        }
                        
                        
                    }
                   

                }
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userVm: UserViewModel(id: FirebaseManager().getId()))
    }
}
