//
//  DetailView.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 13.01.2021.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var user: RecentMessage
    var body: some View {
        VStack {
            HStack {
                Text(user.userName)
                    .font(.title2)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                })
                .buttonStyle(PlainButtonStyle())
                
                Button(action: { homeData.isExpanded.toggle() }, label: {
                    Image(systemName: "sidebar.right")
                        .font(.title2)
                        .foregroundColor(homeData.isExpanded ? .blue : .primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            
            Spacer()
            
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .font(.title2)
                })
                .buttonStyle(PlainButtonStyle())
                
                TextField("Enter Message", text: $homeData.message)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .clipShape(Capsule())
                    .background(Capsule().strokeBorder(Color.white))
                
                Button(action: {}, label: {
                    Image(systemName: "face.smiling.fill")
                        .font(.title2)
                })
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {}, label: {
                    Image(systemName: "mic")
                        .font(.title2)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding([.horizontal, .bottom])
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
