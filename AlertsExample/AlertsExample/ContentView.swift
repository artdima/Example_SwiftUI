//
//  ContentView.swift
//  AlertsExample
//
//  Created by Medyannik Dmitri on 10.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsPresented = false
    @State private var backgroundUpdated = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if backgroundUpdated {
                    Color.red
                } else {
                    Color.white
                }
                
                VStack {
                    Button(action: {
                        self.alertIsPresented = true
                    }, label: {
                        Text("Tap me!")
                            .foregroundColor(Color.white)
                            .font(.system(size: 24))
                            .bold()
                    })
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(5)
                    .alert(isPresented: $alertIsPresented, content: {
                        Alert(title: Text("Change background"),
                              primaryButton: .default(Text("Yes"), action: {
                                self.backgroundUpdated.toggle()
                              }),
                              secondaryButton: .cancel())
                                
                              
                    })
                    
                }.navigationTitle("SwiftUI Alert")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
