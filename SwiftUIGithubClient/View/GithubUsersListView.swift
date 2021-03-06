//
//  GithubUsersList.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/13.
//

import SwiftUI
import Combine

struct UsersListView: View {

    @ObservedObject var observed = SearchUserViewModel()

    var body: some View {
        NavigationView {
            if let items = observed.displayData?.items {
                List(items) { item in
                    UserListCell(name: item.login, imageUrl: item.avatarUrl)
                }
            } else {
                Text("empty")
            }
        }.navigationBarTitle("Users").onAppear(perform: observed.onAppear)
    }
}
