//
//  GithubUsersList.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/13.
//

import SwiftUI
import Combine

struct GithubUsersListView: View {

    @ObservedObject var observed = SearchUserViewModel()

    var body: some View {
        NavigationView {
            if let items = observed.displayData?.items {
                List(items) { item in
                    ContentListCell(name: item.login, imageUrl: item.avatarUrl)
                }
            } else {
                Text("empty")
            }
        }.navigationTitle("Users").onAppear(perform: observed.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
