//
//  HomeView.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 14/04/2023.
//

import SwiftUI

struct HomeView: View {
    @State var valeur = 0
    @StateObject var userVm  = UserViewModel(id:FirebaseManager().getId())
    var body: some View {
        VStack{
            TabView (selection : $valeur){
                Text("List des personnes")
                    .tabItem {
                    Text("Personnes")
                    Image(systemName: "person.fill")
                }
                SettingsView(userVm : userVm)
                    .tabItem {
                    Text("Réglage")
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
