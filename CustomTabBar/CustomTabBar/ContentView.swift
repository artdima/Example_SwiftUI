//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Medyannik Dmitri on 25.01.2021.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        VStack {
            Spacer()
            CustomTabs(index: $index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }, label: {
                Image(systemName: "books.vertical")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            })
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }, label: {
                Image(systemName: "graduationcap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            })
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }, label: {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            })
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.2))
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }, label: {
                Image(systemName: "gearshape")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            })
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
        }
        .padding(.horizontal, 35)
        .frame(height: 60)
    }
}
