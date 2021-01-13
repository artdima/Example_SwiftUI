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
}
