//
//  UserDetailRequest.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/15.
//

import Alamofire

class UserDetailRequest: BaseRequestProtocol {

    var keyword = ""

    var parameters: Parameters? {
        return nil
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/users/\(keyword)"
    }

    var allowsConstrainedNetworkAccess: Bool {
        return false
    }

    init(keyword: String) {
        self.keyword = keyword
    }

    typealias ResponseType = UserDetail
}
