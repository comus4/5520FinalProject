//
//  SceneDelegate.swift
//  Final Project Group 21
//
//  Created by Nikhil Gupta on 11/11/24.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure the scene is a UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Create a new UIWindow using the provided windowScene
        let window = UIWindow(windowScene: windowScene)

        // Check if a user is already logged in
        if Auth.auth().currentUser != nil {
            // User is logged in, navigate to the main screen
            let mainScreenVC = ViewController()
            let navigationController = UINavigationController(rootViewController: mainScreenVC)
            window.rootViewController = navigationController
        } else {
            // User is not logged in, navigate to the login screen
            let loginVC = LoginScreenViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            window.rootViewController = navigationController
        }

        // Make the window visible
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
    }
}
