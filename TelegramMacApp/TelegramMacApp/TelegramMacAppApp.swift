//
//  TelegramMacAppApp.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 12.01.2021.
//

import SwiftUI

@main
struct TelegramMacAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // Hidding Title Bar ...
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

//Hiding Textfield Focus Ring...
extension NSTextField {
    open override var  focusRingType: NSFocusRingType {
        get { .none }
        set{ }
    }
}
