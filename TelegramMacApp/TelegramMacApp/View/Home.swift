//
//  Home.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 12.01.2021.
//

import SwiftUI

var screen = NSScreen.main!.visibleFrame
struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        HStack {
            VStack {
                TabButton(image: "message", title: "All Chats", selectedTab: $homeData.selectedTab)
                
                TabButton(image: "person", title: "Personal", selectedTab: $homeData.selectedTab)
                
                TabButton(image: "bubble.middle.bottom", title: "Bots", selectedTab: $homeData.selectedTab)
                
                TabButton(image: "slider.horizontal.3", title: "Edit", selectedTab: $homeData.selectedTab)
                
                Spacer()
            }
            .padding()
            .padding(.top)
            Spacer()
        }
        .frame(width: screen.width / 1.2, height: screen.height - 60)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
