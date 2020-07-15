//
//  UserDetailView.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/13.
//

import SwiftUI

struct UserDetailView: View {

    var item: User

    @ObservedObject private var imageDownloader = ImageDownloader()

    init(item: User) {
        self.item = item
        self.imageDownloader.downloadImage(url: item.avatarUrl)
    }

    var body: some View {
        VStack {
            HStack {
                if let imageData = self.imageDownloader.downloadData, let image = UIImage(data: imageData) {
                    Image(uiImage: image).resizable().frame(width: 100, height: 100, alignment: .center).aspectRatio(contentMode: .fit).cornerRadius(50)
                }
                Text(item.login)
            }
            Text(item.htmlUrl)
        }
    }
}
