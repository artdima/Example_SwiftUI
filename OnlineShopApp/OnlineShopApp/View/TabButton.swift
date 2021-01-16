//
//  TabButton.swift
//  OnlineShopApp
//
//  Created by Medyannik Dmitri on 15.01.2021.
//

import SwiftUI

struct TabButton: View {
    @Binding var selectedTab : String
    var title : String
    var animation : Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){selectedTab = title}
        }, label: {
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? .black : .gray)
                
                if selectedTab == title{
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            })
            .frame(width: 100)
        })
    }
}
