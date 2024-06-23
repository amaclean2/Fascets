//
//  SwiftUIView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/13/24.
//

import SwiftUI

struct ProfileImage: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        let imageUrl = userViewModel.workingUser?.profilePictureURL
        AsyncImage(url: imageUrl) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .font(.title)
                    .foregroundStyle(.secondary)
            } else {
                ProgressView().controlSize(.regular)
            }
        }
        .frame(width: 120, height: 120)
        .clipShape(Circle())
    }
}

#Preview {
    ProfileImage()
}
