//
//  UserListResource.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation

struct UserListResource {
    
    func getUserList(completionHandler: @escaping (_ result: UserListResponse?, _ error: String?) -> Void) {
        
        guard let requestUrl = URL(string: Endpoint.userList.path()) else {
            completionHandler(nil, "Error:- Incorrect request url path! Unable to convert request path to URL")
            return
        }
        
        HTTPUtility.getApiData(requestUrl: requestUrl, resultType: UserListResponse.self) { result, error in
            completionHandler(result, error)
        }
    }
}
