//
//  Breadcrumb.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/21/24.
//

import SwiftUI

struct Breadcrumb: View {
    var breadcrumb: [BreadcrumbObject]
    
    var body: some View {
        HStack {
            ForEach(breadcrumb) { crumb in
                Text(crumb.name)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 3)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("MainOffLight"))
        }
    }
}

#Preview {
    Breadcrumb(breadcrumb: [BreadcrumbObject(id: 5, adventureType: .ski, name: "New Area", categoryType: .zone), BreadcrumbObject(id: 6, adventureType: .ski, name: "Parent Area", categoryType: .zone)])
}
