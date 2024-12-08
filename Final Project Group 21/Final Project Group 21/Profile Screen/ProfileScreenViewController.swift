//
//  ProfileScreenViewController.swift
//  Final Project Group 21
//
//  Created by Derek Zhang on 12/2/24.
//

import UIKit
import FirebaseAuth

class ProfileScreenViewController: UIViewController {

    private let profileView = ProfileScreenView()

    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        profileView.buttonSignOut.addTarget(self, action: #selector(onSignOutTapped), for: .touchUpInside)
        
        // Fetch the account details and display them
        let userName = Auth.auth().currentUser?.displayName ?? "Name:"
        let userEmail = Auth.auth().currentUser?.email ?? "Email:"
        
        profileView.labelName.text = "Name: " + userName
        profileView.labelEmail.text = "Email: " + userEmail
    }

    @objc func onSignOutTapped() {
        do {
            try Auth.auth().signOut()
            print("User signed out successfully")

            // Navigate back to the login screen
            let loginVC = LoginScreenViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            UIApplication.shared.windows.first?.rootViewController = navigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
