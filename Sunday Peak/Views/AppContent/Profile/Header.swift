//
//  Header.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/14/24.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                ProfileImage()
                Text("\(userViewModel.workingUser?.firstName ?? "") \(userViewModel.workingUser?.lastName ?? "")")
                    .font(.headline)
                    .foregroundStyle(Color("PrimaryAccentColor"))
            }
            .frame(width: 150)
            VStack(alignment: .leading, spacing: 10) {
                Text(userViewModel.workingUser?.city ?? "")
                    .font(.subheadline)
                Text(userViewModel.workingUser?.bio ?? "")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    Header()
}
