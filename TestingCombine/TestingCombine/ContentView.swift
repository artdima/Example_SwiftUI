//
//  ContentView.swift
//  TestingCombine
//
//  Created by Medyannik Dmitri on 09.01.2021.
//

import SwiftUI

//ViewModel
import Combine

final class ViewModel: ObservableObject {
    @Published var time = ""
    
    init() {
        
    }
}

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Text(viewModel.time)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
