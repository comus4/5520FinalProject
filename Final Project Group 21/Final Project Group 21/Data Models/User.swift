//
//  User.swift
//  Final Project Group 21
//
//  Created by Derek Zhang on 12/2/24.
//

import Foundation

struct User {
    let username: String
    let email: String
    let password: String

    // MARK: - Initializer
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }

    // MARK: - Validation Methods
    func isValidUsername() -> Bool {
        return !username.isEmpty
    }

    func isValidEmail() -> Bool {
        // Basic regex for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPassword() -> Bool {
        // Ensure password is at least 6 characters long
        return password.count >= 6
    }

    func isMatchingPassword(_ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
