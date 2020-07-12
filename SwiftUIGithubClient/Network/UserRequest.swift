//
//  UserRequest.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Alamofire

class UserRequest: BaseRequestProtocol {

    var parameters: Parameters? {
        return ["q": "takao", "page": 0, "per_page": 20]
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/search/users"
    }

    var allowsConstrainedNetworkAccess: Bool {
        return false
    }

    typealias ResponseType = UserResponse
}
