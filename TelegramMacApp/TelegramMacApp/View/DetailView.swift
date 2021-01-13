//
//  DetailView.swift
//  TelegramMacApp
//
//  Created by Medyannik Dmitri on 13.01.2021.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var user: RecentMessage
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(user.userName)
                        .font(.title2)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { homeData.isExpanded.toggle() }, label: {
                        Image(systemName: "sidebar.right")
                            .font(.title2)
                            .foregroundColor(homeData.isExpanded ? .blue : .primary)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                
                Spacer()
                
                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        Image(systemName: "paperplane")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    TextField("Enter Message", text: $homeData.message)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .clipShape(Capsule())
                        .background(Capsule().strokeBorder(Color.white))
                    
                    Button(action: {}, label: {
                        Image(systemName: "face.smiling.fill")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}, label: {
                        Image(systemName: "mic")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding([.horizontal, .bottom])
            }
            ExpandedView(user: user)
                .frame(width: 200)
                .background(BlurView())
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct ExpandedView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var user: RecentMessage
    var body: some View {
        HStack {
            Divider()
            VStack(spacing: 25) {
                Image(user.userImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .padding(.top, 35)
                
                Text(user.userName)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Button(action: {}, label: {
                        VStack {
                            Image(systemName: "bell.slash")
                                .font(.title2)
                            Text("Mute")
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack {
                            Image(systemName: "hand.raised.fill")
                                .font(.title2)
                            Text("Block")
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.title2)
                            Text("Report")
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                
                Picker(selection: $homeData.pickedTab, label: Text("Picker"), content: {
                    Text("Media").tag("Media")
                    Text("Links").tag("Links")
                    Text("Audio").tag("Audio")
                    Text("Files").tag("Files")
                })
                .labelsHidden()
                .padding(.vertical)
                
                ScrollView{
                    if homeData.pickedTab == "Media" {
                        
                    } else {
                        Text("No \(homeData.pickedTab)")
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        }
    }
}
