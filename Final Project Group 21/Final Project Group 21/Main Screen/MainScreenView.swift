//
//  MainScreenView.swift
//  Final Project Group 21
//
//  Created by MAD2 on 11/27/24.
//

import UIKit

class MainScreenView: UIView {
    var buttonAddWorkout: UIButton!
    var buttonProfile: UIButton!
    var buttonPostWorkoutPhoto: UIButton!
    var tableViewWorkouts: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupTableViewWorkouts()
        setupAddWorkoutButton()
        setupProfileButton()
        setupPostWorkoutPhotoButton()
        initConstraints()
    }

    func setupTableViewWorkouts() {
        tableViewWorkouts = UITableView()
        tableViewWorkouts.register(WorkoutsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewWorkoutsID)
        tableViewWorkouts.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewWorkouts)
    }

    func setupAddWorkoutButton() {
        buttonAddWorkout = UIButton(type: .system)
        buttonAddWorkout.setTitle("Add Workout", for: .normal)
        buttonAddWorkout.backgroundColor = .systemGreen
        buttonAddWorkout.layer.cornerRadius = 16
        buttonAddWorkout.setTitleColor(.white, for: .normal)
        buttonAddWorkout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAddWorkout)
    }

    func setupProfileButton() {
        buttonProfile = UIButton(type: .system)
        buttonProfile.setTitle("Profile", for: .normal)
        buttonProfile.backgroundColor = .systemBlue
        buttonProfile.layer.cornerRadius = 16
        buttonProfile.setTitleColor(.white, for: .normal)
        buttonProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonProfile)
    }

    func setupPostWorkoutPhotoButton() {
        buttonPostWorkoutPhoto = UIButton(type: .system)
        buttonPostWorkoutPhoto.setTitle("Post-Workout photo", for: .normal)
        buttonPostWorkoutPhoto.backgroundColor = .systemOrange
        buttonPostWorkoutPhoto.layer.cornerRadius = 16
        buttonPostWorkoutPhoto.setTitleColor(.white, for: .normal)
        buttonPostWorkoutPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonPostWorkoutPhoto)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewWorkouts.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewWorkouts.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewWorkouts.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewWorkouts.bottomAnchor.constraint(equalTo: buttonAddWorkout.topAnchor, constant: -16),

            buttonAddWorkout.heightAnchor.constraint(equalToConstant: 48),
            buttonAddWorkout.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAddWorkout.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: -8),
            buttonAddWorkout.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),

            buttonProfile.heightAnchor.constraint(equalToConstant: 48),
            buttonProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 8),
            buttonProfile.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonProfile.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),

            buttonPostWorkoutPhoto.heightAnchor.constraint(equalToConstant: 48),
            buttonPostWorkoutPhoto.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonPostWorkoutPhoto.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonPostWorkoutPhoto.bottomAnchor.constraint(equalTo: buttonAddWorkout.topAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
