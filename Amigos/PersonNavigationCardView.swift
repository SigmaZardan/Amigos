//
//  PersonNavigationCardView.swift
//  Amigos
//
//  Created by Bibek Bhujel on 07/11/2024.
//

import SwiftUI

struct PersonNavigationCardView: View {
    let person: Person
    var body: some View {
        GroupBox {
            HStack {
                Text(person.address)
                    .foregroundStyle(Color.white)
                    .lineLimit(1)
                Spacer()
            }
        }label: {
            HStack{
                Text(person.name)
                    .foregroundStyle(Color.yellow.opacity(0.8))
                    .font(.title.bold())
                Spacer()
                GroupBox {
                            Text("\(person.friends.count)")
                        .foregroundStyle(Color.white)
                                .font(.largeTitle.bold())
                                .frame(width: 50)
                }.clipShape(RoundedRectangle(cornerRadius: 12))
                    .backgroundStyle(.black.opacity(0.5))
                    .background(.ultraThinMaterial)
            }
        }
        .backgroundStyle(.black.opacity(0.1))
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()

    }
}


#Preview {
    let person = Person(
        id: "12345", // Example string identifier
        isActive: true,
        name: "John Doe",
        age: 30,
        company: "Tech Innovations",
        email: "john.doe@example.com",
        address: "123 Main St, Springfield, USA",
        about: "A passionate software developer who loves coding and technology.",
        registered: "2023-01-15T12:34:56Z", // ISO 8601 date format
        tags: ["developer", "swift", "ios"],
        friends: [
            Friend(id: "67890", name: "Sandesh Ranabhat"),// Friend 1
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
        ]
    )

    PersonNavigationCardView(person: person)
}
