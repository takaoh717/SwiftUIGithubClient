//
//  UserListCell.swift
//  SwiftUIGithubClient
//
//  Created by Takao Horiguchi on 2020/07/13.
//

import SwiftUI

struct UserListCell: View {

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
