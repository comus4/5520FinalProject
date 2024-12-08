//
//  AddExerciseViewController.swift
//  Final Project Group 21
//
//  Created by Nikhil Gupta on 12/4/24.
//

import UIKit

class AddExerciseViewController: UIViewController {
    
    // Delegate to contactListController when getting back
    var delegate:AddWorkoutViewController!

    let addExerciseScreen = AddExerciseView()
    
    override func loadView() {
        view = addExerciseScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Exercise"
        // Do any additional setup after loading the view.
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    @objc func hideKeyboardOnTap() {
        view.endEditing(true)
    }
    
    @objc func onAddBarButtonTapped() {
        guard let name = addExerciseScreen.txtName.text, !name.isEmpty,
              let setsText = addExerciseScreen.txtSets.text, let sets = Int(setsText),
              let repsText = addExerciseScreen.txtReps.text, let reps = Int(repsText),
              let restText = addExerciseScreen.txtRest.text, let rest = Int(restText) else {
              
            showErrorAlert(message: "All fields required")
            return
          }
        
        let exercise = Exercise(name: name, sets: sets, reps: reps, rest: rest)
        delegate.delegateOnAddExercise(exercise: exercise)
        navigationController?.popViewController(animated: true)
    }
    
    //Error alert
    func showErrorAlert(message: String){
        let alert = UIAlertController(
            title: "Error", message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
}
