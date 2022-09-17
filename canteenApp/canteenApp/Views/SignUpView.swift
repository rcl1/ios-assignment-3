//
//  SignUpView.swift
//  canteenApp
//
//  Created by Macbook Pro on 17/09/2022.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var pass = ""
    @State var name = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var centralUserManager : UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .disableAutocorrection(true)
                    
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
                        
                        authViewModel.signUp(email: email, pass: pass)
                        centralUserManager.addNewUser(name: name, email: email)
                        
                    }, label: {
                        Text("Sign Up")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(Color.white)
                    })
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Sign Up")
        }
    }
}
