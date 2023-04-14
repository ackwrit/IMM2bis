//
//  registerView.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 12/04/2023.
//

import SwiftUI

struct registerView: View {
    @State var mail : String = ""
    @State var password : String = ""
    @State var prenom : String = ""
    @State var nom = ""
    @StateObject var authVm : AuthViewModel
    var body: some View {
        VStack{
            Text("Chainsaw")
                .font(.largeTitle)
                .foregroundColor(.red)
            Image("tomb")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            TextField("prénom", text: $prenom)
                .border(.black)
                .textFieldStyle(.plain)
            TextField("nom", text: $nom)
                .border(.black)
                .textFieldStyle(.plain)
            TextField("mail", text: $mail)
                .border(.black)
                .textFieldStyle(.plain)
            SecureField("password", text:$password)
                .textFieldStyle(.plain)
                .border(.black)
                .textFieldStyle(.plain)
            Button("Inscription") {
                //Enregister les informations
                authVm.createUser(mail: mail, password: password, prenom: prenom, nom: nom)
            }
            
        }
        .padding()
    }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerView(authVm: AuthViewModel())
    }
}
