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
                    NavigationLink(destination: UserDetailView(item: item), label: {
                        UserListCell(name: item.login, imageUrl: item.avatarUrl)
                    })
                }.navigationBarTitle("Users")
            } else {
                Text("empty")
            }
        }.onAppear(perform: observed.onAppear)
    }
}
