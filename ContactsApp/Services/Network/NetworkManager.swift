//
//  NetworkManager.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import RxSwift
import Moya
import RxCocoa
import UIKit

protocol FetchApiServices {
    // welcome
    func getVersion(completion: @escaping (Result<String?, Error>) -> ())
    
}

final class NetworkManager: FetchApiServices {
    
    var userRespository = UserRepository()
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    var newToken: JWTRefreshResponse?
    
    func request<T: Codable>(networkService: NetworkService, completion: @escaping (Result<T?, Error>) -> ()) {
        provider.request(networkService) { result in
            switch result {
            case let .success(response):
                do {
                    if response.statusCode >= 200 && response.statusCode <= 300 {
                        
                        let results = try JSONDecoder().decode(T.self, from: response.data)
                        completion(.success(results))
                    }
                   
            }
                catch let error {
                    Logger.shared.print(from: "\(Self.self)", message: error.localizedDescription)
                    completion(.failure(error))
                }
            case let .failure(error):
                Logger.shared.print(from: "\(Self.self)", message: error.localizedDescription)
                completion(.failure(error))
        }
    }
    }
    func getVersion(completion: @escaping (Result<String?, Error>) -> ()){
        request(networkService: .welcomVersion, completion: completion)
    }
    
    
    
}




