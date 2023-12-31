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

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    private let apiUrl = Bundle.main.apiUrl
    
    func goNextPost(index: Int, completion: @escaping (_ isSucess: Bool) -> Void) {
        let goNextUrl = apiUrl + "/program/start/\(index)"
        let param = IdTokenBody(index: index)
        let header: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        
        AF.request(goNextUrl, method: .post, parameters: param, encoder: JSONParameterEncoder.default, headers: header)
            .responseData { response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                switch response.result {
                case .success(let value):
                    if let jsonString = String(data: value, encoding: .utf8) {
                        print(jsonString)
                    }
                    completion(true)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

