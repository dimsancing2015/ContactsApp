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
    
    func getContactsList(completion: @escaping (Result<ContactsList?, Error>) -> ())
    func updateContact(id: Int, firstName: String, lastName: String, completion: @escaping(Result<UpdateResponse?, Error>) -> ())
    func createContact(firstName: String, lastName: String, completion: @escaping(Result<CreateResponse?, Error>) -> ())
    
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
    func getContactsList(completion: @escaping (Result<ContactsList?, Error>) -> ()){
        request(networkService: .getContactList, completion: completion)
    }
    
    func updateContact(id: Int, firstName: String, lastName: String, completion: @escaping(Result<UpdateResponse?, Error>) -> ()){
        request(networkService: .updateContact(id: id, firstName: firstName, lastName: lastName), completion: completion)
    }
    
    func createContact(firstName: String, lastName: String, completion: @escaping(Result<CreateResponse?, Error>) -> ()){
        request(networkService: .createContact(firstName: firstName, lastName: lastName), completion: completion)
    }
    
}




