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
    var body: some View {
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
            registerView()
        })
        .padding()
        .background(
         Image("tomb")
        )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
