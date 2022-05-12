//
//  NetworkManager.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit
import Moya

protocol FetchApiServices {
    
    func getList(completion: @escaping (Result<ContactsList?, Error>) -> ())
    func update(id: Int, firstName: String, lastName: String, completion: @escaping(Result<UpdateResponse?, Error>) -> ())
    func create(firstName: String, lastName: String, completion: @escaping(Result<CreateResponse?, Error>) -> ())
    
}

final class NetworkManager: FetchApiServices {
    
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    
    
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
                    
                    completion(.failure(error))
                }
            case let .failure(error):
                
                completion(.failure(error))
            }
        }
    }
    func getList(completion: @escaping (Result<ContactsList?, Error>) -> ()){
        request(networkService: .getList, completion: completion)
    }
    
    func update(id: Int, firstName: String, lastName: String, completion: @escaping(Result<UpdateResponse?, Error>) -> ()){
        request(networkService: .update(id: id, firstName: firstName, lastName: lastName), completion: completion)
    }
    
    func create(firstName: String, lastName: String, completion: @escaping(Result<CreateResponse?, Error>) -> ()){
        request(networkService: .create(firstName: firstName, lastName: lastName), completion: completion)
    }
    
}




