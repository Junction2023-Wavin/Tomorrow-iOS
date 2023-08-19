//
//  APIManager.swift
//  Tomorrow
//
//  Created by 이재원 on 2023/08/19.
//

import Foundation
import Alamofire

extension Bundle {
    var apiUrl: String {
        guard let filePath = self.path(forResource: "ServerMinsu", ofType: "plist") else { return "" }
        guard let source = NSDictionary(contentsOfFile: filePath) else { return "" }
        guard let url = source["serverUrl"] as? String else { fatalError("api url error") }
        
        return url
    }
}

struct IdTokenBody: Encodable {
    var index: Int
}

final class UserAPIManager {
    static let shared = UserAPIManager()
    private init() {}
    
    private let apiUrl = Bundle.main.apiUrl
    
    func goNextPost(index: Int) {
        let goNextUrl = apiUrl + "/api/users/auth/apple"
        let param = IdTokenBody(index: index)
        let header: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        
        AF.request(goNextUrl, method: .post, parameters: param, encoder: JSONParameterEncoder.default, headers: header)
//            .responseDecodable(of: SignInWithAppleResponse.self) { response in
//                print("Request: \(String(describing: response.request))")
//                print("Response: \(String(describing: response.response))")
//                print("Result: \(response.result)")
//
//                switch response.result {
//                case .success(let value):
//                    print(value)
//                case .failure(let error):
//                    print(error)
//                }
//            }
            .responseData { response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                switch response.result {
                case .success(let value):
                    if let jsonString = String(data: value, encoding: .utf8) {
                        print(jsonString)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

