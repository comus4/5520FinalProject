//
//  TimerView.swift
//  Final Project Group 21
//
//  Created by Comus Hardman IV on 11/30/24.
//


import SwiftUI

struct TimerView: View {
    let workout: Workout
    @State private var remainingTime: Int = 0
    @State private var isRunning: Bool = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Workout is \(workout.name)")
                .font(.largeTitle)
                .padding()

            Text("Time left... \(formatTime(seconds: remainingTime))")
                .font(.title)
                .foregroundColor(remainingTime > 0 ? .black : .red)
                .padding()

            HStack(spacing: 20) {
                Button(action: startTimer) {
                    Text("Start")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isRunning)

                Button(action: pauseTimer) {
                    Text("Pause")
                        .font(.title)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .disabled(!isRunning)

                Button(action: resetTimer) {
                    Text("Reset")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .onAppear {
            resetTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    
    func startTimer() {
        if remainingTime > 0 {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if remainingTime > 0 {
                    remainingTime -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    func pauseTimer() {
        isRunning = false
        stopTimer()
    }
    
    func resetTimer() {
        stopTimer()
        remainingTime = workout.exerciseInterval
        isRunning = false
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    //Helper func
    
    func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
