//
//  ProgressTrackingView.swift
//  Fito Watch App
//
//  Created by Kavin Weerasinghe on 2024-06-14.
//

import SwiftUI

struct ProgressTrackingView: View {
    @State private var progress: Double = 0.5 // Example progress, adjust as needed
    @State private var goal: Double = 100.0 // Example goal, adjust as needed
    @State private var activityType: String = "Running" // Example activity type

    var body: some View {
        VStack {
            Text("Progress Tracking")
                .font(.headline)
                .padding(.top)

            VStack(alignment: .leading, spacing: 10) {
                Text("Activity: \(activityType)")
                    .font(.subheadline)
                
                Text("Goal: \(Int(goal)) units")
                    .font(.subheadline)

                ProgressView(value: progress, total: goal)
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(1)
                    .padding()

                HStack {
                    Text("Progress: \(Int(progress)) units")
                    Spacer()
                    Text("Remaining: \(Int(goal - progress)) units")
                }
                .font(.subheadline)
                .padding(.horizontal)
            }
            .padding()

            Spacer()

            Button(action: updateProgress) {
                Text("Update Progress")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.bottom)
        }
        .padding()
        .navigationTitle("Track Progress")
    }
    
    private func updateProgress() {
        // Update progress logic goes here
        // For example, simulate progress increment
        if progress < goal {
            progress += 10.0
        } else {
            progress = goal
        }
    }
}

struct ProgressTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTrackingView()
    }
}

