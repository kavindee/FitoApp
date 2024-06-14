//
//  ChallengeCreationView.swift
//  Fito Watch App
//
//  Created by Kavin Weerasinghe on 2024-06-14.
//
import SwiftUI

enum ActivityType: String, CaseIterable {
    case running = "Running"
    case cycling = "Cycling"
    case swimming = "Swimming"
    case walking = "Walking"
}

struct ChallengeCreationView: View {
    @State private var selectedActivityType = ActivityType.running
    @State private var goalAmountText = ""
    @State private var goalType = "Distance" // Example, could be Duration, Distance, Calories
    @State private var additionalDetails = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Create Challenge")
                    .font(.headline)
                    .padding(.top)
                
                Picker(selection: $selectedActivityType, label: Text("Select Activity")) {
                    ForEach(ActivityType.allCases, id: \.self) { activity in
                        Text(activity.rawValue)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                HStack {
                    Text("Goal:")
                    Spacer()
                    TextField("Enter goal \(goalType.lowercased())", text: $goalAmountText)
                        .padding()
                        .multilineTextAlignment(.trailing) // Align text to trailing edge
                }
                
                VStack(alignment: .leading) {
                    Text("Additional Details:")
                    TextField("Enter additional details", text: $additionalDetails)
                        .padding()
                        .multilineTextAlignment(.leading) // Align text to leading edge
                        .disableAutocorrection(true) // Disable autocorrection for better user experience
                }
                .padding()
                
                Spacer()
                
                Button(action: createChallenge) {
                    Text("Create Challenge")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom)
            }
            .padding()
            .navigationTitle("Create Challenge")
        }
    }
    
    private func createChallenge() {
        // Convert goalAmountText to Double
        if let goalAmount = Double(goalAmountText) {
            // Implement your logic to create the challenge
            // For example, print out the selected values
            print("Activity Type: \(selectedActivityType.rawValue)")
            print("Goal Amount: \(goalAmount) \(goalType)")
            print("Additional Details: \(additionalDetails)")
            
            // Reset fields after creating challenge
            self.goalAmountText = ""
            selectedActivityType = ActivityType.running
            additionalDetails = ""
        } else {
            // Handle invalid input
            print("Invalid goal amount input")
        }
    }
}

struct ChallengeCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCreationView()
    }
}
