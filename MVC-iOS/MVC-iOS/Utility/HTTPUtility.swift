//
//  HTTPUtility.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct HTTPUtility {
    
    static func getApiData<T: Decodable>(requestUrl: URL, headers: [String: String] = [:] , resultType: T.Type, completionHandler: @escaping (_ result: T?, _ error: String?) -> Void) {
                
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "get"
        urlRequest.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: urlRequest) { responseData, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(nil, error.localizedDescription)
                } else {
                    if let responseDataVal = responseData {
                        let decoder = JSONDecoder()
                        do {
                            let result = try decoder.decode(T.self, from: responseDataVal)
                            completionHandler(result, nil)
                        } catch {
                            completionHandler(nil, error.localizedDescription)
                        }
                    } else {
                        completionHandler(nil, "result not found in API")
                    }
                }
            }
        }.resume()
    }
    
    static func postApiData<T: Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping (_ result: T?, _ error: String?) -> Void) {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { responseData, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(nil, error.localizedDescription)
                } else {
                    if let responseDataVal = responseData {
                        let decoder = JSONDecoder()
                        do {
                            let result = try decoder.decode(T.self, from: responseDataVal)
                            completionHandler(result, nil)
                        } catch {
                            completionHandler(nil, error.localizedDescription)
                        }
                    } else {
                        completionHandler(nil, "result not found in API")
                    }
                }
            }
        }.resume()
    }
}
