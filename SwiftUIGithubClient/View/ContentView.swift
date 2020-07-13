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

struct ContentListCell: View {

    var name: String = ""
    var imageUrl: String = ""

    @ObservedObject private var imageDownloader = ImageDownloader()

    init(name: String, imageUrl: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.imageDownloader.downloadImage(url: imageUrl)
    }

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            if let imageData = self.imageDownloader.downloadData, let image = UIImage(data: imageData) {
                Image(uiImage: image).resizable().frame(width: 30, height: 30, alignment: .center).aspectRatio(contentMode: .fit).cornerRadius(10)
            }
        }
    }
}
