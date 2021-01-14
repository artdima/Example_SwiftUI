//
//  HomeViewModel.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 13.01.2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var selectedTab = "All Chats"
    @Published var msgs: [RecentMessage] = recentMessage
    @Published var selectedRecentMsg: String? = recentMessage.first?.id
    @Published var search = ""
    @Published var message = ""
    @Published var isExpanded = false
    @Published var pickedTab = "Media"
    
    func sendMessage(user: RecentMessage) {
        if message != "" {
            let index = msgs.firstIndex { (currentUser) -> Bool in
                return currentUser.id == user.id
            } ?? -1
            
            if index != -1 {
                msgs[index].allMsgs.append(Message(message: message, myMessage: true))
                message = ""
            }
        }
    }
}
