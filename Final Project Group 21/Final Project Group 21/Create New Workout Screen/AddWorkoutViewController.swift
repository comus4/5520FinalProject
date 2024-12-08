//
//  AddWorkoutViewController.swift
//  Final Project Group 21
//
//  Created by MAD2 on 11/29/24.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

class AddWorkoutViewController: UIViewController {
    
    
    let addWorkoutScreen = AddWorkoutView()
    var workout: Workout!
    var exercisesList = [Exercise]()
    let database = Firestore.firestore()
    
    override func loadView() {
        view = addWorkoutScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Workout"
        
        addWorkoutScreen.tableViewExercises.delegate = self
        addWorkoutScreen.tableViewExercises.dataSource = self
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        addWorkoutScreen.buttonAddExercise.addTarget(self, action: #selector(onButtonAddExerciseTapped), for: .touchUpInside)
        addWorkoutScreen.buttonSaveWorkout.addTarget(self, action: #selector(onSaveWorkoutButtonTapped), for: .touchUpInside)
    }
    
    @objc func hideKeyboardOnTap() {
        view.endEditing(true)
    }
    
    
    @objc func onButtonAddExerciseTapped() {
        let addExerciseVC = AddExerciseViewController()
        addExerciseVC.delegate = self
        navigationController?.pushViewController(addExerciseVC, animated: true)
    }
    
    // Add the contact to the list
    func delegateOnAddExercise(exercise:Exercise) {
        exercisesList.append(exercise)
        addWorkoutScreen.tableViewExercises.reloadData()
    }
        
        @objc func onSaveWorkoutButtonTapped() {
            
            if self.workout == nil {
                
                if (addWorkoutScreen.textFieldName.text!.isEmpty) {
                    return
                }
                
                if (addWorkoutScreen.textFieldExerciseInterval.text!.isEmpty) {
                    return
                }
                
                self.workout = Workout(name: addWorkoutScreen.textFieldName.text!, exerciseInterval: Int(addWorkoutScreen.textFieldExerciseInterval.text!) ?? 0, exercises:
                                        self.exercisesList)
                //todo add the exercises from the exercise screen into this list rather than these fake ones I put in for testing
                
            }
            
            //todo update self.workout regardless
            
            if let user = Auth.auth().currentUser {
                let collectionWorkouts = database
                    .collection("users")
                    .document(user.email!)
                    .collection("workouts")
                do {
                    //print("start add")
                    let ref =  database.collection("users").document(String(user.uid)).collection("workouts").addDocument(data: [
                        "name": self.workout.name,
                        "exercise_interval": self.workout.exerciseInterval
                    ])
                    //print("Document added with ID: \(ref.documentID)")
                    
                    //for each exercise, add it
                    for exercise in self.workout.exercises {
                        
                        let ref2 =
                        database.collection("users").document(String(user.uid)).collection("workouts").document(String(ref.documentID)).collection("exercises").addDocument(data: [
                            "name": exercise.name,
                            "sets": exercise.sets,
                            "reps": exercise.reps,
                            "rest": exercise.rest
                        ])
                        
                    }
                    
                }
            }
            
            navigationController?.popViewController(animated: true)
            
        }
        
    }


extension AddWorkoutViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewExercisesID, for: indexPath) as! ExercisesTableViewCell
        cell.labelName.text = exercisesList[indexPath.row].name
        cell.labelSetsAndReps.text = String(exercisesList[indexPath.row].reps) + " x " + String(exercisesList[indexPath.row].sets)
        cell.labelRest.text = String(exercisesList[indexPath.row].rest) + " seconds"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){ //getMessages(id: self.workoutsList[indexPath.row].id!)
        //todo launch the add exercise screen from here
    }
}
