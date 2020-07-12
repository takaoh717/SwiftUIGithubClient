//
//  UserResponse.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import Foundation

struct UserResponse: Codable, Identifiable {
    let id: String
    let userName: String
    let avatarUrl: URL?
    let htmlUrl: URL
}
