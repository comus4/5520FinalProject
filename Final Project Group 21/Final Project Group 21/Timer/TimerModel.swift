//
//  TimerModel.swift
//  Final Project Group 21
//
//  Created by Comus Hardman IV on 11/30/24.
//

import SwiftUI
import Observation

@Observable
class TimerModel {
    var elapsedSeconds: Int = 0
    var isRunning: Bool = false
    private var task: Task<Void, Never>?

    func start() {
        guard !isRunning else { return }
        isRunning = true
        task = Task {
            while !Task.isCancelled && isRunning {
                try? await Task.sleep(for: .seconds(1))
                elapsedSeconds += 1
            }
        }
    }

    func stop() {
        isRunning = false
        task?.cancel()
        task = nil
    }

    func reset() {
        stop()
        elapsedSeconds = 0
    }
}
