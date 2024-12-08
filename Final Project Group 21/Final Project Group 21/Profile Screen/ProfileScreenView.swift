//
//  ProfileScreenView.swift
//  Final Project Group 21
//
//  Created by Derek Zhang on 12/2/24.
//

import UIKit

class ProfileScreenView: UIView {

    var labelName: UILabel!
    var labelEmail: UILabel!
    var buttonSignOut: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupLabelName()
        setupLabelEmail()
        setupSignOutButton()
        
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "Name: "
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        labelName.textColor = .black
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email: "
        labelEmail.font = UIFont.boldSystemFont(ofSize: 24)
        labelEmail.textColor = .black
        labelEmail.textAlignment = .center
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }

    func setupSignOutButton() {
        buttonSignOut = UIButton(type: .system)
        buttonSignOut.setTitle("Sign Out", for: .normal)
        buttonSignOut.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonSignOut.setTitleColor(.systemRed, for: .normal)
        buttonSignOut.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignOut)

        // Constraints for the Sign Out button
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 36),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSignOut.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 36),
            buttonSignOut.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
