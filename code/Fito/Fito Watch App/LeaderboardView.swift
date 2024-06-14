//
//  LeaderboardView.swift
//  Fito Watch App
//
//  Created by Kavin Weerasinghe on 2024-06-14.
//

import SwiftUI

struct Participant: Identifiable {
    var id = UUID()
    var name: String
    var progress: Double
}

struct LeaderboardView: View {
    let participants: [Participant] = [
        Participant(name: "Alice", progress: 80.0),
        Participant(name: "Bob", progress: 60.0),
        Participant(name: "Charlie", progress: 50.0),
        Participant(name: "David", progress: 40.0),
        Participant(name: "Eve", progress: 30.0)
    ]
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.headline)
                .padding(.top)
            
            List(participants) { participant in
                HStack {
                    Text("\(participant.name)")
                    Spacer()
                    Text("\(Int(participant.progress))%")
                }
                .padding()
            }
        }
        .navigationTitle("Leaderboard")
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}

