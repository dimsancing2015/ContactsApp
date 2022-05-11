//
//  NetworkService.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Moya

enum NetworkService{
    case userInfo(uid: String)
    case getContactList
    
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        
        let baseURL: String = "https://reqres.in/api/"

        switch self {
        case .userInfo(uid: _):
            return URL(string: baseURL)!
        case .getContactList:
            return URL(string: baseURL)!
        
        }
    }
    
    public var path: String {
        switch self {
        case .userInfo(let uid):
            return "user/\(uid)/entity"
        case .getContactList:
            return "users"
        
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .userInfo:
            return .get
        case .getContactList:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        
        switch self {
        case .userInfo(_):
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getContactList:
            return .requestParameters(parameters: ["page": "2"], encoding: URLEncoding.default)
        
        }
    }
    
    
    public var headers: [String : String]? {
       
        var parameters: [String: String] = ["":""]
        
        parameters = [
                //"Authorization" : "Bearer \(token)",
               
                "Content-Type": "application/json",
                "Accept": "application/json"]
    
        
         return parameters
    }
}




