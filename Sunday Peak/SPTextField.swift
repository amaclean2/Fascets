//
//  SPTextField.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI

struct SPTextField: TextFieldStyle {
    func body(configuration: TextField<Self)
}

struct SPTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .foregroundColor(Color("TextAreaBackgroundColor"))
            .cornerRadius(8)
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            .disableAutocorrection(true)
    }
}

extension View {
    func spTextFieldStyle() -> some View {
        self.modifier(SPTextFieldModifier())
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        @State var textContent = "andrew.n.maclean@gmail.com"
        TextField("email", text: $textContent).spTextFieldStyle()
    }
}
