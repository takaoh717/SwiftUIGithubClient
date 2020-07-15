//
//  UserDetailResponse.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/15.
//

import Foundation

struct UserDetail: Codable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
    let htmlUrl: String
}
