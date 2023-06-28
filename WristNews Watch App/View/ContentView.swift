//
//  ContentView.swift
//  WristNews Watch App
//
//  Created by Phi Anh on 6/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("WristNews")
                    .font(.title)
                    .fontWeight(.thin)
                
                Text("Daily news, delivered on your wrist.")
                    .fontWeight(.thin)
                    .multilineTextAlignment(.trailing)
                
                Spacer()
                
                NavigationLink(destination: ArticlesView()) {
                    Text("Start")
                }
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
