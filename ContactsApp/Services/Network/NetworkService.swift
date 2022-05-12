//
//  NetworkService.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import UIKit
import Moya

enum NetworkService{
    
    case getList
    case update(id: Int, firstName: String, lastName: String)
    case create(firstName: String, lastName: String)
    
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        
        let baseURL: String = "https://reqres.in/api/"
        
        switch self {
        case .getList:
            return URL(string: baseURL)!
        case .update(id: _, firstName: _, lastName: _):
            return URL(string: baseURL)!
        case .create(firstName: _, lastName: _):
            return URL(string: baseURL)!
        }
    }
    
    public var path: String {
        switch self {
        case .getList:
            return "users"
        case .update(let id, _, _):
            return "users/\(id)"
        case .create( _, _):
            return "users"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getList:
            return .get
        case .update:
            return .put
        case .create:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        
        switch self {
        case .getList:
            return .requestParameters(parameters: ["page": "2"], encoding: URLEncoding.default)
        case .update(_, let firstName, let LastName):
            return .requestParameters(parameters: ["name" : firstName + LastName], encoding: URLEncoding.queryString)
        case .create(let firstName, let LastName):
            return .requestParameters(parameters: ["firstName" : firstName ,"lastName": LastName], encoding: URLEncoding.queryString)
        }
    }
    
    
    public var headers: [String : String]? {
        var parameters: [String: String] = ["":""]
        parameters = [
            "Content-Type": "application/json",
            "Accept": "application/json"]
        return parameters
    }
}




