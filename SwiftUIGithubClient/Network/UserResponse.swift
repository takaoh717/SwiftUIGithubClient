//
//  UserResponse.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Foundation

struct UserResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [GithubUser]
}

struct GithubUser: Codable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
    let htmlUrl: String
}
