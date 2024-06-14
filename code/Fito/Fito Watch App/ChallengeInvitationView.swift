//
//  ChallengeInvitationView.swift
//  Fito Watch App
//
//  Created by Kavin Weerasinghe on 2024-06-14.
//

import SwiftUI

struct Friend: Identifiable {
    var id = UUID()
    var name: String
}

struct ChallengeInvitationView: View {
    @State private var selectedFriends = Set<UUID>()
    @State private var customMessage = ""
    let friends: [Friend] = [
        Friend(name: "Alice"),
        Friend(name: "Bob"),
        Friend(name: "Charlie"),
        Friend(name: "David"),
        Friend(name: "Eve")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Select Friends to Invite")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(friends) { friend in
                    MultipleSelectionRow(friend: friend, isSelected: selectedFriends.contains(friend.id)) {
                        if selectedFriends.contains(friend.id) {
                            selectedFriends.remove(friend.id)
                        } else {
                            selectedFriends.insert(friend.id)
                        }
                    }
                    .padding(.bottom, 4)
                }
                
                Text("Add a custom message")
                    .font(.subheadline)
                    .padding(.top)
                
                TextField("Custom message", text: $customMessage)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.bottom)
                
                Button(action: sendInvitations) {
                    Text("Send Invitations")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle("Invite Friends")
    }
    
    private func sendInvitations() {
        // Code to send invitations goes here
        print("Invitations sent to: \(selectedFriends.map { id in friends.first { $0.id == id }!.name })")
        print("With message: \(customMessage)")
    }
}

struct MultipleSelectionRow: View {
    var friend: Friend
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(friend.name)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct ChallengeInvitationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeInvitationView()
    }
}
