//
//  AuthViewModel.swift
//  canteenApp
//
//  Created by Macbook Pro on 17/09/2022.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, pass: String) {
        auth.signIn(withEmail: email, password: pass) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, pass: String) {
        auth.createUser(withEmail: email, password: pass) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
}
