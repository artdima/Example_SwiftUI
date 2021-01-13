//
//  AllChatsView.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 13.01.2021.
//

import SwiftUI

struct AllChatsView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        ///Side Tab View
        VStack {
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $homeData.search)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
            .padding()
            
            List(selection: $homeData.selectedRecentMsg) {
                ForEach(homeData.msgs) { message in
                    NavigationLink(
                        destination: DetailView(user: message),
                        label: {
                            RecentCardView(recentMsg: message)
                        })
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
