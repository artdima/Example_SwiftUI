//
//  CoinsList.swift
//  CryptoPriceViewer
//
//  Created by Medyannik Dmitri on 10.01.2021.
//

import SwiftUI
import Combine
import Foundation

struct CoinsList: View {
    
    @ObservedObject private var viewModel = CoinsListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.coinViewModel, id: \.self) { coinViewModel in
                Text(coinViewModel.name)
            }
            .navigationBarTitle("Coins")
            .onAppear {
                self.viewModel.fetchCoin()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsList()
    }
}

//MARK: - ViewModels
class CoinsListViewModel: ObservableObject {
    
    @Published var coinViewModel: [CoinViewModel] = []
    
    private let cryptoService = CryptoService()
    private var cansellable: AnyCancellable?
    
    func fetchCoin() {
        cansellable = cryptoService.fetchCrypto()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { coinRanking in
                    self.coinViewModel = coinRanking.data.coins.map { CoinViewModel($0) }
                  })
    }
    
}

struct CoinViewModel: Hashable {
    private var coin: Coin
    
    init(_ coin: Coin){
        self.coin = coin
    }
    
    var name: String {
        return coin.name + " " + coin.price
    }
}

//MARK: - CryptoService
final class CryptoService {
    
    var components: URLComponents {
        var components = URLComponents()
        components.host = "api.coinranking.com"
        components.scheme = "https"
        components.path = "/v1/public/coins"
        components.queryItems = [URLQueryItem(name: "timePeriod", value: "24h")]
        return components
    }
    
    func fetchCrypto() -> AnyPublisher<CryptoDataContainer, Error> {
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map { $0.data }
            .decode(type: CryptoDataContainer.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

//MARK: - Models
struct CryptoDataContainer: Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable, Hashable {
    let name: String
    let price: String
}
