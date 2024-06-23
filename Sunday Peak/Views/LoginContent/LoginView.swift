//
//  LoginView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("MainLogo").resizable().scaledToFit()
                .padding(.bottom, 50)
                .padding()
            VStack {
                VStack {
                    TextField("email", text: $email)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .autocapitalization(.none)
                        .background(RoundedRectangle(cornerRadius: 4.8).foregroundColor(Color("MainOffLight")))
                    SecureField("password", text: $password)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(RoundedRectangle(cornerRadius: 4.8).foregroundColor(Color("MainOffLight")))
                        
                    Button {
                        userViewModel.handleLogin(email: email, pass: password)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4.8).foregroundStyle(Color("PrimaryAccentColor"))
                            Text("Login").foregroundStyle(Color("MainLight")).bold()
                        }.padding(.vertical)
                    }.frame(height: 70)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.top, 30)
                    
                }.padding(.horizontal)
                
                VStack {
                    Text("Don't yet have an account?")
                    
                }.padding(.vertical)
            }.font(.system(size: 18))
        }.padding(.vertical)
    }
}

#Preview {
    LoginView()
}
