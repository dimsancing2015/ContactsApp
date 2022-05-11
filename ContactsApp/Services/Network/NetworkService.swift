//
//  NetworkService.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Moya
import DeviceKit

enum NetworkService{
    case userInfo(uid: String)
    case welcomVersion
    
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        var envConfig = Configuration()
        let baseURL: String = String(envConfig.baseUrl)

        switch self {
        case .userInfo(uid: _):
            return URL(string: baseURL)!
        case .welcomVersion:
            return URL(string: baseURL)!
        
        }
    }
    
    public var path: String {
        switch self {
        case .userInfo(let uid):
            return "user/\(uid)/entity"
        case .welcomVersion:
            return "version"
        
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .userInfo:
            return .get
        case .welcomVersion:
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
        case .welcomVersion:
            return .requestParameters(parameters: ["version": "3.3.19", "os": "iOS"], encoding: URLEncoding.default)
        
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




