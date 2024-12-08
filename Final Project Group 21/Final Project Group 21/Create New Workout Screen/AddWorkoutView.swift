//
//  AddWorkoutView.swift
//  Final Project Group 21
//
//  Created by MAD2 on 11/29/24.
//

import Foundation
import UIKit

class AddWorkoutView: UIView {
    
    var textFieldName: UITextField!
    var textFieldExerciseInterval: UITextField!
    var tableViewExercises: UITableView!
    
    var buttonAddExercise: UIButton!
    var buttonSaveWorkout: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldExerciseInterval()
        setupTableViewExercises()
        setupButtonAddExercise()
        setupButtonSaveWorkout()
        
        initConstraints()
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Workout Name"
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        textFieldName.layer.borderColor = CGColor(red: 0.4, green: 0.4, blue: 0.4, alpha:1)
        textFieldName.layer.borderWidth = 1
        textFieldName.layer.cornerRadius = 4
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldExerciseInterval(){
        textFieldExerciseInterval = UITextField()
        textFieldExerciseInterval.placeholder = "Exercise Interval (Seconds)"
        textFieldExerciseInterval.translatesAutoresizingMaskIntoConstraints = false
        textFieldExerciseInterval.layer.borderColor = CGColor(red: 0.4, green: 0.4, blue: 0.4, alpha:1)
        textFieldExerciseInterval.layer.borderWidth = 1
        textFieldExerciseInterval.layer.cornerRadius = 4
        textFieldExerciseInterval.keyboardType = .numberPad
        self.addSubview(textFieldExerciseInterval)
    }
    
    func setupTableViewExercises(){
        tableViewExercises = UITableView()
        tableViewExercises.register(ExercisesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewExercisesID)
        tableViewExercises.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewExercises)
    }
    
    func setupButtonAddExercise(){
        buttonAddExercise = UIButton(type: .system)
        buttonAddExercise.setTitle("Add Exercise", for: .normal)
        buttonAddExercise.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAddExercise)
    }
    
    func setupButtonSaveWorkout(){
        buttonSaveWorkout = UIButton(type: .system)
        buttonSaveWorkout.setTitle("Save Workout", for: .normal)
        buttonSaveWorkout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSaveWorkout)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldExerciseInterval.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldExerciseInterval.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldExerciseInterval.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldExerciseInterval.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSaveWorkout.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonSaveWorkout.topAnchor.constraint(equalTo: buttonSaveWorkout.bottomAnchor, constant: -48),
            buttonSaveWorkout.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAddExercise.bottomAnchor.constraint(equalTo: buttonSaveWorkout.topAnchor, constant: -16),
            buttonAddExercise.topAnchor.constraint(equalTo: buttonAddExercise.bottomAnchor, constant: -48),
            buttonAddExercise.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tableViewExercises.topAnchor.constraint(equalTo: self.textFieldExerciseInterval.bottomAnchor, constant: 8),
            tableViewExercises.bottomAnchor.constraint(equalTo: self.buttonAddExercise.topAnchor, constant: -8),
            tableViewExercises.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewExercises.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
