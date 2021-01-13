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
        HStack(spacing: 0) {
            ///TabBar
            VStack {
                TabButton(image: "message", title: "All Chats", selectedTab: $homeData.selectedTab)
                TabButton(image: "person", title: "Personal", selectedTab: $homeData.selectedTab)
                TabButton(image: "bubble.middle.bottom", title: "Bots", selectedTab: $homeData.selectedTab)
                TabButton(image: "slider.horizontal.3", title: "Edit", selectedTab: $homeData.selectedTab)
                Spacer()
                TabButton(image: "gear", title: "Settings", selectedTab: $homeData.selectedTab)
            }
            .padding()
            .padding(.top, 35)
            .background(BlurView())
            
            ///Tab Content
            ZStack {
                switch homeData.selectedTab {
                case "All Chats": NavigationView { AllChatsView() }
                case "Personal": Text("Personal")
                case "Bots": Text("Bots")
                case "Edit": Text("Edit")
                default: Text("Settings")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.3, height: screen.height - 160)
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
