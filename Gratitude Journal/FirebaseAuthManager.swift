//
//  FirebaseAuthManager.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/29/22.
//
import FirebaseAuth
import UIKit

class FirebaseAuthManager {
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool, _ error: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                completionBlock(true, error?.localizedDescription ?? "")
            } else {
                completionBlock(false, error?.localizedDescription ?? "")
            }
        }
    }
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
}
