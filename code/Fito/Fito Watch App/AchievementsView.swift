//
//  AchievementsView.swift
//  Fito Watch App
//
//  Created by Kavin Weerasinghe on 2024-06-14.
//

import SwiftUI

struct Achievement: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var iconName: String
}

struct AchievementsView: View {
    let achievements: [Achievement] = [
        Achievement(title: "First 5K Run", description: "Completed a 5K run", iconName: "figure.walk"),
        Achievement(title: "10,000 Steps", description: "Walked 10,000 steps in a day", iconName: "figure.stand"),
        Achievement(title: "Marathon Runner", description: "Completed a marathon", iconName: "trophy.fill"),
        Achievement(title: "Cyclist", description: "Cycled 100 miles", iconName: "bicycle"),
        Achievement(title: "Swimmer", description: "Swam 10 miles", iconName: "drop.fill")
    ]
    
    var body: some View {
        List(achievements) { achievement in
            HStack {
                Image(systemName: achievement.iconName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text(achievement.title)
                        .font(.headline)
                    Text(achievement.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 10)
        }
        .navigationTitle("Achievements")
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}

