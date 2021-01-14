//
//  Login.swift
//  LoginPageMacApp
//
//  Created by Medyannik Dmitri on 14.01.2021.
//

import SwiftUI

struct Login: View {
    //Getting screen frame
    var screen = NSScreen.main?.visibleFrame
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            
            VStack {
                Spacer()
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, -35)
                Spacer()
            }
            .frame(width: (screen!.width / 1.8) / 2)
            .background(Color("lightblue"))
        }
        .frame(width: screen!.width / 1.8, height: screen!.height - 100)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
