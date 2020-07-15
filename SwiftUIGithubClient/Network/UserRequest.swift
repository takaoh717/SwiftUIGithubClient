//
//  UserRequest.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Alamofire

class UserRequest: BaseRequestProtocol {

    var keyword = ""

    var parameters: Parameters? {
        return ["q": keyword, "page": 0, "per_page": 20]
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

    init(keyword: String) {
        self.keyword = keyword
    }

    typealias ResponseType = UserResponse
}
