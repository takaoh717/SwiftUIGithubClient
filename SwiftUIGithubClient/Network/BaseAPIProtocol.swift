//
//  BaseAPIProtocol.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Foundation
import Alamofire
import Combine

protocol BaseAPIProtocol {

    associatedtype ResponseType
  
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var allowsConstrainedNetworkAccess: Bool { get }
}

extension BaseAPIProtocol {
  
    var baseURL: URL {
        return try! NetworkConstants.baseURL.asURL()
    }
  
    var headers: [String: String]? {
        return nil
    }
  
    var allowsConstrainedNetworkAccess: Bool {
        return true
    }
}

protocol BaseRequestProtocol: BaseAPIProtocol, URLRequestConvertible {

    var parameters: Parameters? { get }
    var encoding: URLEncoding { get }
}

extension BaseRequestProtocol {

    var encoding: URLEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.timeoutInterval = TimeInterval(30)
        urlRequest.allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess

        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }

        return urlRequest
    }
}
