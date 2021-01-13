//
//  BlurView.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 13.01.2021.
//

import SwiftUI

struct BlurView: NSViewRepresentable {
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        
    }
}
