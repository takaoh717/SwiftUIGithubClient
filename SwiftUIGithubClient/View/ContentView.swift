//
//  ContentView.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/12.
//

import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject var observed = SearchUserViewModel()

    var body: some View {
        NavigationView {
            Text(observed.displayData?.items.first?.login ?? "none")
        }.onAppear(perform: observed.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
