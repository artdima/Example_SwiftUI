//
//  LoginPageMacAppApp.swift
//  LoginPageMacApp
//
//  Created by Medyannik Dmitri on 14.01.2021.
//

import SwiftUI

@main
struct LoginPageMacAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //Hiding the Title Bar
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

//Hiding TextField Focus Ring
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
