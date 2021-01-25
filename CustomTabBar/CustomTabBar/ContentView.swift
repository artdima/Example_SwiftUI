//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Medyannik Dmitri on 25.01.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            CustomTabs()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image("icons8-asterix-50")
            })
            Button(action: {
                
            }, label: {
                Image("icons8-futurama-bender-50")
            })
            Button(action: {
                
            }, label: {
                Image("icons8-minion-50")
            })
            Button(action: {
                
            }, label: {
                Image("icons8-woody-woodpecker-50")
            })
        }
    }
}
