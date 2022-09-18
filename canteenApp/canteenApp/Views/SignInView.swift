//
//  AccountView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = "c@test.com"
    @State var pass = "123456"
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var centralUserManager : UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $pass)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !pass.isEmpty else {
                            return
                        }
                        
                        authViewModel.signIn(email: email, pass: pass)
                        
                    }, label: {
                        Text("Sign In")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(Color.white)
                    })
                    
                    NavigationLink("Create Account",destination: SignUpView().environmentObject(authViewModel)
                        .environmentObject(centralUserManager)
                    )
                        .padding()
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Sign In")
    }
}

struct xView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

