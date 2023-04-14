//
//  ContentView.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    //variable data flow
    @State var isPresent = false
    //class data flow
    @StateObject var authVm : AuthViewModel = AuthViewModel()
    
    
    
    var body: some View {
        if(authVm.isFinishConnecting){
            //la connexion est passé
            if(authVm.isAuth){
                Text("DashBoard")
            }
            else{
                VStack {
                    HStack {
                        Image("chainsaw")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                        .frame(width: 150,height: 150)
                        Text("ChainSaw")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.red)
                    }
                    
                    
                    Image("fate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                
                        
                    Spacer()
                    
                    
                    
                    Button("Cliquer") {
                        self.isPresent.toggle()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.purple)
                    .clipShape(Capsule())
                    
                }
                .sheet(isPresented: $isPresent, content: {
                    registerView(authVm : authVm)
                })
                .padding()
                .background(
                 Image("tomb")
                )
            }
        }
        else
        {
            Text("En cours de connexion ...")
        }
     
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
