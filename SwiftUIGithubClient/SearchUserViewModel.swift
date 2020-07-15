//
//  SearchUserViewModel.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Foundation
import Combine
import Alamofire

class SearchUserViewModel: ObservableObject {

    @Published var displayData: UserResponse?

    var task: AnyCancellable? = nil

    private(set) lazy var onAppear: () -> Void = { [weak self] in
        self?.getUsers(keyword: "a")
    }

    func getUsers(keyword: String) {
        self.task = NetworkPublisher.publish(UserRequest(keyword: keyword))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("OK")
                case let .failure(error):
                    print(error)
                }
            }, receiveValue: { data in
                self.displayData = data
            })
    }

}
