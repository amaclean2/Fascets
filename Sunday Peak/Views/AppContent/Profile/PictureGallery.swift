//
//  PictureGallery.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/13/24.
//

import SwiftUI

struct PictureGallery: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        TabView {
            ForEach(userViewModel.workingUser?.images ?? [], id: \.self) { image in
                AsyncImage(url: image) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } else if phase.error != nil {
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundStyle(.secondary)
                    } else {
                        ProgressView().controlSize(.regular)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 250)
    }
}

#Preview {
    PictureGallery()
}
