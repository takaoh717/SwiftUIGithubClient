//
//  UserDetailViewModel.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/15.
//

import Foundation
import Combine
import Alamofire

class UserDetailViewModel: ObservableObject {

    @Published var userDetail: UserDetail?

    var task: AnyCancellable? = nil

    func getUser(keyword: String) {
        self.task = NetworkPublisher.publish(UserDetailRequest(keyword: keyword))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("OK")
                case let .failure(error):
                    print(error)
                }
            }, receiveValue: { data in
                self.userDetail = data
            })
    }

}
