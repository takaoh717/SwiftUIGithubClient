//
//  NetworkPublisher.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Foundation
import Alamofire
import Combine

public enum APIError: Error {
    case unknown
    case jsonMapping
    case notFound
}

struct NetworkPublisher {

    private static let successRange = 200 ..< 300
    private static let contentType = "application/json"
    private static let retryCount: Int = 1
    static let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    } ()

    static func publish<T, V>(_ request: T) -> Future<V, Error> where T: BaseRequestProtocol, V: Codable, T.ResponseType == V {
        return Future { promise in
            let api = AF.request(request)
                .validate(statusCode: self.successRange)
                .validate(contentType: [self.contentType])
                .cURLDescription { text in
                    print(text)
                }
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        do {
                            if let data = response.data {
                                let json = try self.decoder.decode(V.self, from: data)
                                promise(.success(json))
                            } else if let error = response.error {
                                promise(.failure(error))
                            } else {
                                promise(.failure(APIError.unknown))
                            }
                        } catch let e {
                            print(e)
                            promise(.failure(APIError.jsonMapping))
                        }
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            api.resume()
        }
    }
}
