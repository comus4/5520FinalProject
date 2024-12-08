//
//  AddExerciseView.swift
//  Final Project Group 21
//
//  Created by Nikhil Gupta on 12/4/24.
//

import UIKit

class AddExerciseView: UIView {
    
    var txtName: UITextField!
    var txtSets: UITextField!
    var txtReps: UITextField!
    var txtRest: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTxtName()
        setupTxtSets()
        setupTxtReps()
        setupTxtRest()
        
        initConstraints()
    }
    
    func setupTxtName() {
        txtName = UITextField()
        txtName.placeholder = "Exercise Name"
        txtName.borderStyle = .roundedRect
        txtName.layer.cornerRadius = 5.0
        txtName.layer.borderWidth = 1.0
        txtName.layer.borderColor = UIColor.gray.cgColor
        txtName.font = UIFont.systemFont(ofSize: 20)
        txtName.attributedPlaceholder = NSAttributedString(
            string: txtName.placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.darkGray // Set the desired color here
            ]
        )
        txtName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(txtName)
    }
    
    func setupTxtSets() {
        txtSets = UITextField()
        txtSets.placeholder = "Sets"
        txtSets.borderStyle = .roundedRect
        txtSets.layer.cornerRadius = 5.0
        txtSets.layer.borderWidth = 1.0
        txtSets.layer.borderColor = UIColor.gray.cgColor
        txtSets.font = UIFont.systemFont(ofSize: 20)
        txtSets.attributedPlaceholder = NSAttributedString(
            string: txtSets.placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.darkGray // Set the desired color here
            ]
        )
        txtSets.keyboardType = .numberPad
        txtSets.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(txtSets)
    }
    
    func setupTxtReps() {
        txtReps = UITextField()
        txtReps.placeholder = "Reps"
        txtReps.borderStyle = .roundedRect
        txtReps.layer.cornerRadius = 5.0
        txtReps.layer.borderWidth = 1.0
        txtReps.layer.borderColor = UIColor.gray.cgColor
        txtReps.font = UIFont.systemFont(ofSize: 20)
        txtReps.attributedPlaceholder = NSAttributedString(
            string: txtReps.placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.darkGray // Set the desired color here
            ]
        )
        txtReps.keyboardType = .numberPad
        txtReps.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(txtReps)
    }
    
    func setupTxtRest() {
        txtRest = UITextField()
        txtRest.placeholder = "Rest (Seconds)"
        txtRest.borderStyle = .roundedRect
        txtRest.layer.cornerRadius = 5.0
        txtRest.layer.borderWidth = 1.0
        txtRest.layer.borderColor = UIColor.gray.cgColor
        txtRest.font = UIFont.systemFont(ofSize: 20)
        txtRest.attributedPlaceholder = NSAttributedString(
            string: txtRest.placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.darkGray // Set the desired color here
            ]
        )
        txtRest.keyboardType = .numberPad
        txtRest.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(txtRest)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            txtName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            txtName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            txtName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            txtSets.topAnchor.constraint(equalTo: txtName.bottomAnchor, constant: 32),
            txtSets.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            txtSets.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            txtReps.topAnchor.constraint(equalTo: txtSets.topAnchor),
            txtReps.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            txtReps.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            txtRest.topAnchor.constraint(equalTo: txtSets.bottomAnchor, constant: 32),
            txtRest.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            txtRest.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
