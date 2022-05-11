//
//  NetworkService.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Moya

enum NetworkService{
    
    case getContactList
    case updateContact(id: Int, firstName: String, lastName: String)
    case createContact(firstName: String, lastName: String)
    
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        
        let baseURL: String = "https://reqres.in/api/"
        
        switch self {
        case .getContactList:
            return URL(string: baseURL)!
        case .updateContact(id: _, firstName: _, lastName: _):
            return URL(string: baseURL)!
        case .createContact(firstName: _, lastName: _):
            return URL(string: baseURL)!
        }
    }
    
    public var path: String {
        switch self {
            
        case .getContactList:
            return "users"
        case .updateContact(let id, _, _):
            return "users/\(id)"
        case .createContact( _, _):
            return "users"
        }
    }
    
    public var method: Moya.Method {
        switch self {
            
        case .getContactList:
            return .get
        case .updateContact:
            return .put
        case .createContact:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        
        switch self {
            
        case .getContactList:
            return .requestParameters(parameters: ["page": "2"], encoding: URLEncoding.default)
        case .updateContact(_, let firstName, let LastName):
            return .requestParameters(parameters: ["name" : firstName + LastName], encoding: URLEncoding.queryString)
        case .createContact(let firstName, let LastName):
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




