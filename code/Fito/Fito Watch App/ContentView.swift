//
//  ContentView.swift
//  Fito Watch App
//
//  Created by Kavin Weerasinghe on 2024-06-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ChallengeCreationView()) {
                    Text("Create a Challenge")
                }
                NavigationLink(destination: ChallengeInvitationView()) {
                    Text("Invite Friends to a Challenge")
                }
                NavigationLink(destination: ProgressTrackingView()) {
                    Text("Track Your Progress")
                }
                NavigationLink(destination: LeaderboardView()) {
                    Text("View Leaderboard")
                }
                NavigationLink(destination: AchievementsView()) {
                    Text("View Achievements")
                }
            }
            .navigationBarTitle("Fitness Challenge Companion")
        }
    }
}

#Preview {
    ContentView()
}
