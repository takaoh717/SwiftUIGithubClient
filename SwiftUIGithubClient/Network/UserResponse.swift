//
//  UserResponse.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Foundation

struct UserResponse: Codable {
    let items: [GithubUser]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct GithubUser: Codable, Identifiable {
    let id: Int
    let login: String

    enum CodingKeys: String, CodingKey {
        case id
        case login
    }

}
