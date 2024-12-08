//
//  ViewController.swift
//  Final Project Group 21
//
//  Created by Nikhil Gupta on 11/11/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
    var workoutsList = [Workout]()
    let database = Firestore.firestore()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My workouts..."
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        mainScreen.tableViewWorkouts.delegate = self
        mainScreen.tableViewWorkouts.dataSource = self
        
        mainScreen.buttonProfile.addTarget(self, action: #selector(onButtonProfileTapped), for: .touchUpInside)
        mainScreen.buttonAddWorkout.addTarget(self, action: #selector(onButtonAddWorkoutTapped), for: .touchUpInside)
        mainScreen.buttonPostWorkoutPhoto.addTarget(self, action: #selector(onButtonPostWorkoutPhotoTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = Auth.auth().currentUser {
            let allWorkouts = database.collection("users").document(user.uid).collection("workouts")
            Task {
                do {
                    let querySnapshot = try await allWorkouts.getDocuments()
                    
                    self.workoutsList.removeAll()
                    for document in querySnapshot.documents {
                        let workoutData = try document.data(with: ServerTimestampBehavior(rawValue: 2)!)
                        var workout = Workout(
                            name: workoutData["name"] as! String,
                            exerciseInterval: workoutData["exercise_interval"] as! Int,
                            exercises: []
                        )
                        
                        let qs2 = try await allWorkouts.document(document.documentID).collection("exercises").getDocuments()
                        for exerciseDoc in qs2.documents {
                            let exerciseData = try exerciseDoc.data(with: ServerTimestampBehavior(rawValue: 2)!)
                            let exercise = Exercise(
                                name: exerciseData["name"] as! String,
                                sets: exerciseData["sets"] as! Int,
                                reps: exerciseData["reps"] as! Int,
                                rest: exerciseData["rest"] as! Int
                            )
                            workout.exercises.append(exercise)
                        }
                        
                        self.workoutsList.append(workout)
                    }
                    
                    self.workoutsList.sort(by: { $0.name < $1.name })
                    self.mainScreen.tableViewWorkouts.reloadData()
                } catch {
                    print("Error getting docs— \(error)")
                }
            }
        }
    }
    
    @objc func onButtonProfileTapped() {
        let profileVC = ProfileScreenViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc func onButtonAddWorkoutTapped() {
        let addWorkoutController = AddWorkoutViewController()
        addWorkoutController.workout = nil
        navigationController?.pushViewController(addWorkoutController, animated: true)
    }
    
    @objc func onButtonPostWorkoutPhotoTapped() {
        let hostingController = UIHostingController(rootView: PostWorkoutPhotoView())
        navigationController?.pushViewController(hostingController, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewWorkoutsID, for: indexPath) as! WorkoutsTableViewCell
        cell.labelName.text = workoutsList[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWorkout = workoutsList[indexPath.row]
        let timerView = TimerView(workout: selectedWorkout)
        let hostingController = UIHostingController(rootView: timerView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
